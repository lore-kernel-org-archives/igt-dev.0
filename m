Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A636EC67
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jul 2018 20:11:11 +0000 (UTC)
References: <20180718094514.5903-1-tvrtko.ursulin@linux.intel.com>
 <20180718094514.5903-6-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <ca84f1bd-66b2-6be3-6d0d-550de5f20680@Intel.com>
Date: Wed, 18 Jul 2018 13:11:10 -0700
MIME-Version: 1.0
In-Reply-To: <20180718094514.5903-6-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 5/8] trace.pl: Context save only applies
 to last request of a bunch
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1657546574=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1657546574==
Content-Type: multipart/alternative;
 boundary="------------C25D29AEC868A292216ECB4D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C25D29AEC868A292216ECB4D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/2018 2:45 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Skip accounting the context save time for anything but the last request of
> the coalesced bunch, and also skip drawing those boxes on the timeline.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   scripts/trace.pl | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/trace.pl b/scripts/trace.pl
> index 575fe83d8550..deb17e4a1816 100755
> --- a/scripts/trace.pl
> +++ b/scripts/trace.pl
> @@ -577,7 +577,11 @@ foreach my $key (@sorted_keys) {
>   	$min_ctx = $db{$key}->{'ctx'} if not defined $min_ctx or
>   					 $db{$key}->{'ctx'} < $min_ctx;
>   
> -	$db{$key}->{'context-complete-delay'} = $end - $notify;
> +	unless (exists $db{$key}->{'no-end'}) {
> +		$db{$key}->{'context-complete-delay'} = $end - $notify;
> +	} else {
> +		$db{$key}->{'context-complete-delay'} = 0;
> +	}
>   	$db{$key}->{'execute-delay'} = $start - $db{$key}->{'submit'};
>   	$db{$key}->{'submit-delay'} = $db{$key}->{'submit'} - $db{$key}->{'queue'};
>   	$db{$key}->{'duration'} = $notify - $start;
> @@ -594,7 +598,7 @@ foreach my $key (@sorted_keys) {
>   
>   	$submit_avg{$ring} += $db{$key}->{'submit-delay'};
>   	$execute_avg{$ring} += $db{$key}->{'execute-delay'};
> -	$ctxsave_avg{$ring} += $end - $notify;
> +	$ctxsave_avg{$ring} += $db{$key}->{'context-complete-delay'};
>   }
>   
>   foreach my $ring (sort keys %batch_avg) {
> @@ -1045,7 +1049,7 @@ foreach my $key (sort sortQueue keys %db) {
>   	}
>   
>   	# user interrupt to context complete
> -	unless (exists $skip_box{'ctxsave'}) {
> +	unless (exists $skip_box{'ctxsave'} or exists $db{$key}->{'no-end'}) {
>   		$skey = -2 * $max_seqno * $ctx - 2 * $seqno;
>   		$style = box_style($ctx, 'ctxsave');
>   		my $ctxsave = $db{$key}->{'end'} - $db{$key}->{'notify'};

Dunno if you missed it but I definitely sent an r-b to this patch in the 
last series. And I can't see any changes since, so...

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


--------------C25D29AEC868A292216ECB4D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/18/2018 2:45 AM, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:20180718094514.5903-6-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>

Skip accounting the context save time for anything but the last request of
the coalesced bunch, and also skip drawing those boxes on the timeline.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
---
 scripts/trace.pl | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/trace.pl b/scripts/trace.pl
index 575fe83d8550..deb17e4a1816 100755
--- a/scripts/trace.pl
+++ b/scripts/trace.pl
@@ -577,7 +577,11 @@ foreach my $key (@sorted_keys) {
 	$min_ctx = $db{$key}-&gt;{'ctx'} if not defined $min_ctx or
 					 $db{$key}-&gt;{'ctx'} &lt; $min_ctx;
 
-	$db{$key}-&gt;{'context-complete-delay'} = $end - $notify;
+	unless (exists $db{$key}-&gt;{'no-end'}) {
+		$db{$key}-&gt;{'context-complete-delay'} = $end - $notify;
+	} else {
+		$db{$key}-&gt;{'context-complete-delay'} = 0;
+	}
 	$db{$key}-&gt;{'execute-delay'} = $start - $db{$key}-&gt;{'submit'};
 	$db{$key}-&gt;{'submit-delay'} = $db{$key}-&gt;{'submit'} - $db{$key}-&gt;{'queue'};
 	$db{$key}-&gt;{'duration'} = $notify - $start;
@@ -594,7 +598,7 @@ foreach my $key (@sorted_keys) {
 
 	$submit_avg{$ring} += $db{$key}-&gt;{'submit-delay'};
 	$execute_avg{$ring} += $db{$key}-&gt;{'execute-delay'};
-	$ctxsave_avg{$ring} += $end - $notify;
+	$ctxsave_avg{$ring} += $db{$key}-&gt;{'context-complete-delay'};
 }
 
 foreach my $ring (sort keys %batch_avg) {
@@ -1045,7 +1049,7 @@ foreach my $key (sort sortQueue keys %db) {
 	}
 
 	# user interrupt to context complete
-	unless (exists $skip_box{'ctxsave'}) {
+	unless (exists $skip_box{'ctxsave'} or exists $db{$key}-&gt;{'no-end'}) {
 		$skey = -2 * $max_seqno * $ctx - 2 * $seqno;
 		$style = box_style($ctx, 'ctxsave');
 		my $ctxsave = $db{$key}-&gt;{'end'} - $db{$key}-&gt;{'notify'};
</pre>
    </blockquote>
    <br>
    Dunno if you missed it but I definitely sent an r-b to this patch in
    the last series. And I can't see any changes since, so...<br>
    <br>
    Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E"
      href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a><br>
    <br>
  </body>
</html>

--------------C25D29AEC868A292216ECB4D--

--===============1657546574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1657546574==--
