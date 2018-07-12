Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180709132004.14468-1-tvrtko.ursulin@linux.intel.com>
 <20180709132004.14468-8-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <f80a0fcd-e630-58cb-0fc6-79822791dfc6@Intel.com>
Date: Wed, 11 Jul 2018 23:38:54 -0700
MIME-Version: 1.0
In-Reply-To: <20180709132004.14468-8-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 07/11] trace.pl: Fix engine busy
 accounting in split mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0286740371=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0286740371==
Content-Type: multipart/alternative;
 boundary="------------E7FA0824A4B923ED39F90064"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E7FA0824A4B923ED39F90064
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/2018 6:20 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> In split mode all requests have to be added up since they were previously
> re-arranged so there is no overlap.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: John Harrison <John.C.Harrison@intel.com>
> ---
>   scripts/trace.pl | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/trace.pl b/scripts/trace.pl
> index 60a8e441c1d9..52372e224da5 100755
> --- a/scripts/trace.pl
> +++ b/scripts/trace.pl
> @@ -612,7 +612,8 @@ foreach my $key (@sorted_keys) {
>   	$db{$key}->{'submit-delay'} = $db{$key}->{'submit'} - $db{$key}->{'queue'};
>   	$db{$key}->{'duration'} = $notify - $start;
>   
> -	$running{$ring} += $end - $start unless exists $db{$key}->{'no-end'};
> +	$running{$ring} += $end - $start if $correct_durations or
> +					    not exists $db{$key}->{'no-end'};
>   	$runnable{$ring} += $db{$key}->{'execute-delay'};
>   	$queued{$ring} += $start - $db{$key}->{'execute-delay'} - $db{$key}->{'queue'};
>   

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


--------------E7FA0824A4B923ED39F90064
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/9/2018 6:20 AM, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:20180709132004.14468-8-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>

In split mode all requests have to be added up since they were previously
re-arranged so there is no overlap.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@intel.com">&lt;John.C.Harrison@intel.com&gt;</a>
---
 scripts/trace.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/trace.pl b/scripts/trace.pl
index 60a8e441c1d9..52372e224da5 100755
--- a/scripts/trace.pl
+++ b/scripts/trace.pl
@@ -612,7 +612,8 @@ foreach my $key (@sorted_keys) {
 	$db{$key}-&gt;{'submit-delay'} = $db{$key}-&gt;{'submit'} - $db{$key}-&gt;{'queue'};
 	$db{$key}-&gt;{'duration'} = $notify - $start;
 
-	$running{$ring} += $end - $start unless exists $db{$key}-&gt;{'no-end'};
+	$running{$ring} += $end - $start if $correct_durations or
+					    not exists $db{$key}-&gt;{'no-end'};
 	$runnable{$ring} += $db{$key}-&gt;{'execute-delay'};
 	$queued{$ring} += $start - $db{$key}-&gt;{'execute-delay'} - $db{$key}-&gt;{'queue'};
 
</pre>
    </blockquote>
    <br>
    Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E"
      href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a><br>
    <br>
  </body>
</html>

--------------E7FA0824A4B923ED39F90064--

--===============0286740371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0286740371==--
