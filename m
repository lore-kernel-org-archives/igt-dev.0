Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555DAC44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FC810F026;
	Wed, 15 Jul 2026 12:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n422FAHx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9B610F026
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117756; x=1815653756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=d4JHhTDLWyNhIqm1B3mf97iDmSTYcAX1cesRWTO7Ddg=;
 b=n422FAHxaBRs3RgumKumb6boXbza+FN/cj/BPYBe56ZrKxN4VIUBdGFO
 g8psxXGzUS+jvM1eEyy9wHqdEoJHlUTJgYjQaAoEn4G5v5+WdozMcV7L3
 CS/Hnz6LmSc0Kp49zBRhwclgGpDnIH9N9S6c+7q1+JjRjpoTxGrYnQg1y
 4dyceQzseVHGUAXguMzE4rhdTH9YV9PASrWvIt7zY2V4BG9QHwr3gUmoc
 zwY4KtBbofQm8KZBQl74bSHWxVnUTjEm715ARRgtuT2q7IlPORT17Sp74
 kQvm4zTrb4GW0aJ7aOfUbiMZIYb3CjWX7elj4CbiPbReskCf5r9rhryRW w==;
X-CSE-ConnectionGUID: +87sVh4UQYq3XpDHMPW4EA==
X-CSE-MsgGUID: mgOPQr0DRcCAdIKx2pWVWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84607081"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84607081"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:56 -0700
X-CSE-ConnectionGUID: qHnWoI5kQAaTO+UYTNTFFg==
X-CSE-MsgGUID: DxV6h1F1QR+HCa66ys+3cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659656"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:55 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfcdelhhMcWrxWKI2QlGtDPbNb7LDFwQ/8dtdeYmynq/hAjd79K6C5EeNmkorz5g0cgbXk9IIfgefyFOr5Vn/ZD9VChDv11GoEGzK8gDAIZ0MyFm+erIjHR6yD42GZcPlINPkH0e19DP9TkqGrh7SfriGTp3rdzEoKzXHQe2uz4+m5lGhwufZYmMJdmSge9pk9VYjlSi+NyL8nBb7kLzhfGweRGVFU8Ks1Gx+zreNHexXvUTk8VEPT6rIV1eobol7L8321yJ0i8p+ArsBDjMxAyKIstEfrA42tBKnKMTa9ZulnbFcjxL9iKiQ7wqr/mjhYW5PsPnXzLBm32vS7k8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRXjALDz0ck5jNcnzTh67wxVLtnvwtXAAa3W3s5cZoY=;
 b=hxr9zAUFrBBd2wR7OqdxGCb4qDOujN+tKA6T5R3H38X1IWG/MlMxaYHB7gfesO+NTt01KFqKjWIutb7QwjEQtev9tUMq1GBcAl9H6rljSMmC93CEHg4hfEv2UOrss1DgPT+Z5j4qUef5GZ5QMWkLIdjV6BY44mtxH5rANhxjhzWS5C9Klrzf77jeLRp3RYFVmc/XjNekQ4qc5BJI83fynMxNXjsU5ukJmegtgb64DqGqSqxjdcqiuqHmOXf6sbx6Kzs5d1l+Ibbvjg270Tp8QwyT75wFjdDbVqfJlzW7ZAHSBDQaR83/e7Y+OiWPYjKXEp1DRxUkdkXD5j3Q9nGgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:46 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:45 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 21/31] tools/intel_gpu_time: link with minimal
 sub-libraries
