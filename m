Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F176E0E4
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jul 2018 00:54:26 +0000 (UTC)
References: <20180712105958.12953-1-tvrtko.ursulin@linux.intel.com>
 <20180712105958.12953-9-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <fd70baf5-7297-2f0b-5523-3c33b5705f91@Intel.com>
Date: Thu, 12 Jul 2018 17:54:25 -0700
MIME-Version: 1.0
In-Reply-To: <20180712105958.12953-9-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 8/9] trace.pl: Basic preemption support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0639892938=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0639892938==
Content-Type: multipart/alternative;
 boundary="------------0D8B005B4FBF0AB474953F61"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0D8B005B4FBF0AB474953F61
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/12/2018 3:59 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Just forget about earlier request_in events.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   scripts/trace.pl | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/trace.pl b/scripts/trace.pl
> index 33045f3264f2..43c68001d768 100755
> --- a/scripts/trace.pl
> +++ b/scripts/trace.pl
> @@ -438,7 +438,9 @@ while (<>) {
>   	} elsif ($tp_name eq 'i915:i915_request_in:') {
>   		my %req;
>   
> -		die if exists $db{$key};
> +		# preemption
> +		delete $db{$key} if exists $db{$key};
> +
>   		die unless exists $queue{$key};
>   		die unless exists $submit{$key};
>   

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


--------------0D8B005B4FBF0AB474953F61
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/12/2018 3:59 AM, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:20180712105958.12953-9-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>

Just forget about earlier request_in events.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
---
 scripts/trace.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/trace.pl b/scripts/trace.pl
index 33045f3264f2..43c68001d768 100755
--- a/scripts/trace.pl
+++ b/scripts/trace.pl
@@ -438,7 +438,9 @@ while (&lt;&gt;) {
 	} elsif ($tp_name eq 'i915:i915_request_in:') {
 		my %req;
 
-		die if exists $db{$key};
+		# preemption
+		delete $db{$key} if exists $db{$key};
+
 		die unless exists $queue{$key};
 		die unless exists $submit{$key};
 
</pre>
    </blockquote>
    <br>
    Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E"
      href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a><br>
    <pre wrap="">
</pre>
  </body>
</html>

--------------0D8B005B4FBF0AB474953F61--

--===============0639892938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0639892938==--
