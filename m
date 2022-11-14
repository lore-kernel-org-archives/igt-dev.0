Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5D110E0A0
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Nov 2022 12:52:55 +0000 (UTC)
Date: Mon, 14 Nov 2022 13:52:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y3I6Ik4VlWD4hUlg@kamilkon-desk1>
References: <20221111080529.2427645-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221111080529.2427645-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Fix a memory leak in
 stderr_contains_warnings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-11-11 at 10:05:29 +0200, Petri Latvala wrote:
> The matches object's internals weren't released.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  runner/resultgen.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 3d753828..21a3ed84 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -1912,6 +1912,8 @@ static bool stderr_contains_warnings(const char *beg, const char *end)
>  		i++;
>  	}
>  
> +	free_matches(&matches);
> +
>  	return false;
>  }
>  
> -- 
> 2.30.2
> 
