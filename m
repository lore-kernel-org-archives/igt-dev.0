Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F1E6EEB2
 for <igt-dev@lists.freedesktop.org>; Fri, 18 May 2018 18:41:01 +0000 (UTC)
References: <20180510101924.20814-1-tvrtko.ursulin@linux.intel.com>
 <20180510101924.20814-3-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <502788e0-355f-d46a-4986-386bc3874e1b@Intel.com>
Date: Fri, 18 May 2018 11:41:00 -0700
MIME-Version: 1.0
In-Reply-To: <20180510101924.20814-3-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 3/9] trace.pl: Remove context squashing
 option
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0913746508=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0913746508==
Content-Type: multipart/alternative;
 boundary="------------0A19A4F764D4041A1761153F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0A19A4F764D4041A1761153F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/10/2018 3:19 AM, Tvrtko Ursulin wrote:

> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Timeline id allocation order is not tied with engine ids any more.
>
> Remove the option which assumed that was the case in attempt to provide
> more readable timeline.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   scripts/media-bench.pl |  2 +-
>   scripts/trace.pl       | 18 ------------------
>   2 files changed, 1 insertion(+), 19 deletions(-)
>
> diff --git a/scripts/media-bench.pl b/scripts/media-bench.pl
> index c07555b0dc74..375844d9cdf6 100755
> --- a/scripts/media-bench.pl
> +++ b/scripts/media-bench.pl
> @@ -207,7 +207,7 @@ sub trace_workload
>   	show_cmd($cmd);
>   	system($cmd);
>   
> -	$cmd = "perf script | $tracepl --html -x ctxsave -s -c --squash-ctx-id ";
> +	$cmd = "perf script | $tracepl --html -x ctxsave -s -c ";
>   	$cmd .= join ' ', map("-i $_", @skip_engine);
>   	$cmd .= " > ${file}.html";
>   	show_cmd($cmd);
> diff --git a/scripts/trace.pl b/scripts/trace.pl
> index 7f181a3fa2f5..fae94d5044ef 100755
> --- a/scripts/trace.pl
> +++ b/scripts/trace.pl
> @@ -38,7 +38,6 @@ my %skip_box;
>   my $html = 0;
>   my $trace = 0;
>   my $avg_delay_stats = 0;
> -my $squash_context_id = 0;
>   my $gpu_timeline = 0;
>   my $colour_contexts = 0;
>   
> @@ -108,8 +107,6 @@ Usage:
>         --html				Generate HTML output.
>         --trace cmd			Trace the following command.
>         --avg-delay-stats			Print average delay stats.
> -      --squash-ctx-id			Squash context id by substracting engine
> -					id from ctx id.
>         --gpu-timeline			Draw overall GPU busy timeline.
>         --colour-contexts / -c		Use different colours for different
>   					context execution boxes.
> @@ -145,18 +142,6 @@ sub arg_avg_delay_stats
>   	return @_;
>   }
>   
> -sub arg_squash_ctx_id
> -{
> -	return unless scalar(@_);
> -
> -	if ($_[0] eq '--squash-ctx-id') {
> -		shift @_;
> -		$squash_context_id = 1;
> -	}
> -
> -	return @_;
> -}
> -
>   sub arg_gpu_timeline
>   {
>   	return unless scalar(@_);
> @@ -303,7 +288,6 @@ while (@args) {
>   	@args = arg_help(@args);
>   	@args = arg_html(@args);
>   	@args = arg_avg_delay_stats(@args);
> -	@args = arg_squash_ctx_id(@args);
>   	@args = arg_gpu_timeline(@args);
>   	@args = arg_trace(@args);
>   	@args = arg_max_items(@args);
> @@ -338,8 +322,6 @@ sub sanitize_ctx
>   {
>   	my ($ctx, $ring) = @_;
>   
> -	$ctx = $ctx - $ring if $squash_context_id;
> -
>   	if (exists $ctxdb{$ctx}) {
>   		return $ctx . '.' . $ctxdb{$ctx};
>   	} else {


Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


--------------0A19A4F764D4041A1761153F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>On 5/10/2018 3:19 AM, Tvrtko Ursulin wrote:<br>
    </p>
    <blockquote type="cite"
      cite="mid:20180510101924.20814-3-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>

Timeline id allocation order is not tied with engine ids any more.

Remove the option which assumed that was the case in attempt to provide
more readable timeline.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
---
 scripts/media-bench.pl |  2 +-
 scripts/trace.pl       | 18 ------------------
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/scripts/media-bench.pl b/scripts/media-bench.pl
index c07555b0dc74..375844d9cdf6 100755
--- a/scripts/media-bench.pl
+++ b/scripts/media-bench.pl
@@ -207,7 +207,7 @@ sub trace_workload
 	show_cmd($cmd);
 	system($cmd);
 
-	$cmd = "perf script | $tracepl --html -x ctxsave -s -c --squash-ctx-id ";
+	$cmd = "perf script | $tracepl --html -x ctxsave -s -c ";
 	$cmd .= join ' ', map("-i $_", @skip_engine);
 	$cmd .= " &gt; ${file}.html";
 	show_cmd($cmd);
diff --git a/scripts/trace.pl b/scripts/trace.pl
index 7f181a3fa2f5..fae94d5044ef 100755
--- a/scripts/trace.pl
+++ b/scripts/trace.pl
@@ -38,7 +38,6 @@ my %skip_box;
 my $html = 0;
 my $trace = 0;
 my $avg_delay_stats = 0;
-my $squash_context_id = 0;
 my $gpu_timeline = 0;
 my $colour_contexts = 0;
 
@@ -108,8 +107,6 @@ Usage:
       --html				Generate HTML output.
       --trace cmd			Trace the following command.
       --avg-delay-stats			Print average delay stats.
-      --squash-ctx-id			Squash context id by substracting engine
-					id from ctx id.
       --gpu-timeline			Draw overall GPU busy timeline.
       --colour-contexts / -c		Use different colours for different
 					context execution boxes.
@@ -145,18 +142,6 @@ sub arg_avg_delay_stats
 	return @_;
 }
 
-sub arg_squash_ctx_id
-{
-	return unless scalar(@_);
-
-	if ($_[0] eq '--squash-ctx-id') {
-		shift @_;
-		$squash_context_id = 1;
-	}
-
-	return @_;
-}
-
 sub arg_gpu_timeline
 {
 	return unless scalar(@_);
@@ -303,7 +288,6 @@ while (@args) {
 	@args = arg_help(@args);
 	@args = arg_html(@args);
 	@args = arg_avg_delay_stats(@args);
-	@args = arg_squash_ctx_id(@args);
 	@args = arg_gpu_timeline(@args);
 	@args = arg_trace(@args);
 	@args = arg_max_items(@args);
@@ -338,8 +322,6 @@ sub sanitize_ctx
 {
 	my ($ctx, $ring) = @_;
 
-	$ctx = $ctx - $ring if $squash_context_id;
-
 	if (exists $ctxdb{$ctx}) {
 		return $ctx . '.' . $ctxdb{$ctx};
 	} else {
</pre>
    </blockquote>
    <br>
    <br>
    Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E"
      href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a><br>
    <br>
  </body>
</html>

--------------0A19A4F764D4041A1761153F--

--===============0913746508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0913746508==--
