Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01258C25B77
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 18:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6089510E1BE;
	Mon, 20 May 2024 18:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dP77bWxV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250B010E384
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716230142; x=1747766142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9RgIWjB0QCsPXsjNziVwUG6ZY/KcVIQxIVsutInur3g=;
 b=dP77bWxVCcsdGWnsjb48PQTGwwl7Lm5amwfLEvUirBl9ZKZHgdfDPL99
 Of78relZ7TzHROeQus+8un6uYea8uYVn6sq7MPZlj63+DZgQ2h5MGRM8R
 HigBAs8+EI5D+Np+PUHnbMZCmRJK4x/qiS2KWJHcl6ZNoZ/ZxAHRuD2pe
 dTffY8jL8qU75QKxLKNV3wwW5ld2byaSLMfbgzz1gBofq5aH4jJvfV+GA
 y5jf1Kcbi6vBCkRP3YG+OA6xkHKZ9vSw8z4jZaCNpgGCl30W8IkVd3cZq
 zr3rU++qB771uamUeKC6Me6o8rOlU+IWcB6ysdj3W78L4/YxpJBv/KnMo w==;
X-CSE-ConnectionGUID: 9ikLfhhRRVWYMtpzLHYbew==
X-CSE-MsgGUID: pr7648rpSZ2XY/NZ3Wmyng==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23791020"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="23791020"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 11:35:42 -0700
X-CSE-ConnectionGUID: DLOIZk0LSMSNBeMMgliDYw==
X-CSE-MsgGUID: bt0VzOuxSKyyvRrYN3Zs6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32499233"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 11:35:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 11:35:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 11:35:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 11:35:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 11:35:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVtQdRvOPg5BF3ybeYnCj1Y0RjMqrDsAgptH9PU6ctQYNRtodDD0gJTATNq3v4g++QpDLnMF1Ou90Z02aPRbsKb8B6ITfvJIFR1rmaQuQZxDUBeRMPbnyfCbBbjOBjYokqJFoyTkdPjlhMCP3QsDqYQ9zkLh955LkkUDe6moXHHWT65Zh8UehzHJoQBmk7qPQXz28k4y0HqoCr6jukMCga4z129aTUxO07ONvN0b6JvuMy+6fZg3oSzidKR9qVEjycYWwmtC/QVMdxV0EnpvnBwNXWgrme2mbxF+oDEi4pggXNic3rHR/1vQF3+H63EWGbCLxzWqI0UQDCvzzTiMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Smom/bMV5utqc0fjm8WCJhoVNqvpYarAuJhNkLZ8A8s=;
 b=gXtLhjCPMWHtTnALYAO/5XTDVH7PHvaF+P9GitA6NMbaW7B0CBehxIHUNFqjb3I7sVUktJZw0ghMT0dO3GelwO0TFhaU+F1jLadBXc7l6GFxLd/aCucqbzlUAEkI5fpLi725iooT81Cv2ZPsXw+6PWm21ckzxbh3Q5VyL2xe61lKpoSD18heOq5Uht8zp107+eb5N1ONtA8DYIf0FwF247+64jGyp5bblQpmX4/6U4olzGkiBxz7AvExcwHZnwfG2mH4YZyJcWHbEUGUO00wWzNkR2v8UdzoT8RpVXh7LN4ZnqiL2qD9xFIYO88ykN7XVPYl2ot0YBJD2LkcLN6PuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB7039.namprd11.prod.outlook.com (2603:10b6:806:2b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 18:35:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 18:35:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/xe_pm: Convert mmap tests to use
 existing d3 helpers
Date: Mon, 20 May 2024 14:35:19 -0400
Message-ID: <20240520183519.227167-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240520183519.227167-1-rodrigo.vivi@intel.com>
References: <20240520183519.227167-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e939674-0081-491b-ce3b-08dc78fba3f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RMmwtdT82qWPxVuEeaaI23GVdvnioLHXI/B+h7NuzUpR/LXfo2xy9xtmSoBM?=
 =?us-ascii?Q?C/qDm/t6YtcS5wk0AcpzU3VbS/kZ+Jo4eOmYjWOlBrBbbZS0J5mkvY93NPrk?=
 =?us-ascii?Q?xe1U9ju50rIy8wwjGlTxHp4fq72EsaGtusKR/VmfqHWoM8BiMUqAdX4mUB/L?=
 =?us-ascii?Q?Zn2KRtv4al/pwtNt9ElU2+ZCuLrN39MSFxyshn/eoVuOgoyAF9cQZMLHKv/B?=
 =?us-ascii?Q?xR5BEOf8Xzu4jZWqX0/pJZPsmDrJzsOSvKA8QwDvUmqiD8PW1ibYJEbdx28S?=
 =?us-ascii?Q?LHL3y9qMd9i66AO2BEf0CHU5h6TrkrGbOTqZs6kgDNW3zCs2mdtGjSBcG+QC?=
 =?us-ascii?Q?cmZunhvFX6RRXX7hdFA0JO3bdKUwB+xJFcVKowSzFmAP/BUXYkePM6CX+Ozj?=
 =?us-ascii?Q?FtEHz9wyUbs4NH2eVIyiQrZcu8npAmGya5nlZN6g7RJCxMIRRHN3Q34OyoC9?=
 =?us-ascii?Q?ZQ2Z0wLY4HSrkkSwhx/NrgseXGQv6AdO52lxPyenQzRalZG1bSri+2Ze+nks?=
 =?us-ascii?Q?KqGOa+L+YobNQANuXPYo5rl8DCjopY/7TPz3ZXCZTn9OA3zHMGSsYIlv9pH1?=
 =?us-ascii?Q?joK7BfXiuY/1H9NUtVeLF1h1rMiYzTODyU6HjFetztgkF3eBxfNf4uIv+2WB?=
 =?us-ascii?Q?JRzJOjXGZ0dgsrzqWYgscb7uXBGrVPBs23vb/a5AJgo+Vkbqacw25bWyZneF?=
 =?us-ascii?Q?a4JifIgSlk2EdmbYRQBuOWv/qyU7KlL78gONw0qvxiravoD/HB+Dm4Jzxq9S?=
 =?us-ascii?Q?Nbd7WYbcLAHo+QQuBm6bOPwTWVFtRLRNu8pgzu2Y15oItxTKrtNVuRQMnH5z?=
 =?us-ascii?Q?H4KLJRDYfLEvSke6OL7VQB1XN2WuStJqGfHGa81948qS+vEhscZs+E+rWBMP?=
 =?us-ascii?Q?6zXWbEp5/kNoXiW/gKdN9/KS3koMpxvus/KD6W7cbXOYb6ggw0PLO+R1QEPZ?=
 =?us-ascii?Q?IzovTkIPU8wjSuUiUdTyJiqYSqJgN1Wyh1SsCkKoxTkXljRiL4kTlg+8VEZm?=
 =?us-ascii?Q?aG9jTcmgfcC840xK/ia7WRSo8pa4mfsFtAfy5zMSFhdsmFI+s/pq3ANZSRKu?=
 =?us-ascii?Q?4Yh8Qyl2YI58JQMdZK5r/oZCrY2jbC+z3ZjxSGxKTpvB64JYkCTioJVReniZ?=
 =?us-ascii?Q?5bWVZf/eqZK5rBcWbnmlsEbM5LpPVmf1vighq0BsV8URgHURrxO8eg0O6IPj?=
 =?us-ascii?Q?yR6F8Su8ai2pmJbn7baQxl5hyWYoMVl9lBMcn2rjmPEDheDooW/kxt2dbner?=
 =?us-ascii?Q?Tf8VIo7FwpZyhC5cSaAvyby0kwGsSMt8gTmn3Er7IQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WIokg/QLrujkTk1A3CJIK8nEHc9pmf9J5TSU0No+wJLXqhy5UpLZRXyxZ0iN?=
 =?us-ascii?Q?7u7ozHTOac/dh3Vmum3501nOZQ51vuuPBcywPlyJKaNWwglPQ+C+DMW0Qg8w?=
 =?us-ascii?Q?PTA+RM1qZ+riy0hbOci8KDvnUwIkmBOhTky66S9ozGBozEvARDhEeWbA2z65?=
 =?us-ascii?Q?4sw5QpL4CeLEZhrTWdL9piCl0TpwbbAoBeeCGi1OmrOjEMzIKSOELxkydQRE?=
 =?us-ascii?Q?JukjDb3S7qfqVI8T/pI1hFlTjN3xg5bDGeHRa1niY/pmhiT/otKBzRqZCApg?=
 =?us-ascii?Q?aFmUlayH0XiEsR4GWEFaVCOer7+kLNPHKELos1yt1994OCA3sSecbSRE47GP?=
 =?us-ascii?Q?d/y+qstlb+XhD1Y05fZAC8AQkXE8hX6vUJoQyNZIy0I8FcCYHKC0eIX/WQKi?=
 =?us-ascii?Q?uTv0yqkV2t6ColetX51g5gyPlxDcvp6Yr71FuLXaVGbUL1Iyif/cvL+UWoKo?=
 =?us-ascii?Q?tOZwc5vKtbMsyQg2ADvHSOAveep2ThFnYhDc/GHtD3kWl6NGiZ2h+XC+aQSw?=
 =?us-ascii?Q?Q/AuEpG7BAYNEj9V6bRnffuUhUDDGal/iay4ECY0ZW09MJUdPE3NJvAyzxum?=
 =?us-ascii?Q?SoPhFJZI0KobQ3s+imHpYJ5Ij6tWGYZFCoQcqSnYdwAQe+8F7eX9h5zNV8jE?=
 =?us-ascii?Q?W1zTepct6XEs+8TEQ7dzLlCCmufNk/wvUhnAzMqslzBUbQshFdJJ2vyw1HtP?=
 =?us-ascii?Q?SDs72J5wKUNySLmEPinf7HGiKSB7CSorhnvOrk6qKS6TuyErAhVz7ZeHkc/9?=
 =?us-ascii?Q?uKf3mFwTterClpfpqs86Gw+TY3d7KZ2ahUUYs+8YPxPhPYRom6OUqx9aORj5?=
 =?us-ascii?Q?/Lm+2OoR7TFgLZ/GpOcdpXxnMlTBQF2Eu+jZF/cj6lPM90it4+H9+i7EUAzb?=
 =?us-ascii?Q?QboUVS3/uz6PA+37aoKOm6ItBNZV8VHhoPOadUFbXReugj5gwg6VKnhH2bZW?=
 =?us-ascii?Q?8jcdiICKUsoKzU8HJtdcyko2/M+GfxgaAVSu9o7padOF680IgHA+jrbJUxZZ?=
 =?us-ascii?Q?CGXHIFQJvbNTL5R8EuqAVCQsvAxsTEgVxsnNx4wXnkUu/78/m+6+k54uEnxI?=
 =?us-ascii?Q?0eJq5xQ7wrzJeEmMjSVIhhyI0lFdpsxvrAcHAC0R5rRUd3oNQgl+9pTLYG9Z?=
 =?us-ascii?Q?05BtX5XRjnugv+MqLKynIYPcfKh0RRZLTV0Q1FmSftOfmL31I9JdbBIE8+ie?=
 =?us-ascii?Q?m3xC6roOSO1ut5h5kOcYekT9XonXGC43lSOTmQHiP2QtmhWVbs0oYWZSic0m?=
 =?us-ascii?Q?RzQzIEitoodH/ZvIp3h7b0X77HYlA3EvxpRK7ABRARGptDeNclsjolorn+4i?=
 =?us-ascii?Q?A61jbtXJcqLzpfhJJMuwWB2CA66LWlskzslcz81afjkitGDq4YWkvrhe8gAw?=
 =?us-ascii?Q?oTxTwwGIvVR+nQt4rSIbcgK0NKcWoPgCIGl00rDbcDwfyhXOTpVpDRdh/LLf?=
 =?us-ascii?Q?4u/GfiTsykDrcFjkLYB9cCdX+jC+8dtdYWTF/NszydsWorHBc6PUf1XqdYfZ?=
 =?us-ascii?Q?gbxltlNn9/7CB3z8sd3QrktkMDKBRW4qUdheknEYrlb+0heZ5m0UMjenM7WF?=
 =?us-ascii?Q?vFjp3lD6dOvy2R/RYPm9L29+XNhaTQgwDoZmGKiQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e939674-0081-491b-ce3b-08dc78fba3f2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 18:35:36.4345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SNiqLLD/YYspArH7XPUOPW/v3DI/ZrlkQucrDJHkMT/0AP2HRZU3bC7i6AR1w37SD+Z0+KMTfTtUB9IN0pHXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7039
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

Standardize d3 setup and ensure that it tests with D3cold and
D3hot.

v2: rebased
v3: rebase and fix description arguments (Francois)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 82 ++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index ced983d6c..90050207f 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -516,19 +516,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 }
 
 /**
- * SUBTEST: d3-mmap-%s
+ * SUBTEST: %s-mmap-%s
  * Description:
- *	Validate mmap memory mapping with d3 state, for %arg[1] region,
+ *	Validate mmap memory mapping with %arg[1] state, for %arg[2] region,
  *	if supported by device.
+ *
  * arg[1]:
  *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ *
+ * arg[2]:
+ *
  * @vram:	vram region
  * @system:	system region
  *
  * Functionality: pm-d3
  */
 static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
