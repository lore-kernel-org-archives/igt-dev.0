Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC3D6E523
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2020 10:50:24 +0000 (UTC)
Date: Wed, 10 Jun 2020 13:50:21 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200610105021.GJ9497@platvala-desk.ger.corp.intel.com>
References: <20200609142137.203218-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609142137.203218-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner/resultgen: Explain why json
 creation might have failed
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 09, 2020 at 05:21:37PM +0300, Arkadiusz Hiler wrote:
> Sometimes creating the string representation fails. This usually happens
> when we have a huge logs (e.g.: something was spamming the dmesg) or the
> result generation was run on a very low-end system (e.g. embedded board
> with 256 megs of RAM).
> 
> Sadly json-c call returns us NULL and provides no explanation
> whatsoever. Let's fix a NULL pointer dereference in such cases and print
> a mesage that should help people make sense out of what have just
> happened.
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  runner/resultgen.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index add4aad5..e2e162b0 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -1661,6 +1661,19 @@ bool generate_results(int dirfd)
>  	}
>  
>  	json_string = json_object_to_json_string_ext(obj, JSON_C_TO_STRING_PRETTY);
> +
> +	if (json_string == NULL) {
> +		fprintf(stderr, "resultgen: Failed to create json representation of the results.\n");
> +		fprintf(stderr, "           This usually means that the results are too big\n");
> +		fprintf(stderr, "           to fit in the memory as the text representation\n");
> +		fprintf(stderr, "           is being created.\n\n");
> +		fprintf(stderr, "           Either something was spamming the logs or your\n");
> +		fprintf(stderr, "           system is very low on free mem.\n");
> +
> +		close(resultsfd);
> +		return false;
> +	}
> +


There are some obvious arguments that can be made here so I'll tackle
them myself:

"Why not use the serializer function in json-c that directly outputs
to a file?"

That function is implemented with a call to
json_object_to_json_string_ext(). No gain here.

"Why not try to fall back to JSON_C_TO_STRING_PLAIN for a shorter
string result?"

A reasonable argument, but offers very little hope. If we reach this
case it's a heck of a long string as one of the logs and reducing the
overhead of the prettifying won't help much relatively.

An option to limit the disk space usage of a test is in the works and
that will help tackle the root cause of this happening. I assert that
no one really believes it's normal for a single test to log multiple
gigabytes.


Reviewed-by: Petri Latvala <petri.latvala@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
