Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0714D0BB7F
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 09:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4716810E8E7;
	Thu, 24 Oct 2024 09:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezWb2E05";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C030710E8E7
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729763005; x=1761299005;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=Z+2QT9ix0n8tEcWKmTnmqXVKOKQlGHr7atgahhUq14k=;
 b=ezWb2E05gQ1o2+12PPI/gjt5EvVUMM6odphgTu7wFpRcLplLSKVM80pf
 6MOJEA3CWeRWGJOQp+ppvSNPF5RQsztzkTwKdzULC5tHwy+Ie8aTL3XBJ
 vwK3mf7kgh819bw3pLHZ//Nbyz8kgsHn325yk488TxtLFKABbV/vjZQJf
 EvPsrMII+tPGVgiqO1qp2J1naIT58VBaG8AnaLRp2bvlVPjmAfLJoBCAQ
 CzQpCNzLFWu1J0To+UnZlW3YPFHn5rMSrwUIyP/TknePNYnMU39Ndhi7x
 F8JGsZl2EpT4fs6MbODBUoaYSHInijuRTR8okJHd97zTad8E1kDBWyDdC g==;
X-CSE-ConnectionGUID: AbZ5TvmaTQKRha28ndAScw==
X-CSE-MsgGUID: Z7kGIjq9RBe7rbfE19En6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40503019"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208,217";a="40503019"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:43:25 -0700
X-CSE-ConnectionGUID: /EdTq5iMRPGxGJoc1H38TQ==
X-CSE-MsgGUID: Yk2VOIPsRTGl2d7/pxVZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208,217";a="80709933"
Received: from satyasix-mobl.gar.corp.intel.com (HELO [10.247.218.0])
 ([10.247.218.0])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:43:23 -0700
Content-Type: multipart/alternative;
 boundary="------------DbXuT0XwRwXP12fFv0v85rG7"
Message-ID: <a52e5482-5b8c-41ab-88e3-8dfa478e4b22@intel.com>
Date: Thu, 24 Oct 2024 15:13:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/3] tests/chamelium/kms_chamelium_edid: Use
 extended flag to reduce the number of edid
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com
References: <20241024082704.1746746-1-pranay.samala@intel.com>
 <20241024082704.1746746-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20241024082704.1746746-2-pranay.samala@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------DbXuT0XwRwXP12fFv0v85rG7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Pranay,

On 24-10-2024 13:57, Pranay Samala wrote:
> This test iterates on all the available edids of HDMI.
> Due to CI test timeut limitation, we are reducing the
> number of edids to execute to avoid result as timeout.
>
> Using extended flag to achieve this. The test will execute
> only 25 edids when this flag is not used as CI doesnt uses
> this flag.
> In local execution to execute on all edids, we have to give
> this flag at the runtime.
>
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/chamelium/kms_chamelium_edid.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
> index 8438f5f15..1bdde1768 100644
> --- a/tests/chamelium/kms_chamelium_edid.c
> +++ b/tests/chamelium/kms_chamelium_edid.c
> @@ -122,6 +122,7 @@
>    */
>   
>   #define MODE_CLOCK_ACCURACY 0.05 /* 5% */
> +static bool extended;
>   
>   static void get_connectors_link_status_failed(chamelium_data_t *data,
>   					      bool *link_status_failed)
> @@ -273,6 +274,9 @@ static void edid_stress_resolution(chamelium_data_t *data,
>   			      data->ports, data->port_count);
>   
>   
> +	if (!extended)
> +		edids_list_len = 25;
> +

Is there any environment variable that can be checked here instead of 
using extended?
If we can somehow know that this is a CI execution with some environment 
variable we can use that instead.
It will allow executing test without extended flag.

If we don't have any such env variable I am ok with this approach just 
add a info message to notify
user we are shortening the list also add a intel platform check.


Thanks and Regards Kunal Joshi

>   	for (i = 0; i < edids_list_len; ++i) {
>   		struct chamelium_edid *chamelium_edid;
>   		drmModeModeInfo mode;
> @@ -504,8 +508,22 @@ static void test_mode_timings(chamelium_data_t *data,
>   	} while (++i < count_modes);
>   }
>   
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	switch (opt) {
> +	case 'e':
> +		extended = true;
> +		break;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +const char *help_str =
> +	"  -e \tExtended tests.\n";
> +
>   IGT_TEST_DESCRIPTION("Testing EDID with a Chamelium board");
> -igt_main
> +igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   {
>   	chamelium_data_t data;
>   	struct chamelium_port *port;
--------------DbXuT0XwRwXP12fFv0v85rG7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Pranay,<br>
    </p>
    <div class="moz-cite-prefix">On 24-10-2024 13:57, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241024082704.1746746-2-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">This test iterates on all the available edids of HDMI.
Due to CI test timeut limitation, we are reducing the
number of edids to execute to avoid result as timeout.

Using extended flag to achieve this. The test will execute
only 25 edids when this flag is not used as CI doesnt uses
this flag.
In local execution to execute on all edids, we have to give
this flag at the runtime.

Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/chamelium/kms_chamelium_edid.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index 8438f5f15..1bdde1768 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -122,6 +122,7 @@
  */
 
 #define MODE_CLOCK_ACCURACY 0.05 /* 5% */
+static bool extended;
 
 static void get_connectors_link_status_failed(chamelium_data_t *data,
 					      bool *link_status_failed)
@@ -273,6 +274,9 @@ static void edid_stress_resolution(chamelium_data_t *data,
 			      data-&gt;ports, data-&gt;port_count);
 
 
+	if (!extended)
+		edids_list_len = 25;
+</pre>
    </blockquote>
    <p>Is there any environment variable that can be checked here
      instead of using extended?<br>
      If we can somehow know that this is a CI execution with some
      environment variable we can use that instead.<br>
      It will allow executing test without extended flag.</p>
    <p><span style="white-space: pre-wrap">
</span>If we don't have any such env variable I am ok with this approach
      just add a info message to notify<br>
      user we are shortening the list also add a intel platform check.<br>
    </p>
    <br>
    <span style="white-space: pre-wrap">Thanks and Regards
Kunal Joshi</span>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
      cite="mid:20241024082704.1746746-2-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre"> 	for (i = 0; i &lt; edids_list_len; ++i) {
 		struct chamelium_edid *chamelium_edid;
 		drmModeModeInfo mode;
@@ -504,8 +508,22 @@ static void test_mode_timings(chamelium_data_t *data,
 	} while (++i &lt; count_modes);
 }
 
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	switch (opt) {
+	case 'e':
+		extended = true;
+		break;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	"  -e \tExtended tests.\n";
+
 IGT_TEST_DESCRIPTION("Testing EDID with a Chamelium board");
-igt_main
+igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	chamelium_data_t data;
 	struct chamelium_port *port;
</pre>
    </blockquote>
  </body>
</html>

--------------DbXuT0XwRwXP12fFv0v85rG7--