-		      enum mem_op first_op)
+		      enum mem_op first_op, enum igt_acpi_d_state d_state)
 {
 	size_t bo_size = 8192;
 	uint32_t *map = NULL;
@@ -537,7 +543,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 
 	igt_require_f(placement, "Device doesn't support such memory region\n");
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
@@ -563,7 +569,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 	close(fw_handle);
 	sleep(1);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -578,7 +584,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 		igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
 			   active_time);
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 	active_time = igt_pm_get_runtime_active_time(device.pci_xe);
 
 	for (i = 0; i < bo_size / sizeof(*map); i++) {
@@ -588,7 +594,7 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 			igt_assert(map[i] == MAGIC_2);
 	}
 
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+	igt_assert(in_d3(device, d_state));
 
 	/* Runtime resume and check the pattern */
 	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
@@ -783,6 +789,36 @@ igt_main
 					  NO_SUSPEND, d->state, 0);
 			cleanup_d3(device);
 		}
+
+		igt_describe_f("Validate mmap memory mappings with system region,"
+			       "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-system", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  READ, d->state);
+			test_mmap(device, system_memory(device.fd_xe), 0,
+				  WRITE, d->state);
+			cleanup_d3(device);
+		}
+
+		igt_describe_f("Validate mmap memory mappings with vram region,"
+			     "when device along with parent bridge in %s", d->name);
+		igt_subtest_f("%s-mmap-vram", d->name) {
+			int delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
+
+			/* Give some auto suspend delay to validate rpm active during page fault */
+			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
+			igt_assert(setup_d3(device, d->state));
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  READ, d->state);
+			test_mmap(device, vram_memory(device.fd_xe, 0),
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				  WRITE, d->state);
+			cleanup_d3(device);
+
+			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
+		}
 	}
 
 	igt_subtest_group {
@@ -798,38 +834,6 @@ igt_main
 			test_vram_d3cold_threshold(device, sysfs_fd);
 		}
 
-		igt_describe("Validate mmap memory mappings with system region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-system") {
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, system_memory(device.fd_xe), 0, READ);
-			test_mmap(device, system_memory(device.fd_xe), 0, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-		}
-
-		igt_describe("Validate mmap memory mappings with vram region,"
-			     "when device along with parent bridge in d3");
-		igt_subtest("d3-mmap-vram") {
-			int delay_ms;
-
-			if (device.pci_root != device.pci_xe) {
-				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
-				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
-			}
-
-			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
-
-			/* Give some auto suspend delay to validate rpm active during page fault */
-			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
-			dpms_on_off(device, DRM_MODE_DPMS_OFF);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, READ);
-			test_mmap(device, vram_memory(device.fd_xe, 0),
-				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM, WRITE);
-			dpms_on_off(device, DRM_MODE_DPMS_ON);
-			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
-		}
-
 		igt_subtest("mocs-rpm") {
 			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mocs_suspend_resume(device, NO_SUSPEND);
-- 
2.44.0