Date: Wed, 15 Jul 2026 14:15:31 +0200
Message-ID: <84f0f604c7d0a6ff2b3775329d9150acdacd6165.1784117512.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1784117512.git.sebastian.brzezinka@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: d095e88e-04ff-487f-189a-08dee26aca99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 80dlyoBOBGgCPqNwKk5Hci8ILKQK56ivX77w3Xac1c0e13g0iEmh6lUwQ4/2ulWFNa/hJG6PbUl0D33XzHHGBNv8JA63vTH6OS66tJGS7dnw4XGngqif2cdgs/alE5ubUOTbyBfc9nqaXUabV0xllAGfFKwYSGdqGMe8LxpBnFuqTqBuKnZfwy4Y7Dd8gdKlXwTWdxWtT+xDCDhjcHoBkQrEA9iEuCba1PwaPJz8Fe7guxfPo+ArsRhki0tE0I18mT4nUDfkwmsFjg+eg5M0tMuIXTSC556WyezzPBlvcNSwIwWX42D+ssBFH7UMAt0YOgL4H1hQ2ucL0v+jz0nKwCMbw7lUvnaSyDBfUrZikafPnGpoeFCZrDsqaST5orl9RMmWZzqeVtJ3tYofjBbzmSLWYbgg3fA/f8H3FFBwtnx2u12kCh/VRrm7h3UxJbs9cPvDiACBS/8o7KW70yl1t/mcj+L8MFWnQ3PTRLSgNQMdR4oS5TcIgEF5mUKAXGDBKxuElaY4UbE9E3kV8DoRI2BD8Nwuew4WMsnhi0lkBdNf2ysyKcLG7p9tbE2jhZf8r/T1kSA9K94nQ/JoNKch6cGO5NHg7YUERZeXXHvLB08ykQWeomrbyMZZ7+mEs68sggHROahRNzDiUnM5rRaYqqzSRMnW36Sc6Sy1Phqp/Nk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LMGsK+BOteDoPLB0C5P9mn5n1vEXgqSXagS1f1Hd2M3HVCKvN8myzeCT6yKy?=
 =?us-ascii?Q?4puAmyGPtiG5MVBEouqGCJ0IZZOS8bR/4dC0B0nC24pcppOudpEQqUkLwC31?=
 =?us-ascii?Q?h9oc1kb28PxmSnu8vjPivBbGvD14OY2USw0c4Tf4CEYy2UBxY8xB5L5ATQaG?=
 =?us-ascii?Q?NCN0lsOWfSeMp2qgxX8Pbe1oVcug3GbDoMFlexK3TbTEnWkqi9n8TLX3iHVn?=
 =?us-ascii?Q?hK4uedd1P1vzfQiDeAzUzqILXcV2+VKLddShGIgHTUkPLR2eaWOiFJYLbSZn?=
 =?us-ascii?Q?9oHQl5WyorhnkeLBAlEd8DDV6S3gKvz574gIAO9ikBQlj0/hFRAB9i5cpF6O?=
 =?us-ascii?Q?EZTSZtLOiRFEhW+I7Whcg/FgP5hUJjg94lpnQUM+aDCz13rHzOAyWC9TWQ0R?=
 =?us-ascii?Q?w7wsRMFHTR1MZO20B+hIJ+XXfRAagxvO4Z1DWFPl1/anDsCjN6SuDtgPBgy3?=
 =?us-ascii?Q?CQBf/bKXs/azC1gDOtkguKAsj8THVRx2WQYhYwWFfNhqlNT7s8XELs27zvr1?=
 =?us-ascii?Q?o7LBx8O7wPBE5Lii8lECoEyZ0iqoPN2Mh5xGSqDMzWIu0VWDTIL5u4VS+Kkl?=
 =?us-ascii?Q?zo3xCzYFq7/mkAjhhVK0kCbOBL6kDDhWb5ESpsKAmBNtdD6fVexzh4L/j7cb?=
 =?us-ascii?Q?f80IRS4+qE8UsvfSu9nkJV0S5aOQToQ1pvfa7pXcvAmgPTXxX4cXt6Lj0V/9?=
 =?us-ascii?Q?KWdVIHfdkHEDYbiEXN1g93ifhHMlXnABGPiG2cORid+uFlo2mp/xIJ+9amRH?=
 =?us-ascii?Q?4xLz+Cwp6TQS6YzkW81bwd3HjZq0lxWSOAquUU4ptEkN1LVpZNu8llN8tWl3?=
 =?us-ascii?Q?3fSFUc4BNwP2/soAlKLn+14JjjevwBk1KFrNGrBTZtkizdGM5CX5a7+lEVm5?=
 =?us-ascii?Q?aq70qD4MxWeNRK08uNmNP1yXGc6LTf5kexNgo5vIzajvRZCkZRGCMkQnUZWC?=
 =?us-ascii?Q?92Kw/rJHERzlBv2QwB0uu7qqIzmqCfgljissMXrXDCZ/7j8DsCFgQ1ZSP8H/?=
 =?us-ascii?Q?d02OA7rRJby1lkqRYWTjNrv4yvNQ4Njr9rImItmJymRxM6T1qgvPxSi1SYhw?=
 =?us-ascii?Q?N7lrTdD6ugpH+Q8pmng+b6QNKnU0ktDTaNySNk+mkvDRbyCxjhQV4MCnS0xc?=
 =?us-ascii?Q?OCTDKqgdgbwzxGEmkmMP/SpQDSlG8bENnBKOwJTZ1Qg3hEfUf25T/mSsOHO9?=
 =?us-ascii?Q?KZ1rgF0hipzIZl6H6mqigGztMJX6+z1avyDKQiasLryBR3xZeOyidlU2r0fh?=
 =?us-ascii?Q?Gjzsoee4zN7bENdWus6GcBaStu82h1wg95/gEb9fZDhsch8lthKloiFIT/cx?=
 =?us-ascii?Q?fm8TBbZUdwwql87jqZB0Gxbxq9daK0uhhSgtBbJhCNGJ14a118LOEw17a7Gi?=
 =?us-ascii?Q?rA53YJs6JRVEYK+UnjmtTFC2a5MvnKj+bZzzsVnqfSefClD2mvKyQCTrx119?=
 =?us-ascii?Q?0pnzR/lLUm6XLML9DImf9HbbdfifAVEbrnu9ujo7IXbwzqisBdSk8MJewVUA?=
 =?us-ascii?Q?HObbxICC3AWWsLgtI9dvsKfDvftuLSWnSXxczzUZK8l55qg4CUFfpACSZQ5Z?=
 =?us-ascii?Q?ACCUs+/5hacnLIHQI+yhf0HJwrUKF2SUg7sq6nhf2m6LrLixNAGFRpsxwSW7?=
 =?us-ascii?Q?V3ynKrQjkiRr1ea25W/woH7u88hU4D137qYZhKNoMYTGN8Zot98TWXJcynDk?=
 =?us-ascii?Q?clU5cmYYcCyDAlsLYTcxAxLPlEjHUvtfe3kLi3EN2B83w61kblJfZ7egLSyL?=
 =?us-ascii?Q?p5PdwjLMd4GGrcrchUX63AffWyNE2kQ=3D?=
X-Exchange-RoutingPolicyChecked: hL44kK7cE1IJc32jObxqByJUieozKKbGg2vSGv6x1cis8pqD9YDzX2+zFXUDT7ro+SwdG9daAzUJssHVWdyglJLgYq8mrkXtiznxD1SfPUdrnXGbsYNlem0nblRyuDJlbebnAQxW98vGcvDPb/mevJSzWC5d3n3Z5dweURAUDZisrZkuv4pmRF5e+5MyY3K5mreHlwsvnoSEyLtCiH/Z6CHKNuWxdEnvqiicKtwixosvYkRedvQRzUdcJ96WMGyRt7CnppPiky2Uq0yKNN4ZiW0f+XNW/PtRGB1da35v9/SsdRg/XA6MKidr6B4TM10lI+CWGLuDtjkR6W737xw75Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: d095e88e-04ff-487f-189a-08dee26aca99
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:43.2298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDkPhlsvSyAnwBThuRDc9NmZ/1pY8lTO33/LzacNL33m3WQNUuXo7OHWLyx2HM4oxr/uburUgTmLGxK0+8QwdST4cLW5GYA26IPqYw7ZzYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
X-OriginatorOrg: intel.com
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

intel_gpu_time only needs the register/MMIO helper subset, not the full
libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5   (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 0978f8f11..2e8ceea36 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -21,7 +21,6 @@ tools_progs = [
 	'intel_display_poller',
 	'intel_forcewaked',
 	'intel_framebuffer_dump',
-	'intel_gpu_time',
 	'intel_guc_logger',
 	'intel_hdcp',
 	'intel_infoframes',
@@ -100,6 +99,11 @@ executable('intel_lid', 'intel_lid.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_gpu_time', 'intel_gpu_time.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

