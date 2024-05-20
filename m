Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA34C25B7C
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 19:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD1510E752;
	Mon, 20 May 2024 19:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTaZ7aYr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4C610E87A
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 19:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716231856; x=1747767856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mpbwaRU+d+iBiJlGnh2Ai7ra/0YLx/oIk4A8QhtQy94=;
 b=cTaZ7aYrEsurKRDwx9j7+wa8bL7mwCpqDYotlvhPjzgF1tvpPL3VV4xW
 9jeEHZpTDXlBYfeBnNeJy6WJypG6uysqpRg5DDQkm9U0CsXxhcTEOzbis
 i/Upm+tU1hSj9jioSFAdLfkYmNKw96CQhERxPwHK4qQQEa4QmYrNHog9W
 aOz1nWSBRi4VAv4ckO/wssd+sJN6WmU26fIEIigi/LvQ2HMPVo1iE2ylJ
 Ff/6SOjueVCmX7Qk07AaH/THFwt9eEBjzinp77rL4bGr1rbdcsMgjMaty
 yTpcDT4+mQiaTsWeXj9fqmGnbzJKLKVujnZzrisigl8IGRO8kazX4pecl g==;
X-CSE-ConnectionGUID: N+9R6nd8TP2OMw8O9uCQMg==
X-CSE-MsgGUID: KviFnmleRzOJhGd2yY9Bkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15330843"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="15330843"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 12:04:09 -0700
X-CSE-ConnectionGUID: 2NBAcJl4RTauM8CoOEX2xQ==
X-CSE-MsgGUID: odCJ5FPqR4ehaTC1e7nDKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="37479349"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 12:04:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:04:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 12:04:09 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 12:04:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNbv+nq6d8GnAK+OS398i1GN7V7QiBGLVAEVF4hozG6YIfYqEAiAaCJBWaPGyntY41ODwstOolNb+PiquYShkYFBRFhA3du5k3kRWf7bXDPTyl0/Zp6evhFZugco65gT5i3LT1sRFjr2ximRcFrokAnKYjo6BD1j/o7GL9j4E0bRQR9dMpW/x8PHmuJ94Aidy5h2ZFGYMCXXGUqs6/XYRLme+KIrxxDeeiJYach1RlqSBikyOdYAxXAkrKhXU6aTs8qrR3keJr1hutU9e4gmwQasvUvHVieoRG223jnV01sS+CFW++2ZpZWS+q3PRwXzqjSHFN9U97ILpL1CLEsZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDPUsx5UnNh0Thlhh/mZ1XMqyaf6sSj0ZIwFHAQ6Qns=;
 b=WPCt99WXIumXElTje80sSMK6oClHvOOC19ReRJ7QUyKsPredGPMNaYcPimcXimx+HpVCw+J+iKQzhld8fnkTalNAEKJHPehnx1AYXx8+gjKiInWBAKtBChCX7YzEsy3JJmNiB9zBRiNm91xCHzHOMc7uw7fXEnDcxqwGddaifVQszCD2zbEtoMyavJiQgQKXyS5d13O/yu4jksKU7H6NjdAHD3kU8ooJG/ee0CApl6FDtWIYEapi0ATwlVnkxmEhrKeqiWwkxQtsCiif74o1TEv5F1SF42Kv3CA0poMIVqyGcAWYl1/7oUh3uEZ6xBsuYgqTklyT9JJoqOgascl4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 19:04:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 19:04:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Swati Sharma
 <swati2.sharma@intel.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 6/6] lib/igt_pm: Convert suspended_time from int to
 uint64_t
Date: Mon, 20 May 2024 15:03:47 -0400
Message-ID: <20240520190347.242249-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240520190347.242249-1-rodrigo.vivi@intel.com>
References: <20240520190347.242249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d4353f-f30a-45a1-7d23-08dc78ff9f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?twsUGX1WXrl411zjGqAS3d2I0lOF1XSr8yHu4YUGhvBVGyZkLxCyakAWdWem?=
 =?us-ascii?Q?5DDOvaJU+mKrCoqody5COwh8PT2Mux+73xeE0RVLfaSSINWHdZv7DNY8jeU4?=
 =?us-ascii?Q?P7dGterk9F8Go5YIyeC+m09DStP+HsukPU0IZLHcehJ01uY9OVoaqFDLTZNh?=
 =?us-ascii?Q?ChX+w+whBMJx8wJfLUnKKA42RITJKD48br+2clOva2ebXtDmbTmAk6kl/uhx?=
 =?us-ascii?Q?t+2k/7ujeHYZlf58kRydwmiawNrkGnGNCk3D8yKyR37A6PM+sRrbJ3AfSrVB?=
 =?us-ascii?Q?nukARoRQLYQrT/MuDc6jNvbZeWN6aWbDwt4UWzo4JQHeAD6ULFPLlQN0Py9N?=
 =?us-ascii?Q?L6uXb3W0+hZwKzWZxPmeJ4dK4TecmrWbnzTCWtbibmKdIcgZmRsFHWffjG8h?=
 =?us-ascii?Q?Rs60pkw6bOyIsUY/FD9+p9NbCpSXAk0/agzpJxQJC6W3Y3LbGHsTAmRZsdnR?=
 =?us-ascii?Q?0xFkYvJoN/gFV3XqYreYz/vFIgMNbhAahU6DrYlMcqLyrqvJrhKAGRXO2gqD?=
 =?us-ascii?Q?Boi7osMd+H38OmOn/R5wix9XWM3kZYbH1MIIJjuqm6q/mCwzOIAEvwHltWuK?=
 =?us-ascii?Q?WomJqBK8h8n1YffjlcMs3er3GNbXDBT64ScPsOC2pcuOeiwBlApReMPeI4DX?=
 =?us-ascii?Q?RG9N2nocodxoGAlCNlpihbtLfJ1fnqEi/1D3ZUzJXw94lnFon2n00xVCm2np?=
 =?us-ascii?Q?T02pxWDfDFlx/LvUg5FNN1P+VJ3x6HwQ5kagqi2lEHSYnTwDR430JYy3/XtJ?=
 =?us-ascii?Q?4MdHl+cvzzRnM6J+ig8nkxxQ/9MxEn7EJhr51zZ99FCsWPpGXC8bi1gOWZxC?=
 =?us-ascii?Q?cWVRX2p3kJmk4Kt61mVOKAxKzIeOss2sw/TRNokO5CzxIcBLt9nLBha6Bl3K?=
 =?us-ascii?Q?edRA3gLTdHrYi89aoI0LfUf5hLk3qX8aKl4BnKr498XKLu/JhSJy7By2nCTG?=
 =?us-ascii?Q?JNeLjF3Bom14gkJ3oOnuwKUNYkgbW51bhrifPoPnKydC4PmRhim6g+G0t/6R?=
 =?us-ascii?Q?k5ib1p0znpl4OK3kyUfkpkY7eR+L8cYknkJmiEpu1rtT9LI/o5+35JH87g3F?=
 =?us-ascii?Q?Qz5rQJqN22dwXaMFSIbpOf7JxR8xldxCpTMPPSX8rC/v/rj2LYZ0n08+e1g7?=
 =?us-ascii?Q?KXQcqFgBbfS/nJSeK4BAZRG/v6Vvt/WSRhMa+QovHkgs1dgbhi0k213hEzuD?=
 =?us-ascii?Q?jsUaS4EpLwXRrbJXq7aG0v14IYtH0UDcbWacvbZmrUzlYMyDbl8NN9Uph5TR?=
 =?us-ascii?Q?CTQcWiuNJK5cr0wj7bEycPx1qP1aVjJL+rPqNMg3xA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0le36J9xzlgBDq0KpAr+GhZ3RLoOohwVZbmJKTQQqlSbGe+x1jQncdPpPlxW?=
 =?us-ascii?Q?Ri53FKiZFPjyrHwLvw8EcI2b4vn9pPDNEcELB+Mp2AV3a1ce5yeom1mu4Tv1?=
 =?us-ascii?Q?f5E4A1OnwYFaWI4CgS0GhKZ2aBDho7lW+CcZ8P1Ne3BmabVQtZLpnzTYdcOG?=
 =?us-ascii?Q?AL70mbGvhLB7gAxwrIdy7T9NHYstsKhRZ9NHyS9jMxm3dsRCr+MVADfKJRlw?=
 =?us-ascii?Q?PizyR9ej//iUwS0rAuHUU4NIR1YrdVs/P52MlVJWmRlIRVO+uMevz8H2PTnI?=
 =?us-ascii?Q?TBt9/Iy9PoGjMLsJ8h+PWOeLMtZ+VQC1d3Wcv5t8Kbw6qmlHznQgXkhCTW0O?=
 =?us-ascii?Q?zgCQndm6lvjKL2fWwHoOAgxUi+hMzhc/X0JMCOLReOBRH8kP0oyJs9zzRvw5?=
 =?us-ascii?Q?lZCyJRWCEGQI85phyadzvY0ysh+QzMCzMjWPixHd+T9EAMJA0FaCltKSeQaV?=
 =?us-ascii?Q?2xWl80QXwS9wifS+SfBP83R8pIF1i/VKqVl4e/8NwaROEYWeHt5qKUXEeZ9J?=
 =?us-ascii?Q?QDC/WIrjgjaHNRU8mSJVLLk0pdxtdq7eovNI7lbCqENFckYbK6iVlTRiC41H?=
 =?us-ascii?Q?QGBubus4u1jQDRBRVOIPRZ5leJWQdEF8YhEpHSGGrY7c8YmLofZsl9WrZReL?=
 =?us-ascii?Q?ruP/pxVfTKazNyQkOobw6nc+ipNhsFCbGF0Bsd2AD4y2ho2O3XBrE2GDk7u9?=
 =?us-ascii?Q?i9Cvw1LnEAz7GxOL52pgaTSC21CHFhbeIXPfaJSuSEn5E5sYxFxKkwRU1QkL?=
 =?us-ascii?Q?dN4hqSe0342AuWt70DxK0DcOH2i1UTjZq6ndzCAfGo5rSTzCL06X9+laFQat?=
 =?us-ascii?Q?3bfd1bFHbifceuMRlsFS5Qtz3/JFLENJxfS0x813AjQjnPQ20dpeGm3p9IkM?=
 =?us-ascii?Q?/6zvyVaQGcrIkxPN35JH4SSum5Qqe/3UCVrzXfGCo/rAfkOijjCm2mpfoY2r?=
 =?us-ascii?Q?FRj/qIeyhLJGV+cQJ/FohvNR6NYEIDDJScWgXuZcoclRVj1JaZQiG4KS54Pm?=
 =?us-ascii?Q?CHXQ526WQsB7VeUe7XqbZAt/9vL/mNnXQSK/4hspDlsZf4++ICKbRvph2DaM?=
 =?us-ascii?Q?Z5RfiMmxzLM1JLowSbf2zpKKAHS/bXs7GAVhgMbhFoMBv0NYVPRrgJq4YjFo?=
 =?us-ascii?Q?TDglsPqPK8qrWSHmwZYzOQWlhWqR2PJEo4lF7p2Vn+Pq0UOaM9Blwf3N1o5c?=
 =?us-ascii?Q?tUVKjpkOwptyi0peSyiudEdn3sDymwiogPvnk2TByNM2kFwualMyG1hfKGFT?=
 =?us-ascii?Q?UG1MWDrZRsXI766kduCKVTxT8uIwHAB65E7lcJG0xKNJ0q6dtguNCYGjkqXU?=
 =?us-ascii?Q?LvjhRd3bjjbwNlLZo3lcuM0xNuiwIMUr2L0rpfyJBSEm1RByA9AUMZMqJrz5?=
 =?us-ascii?Q?D4i2vSsm2aatnDFELrHrtYul0A3pa/c0hEVV3zChQxuBYDnyf3p2FAfRGRtc?=
 =?us-ascii?Q?57W4K0do2utO3ZR/bBQakojT8msxlH70RFMNvItL/dnPKih+GbRmpT3Z6N39?=
 =?us-ascii?Q?nQhrb9/1aPYZ9IEN0rR8e+QL9tjJwlIcyQeR/i3ZUtkeMqDIfhytFHyJDzJ5?=
 =?us-ascii?Q?4zSCrI5c8k8AgLDlHsM37FYcnTN/4liSvN9AB80WwTnUkGkVY4RE0wgBkr7R?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d4353f-f30a-45a1-7d23-08dc78ff9f4d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 19:04:06.7278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/Dj4+0wo7G2Kq520m8HSXloadmL4RlvTdHx6F0VMXi++kNWcASf+J2kHhmzV8wZH8LrvueOcnMjnWX8RvFJZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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

Suspended time is in miliseconds printed from u64 variable in kernel.
Convert to a more appropriate variable type.

Cc: Swati Sharma <swati2.sharma@intel.com>
Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c            | 9 +++++----
 lib/igt_pm.h            | 2 +-
 tests/intel/kms_pm_dc.c | 9 +++++----
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index d54549d11..057634203 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1392,16 +1392,17 @@ bool i915_is_slpc_enabled(int drm_fd)
  *
  * Return: The total time that the device has been suspended.
  */
-int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
+uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 {
 	char time_str[64];
-	int time, time_fd;
+	int time_fd;
+	uint64_t time;
 
 	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_suspended_time");
 	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
-		igt_assert(sscanf(time_str, "%d", &time) > 0);
+		igt_assert(sscanf(time_str, "%ld", &time) > 0);
 
-		igt_debug("runtime suspend time for PCI '%04x:%02x:%02x.%01x' = %d\n",
+		igt_debug("runtime suspend time for PCI '%04x:%02x:%02x.%01x' = %ld\n",
 			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
 
 		return time;
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 15e301533..6b428f53e 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -93,7 +93,7 @@ void igt_pm_restore_pci_card_runtime_pm(void);
 void igt_pm_print_pci_card_runtime_status(void);
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt);
 bool i915_is_slpc_enabled(int drm_fd);
-int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
+uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
 uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 176f7a04b..7766d34d7 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -488,10 +488,10 @@ static bool support_dc6(int debugfs_fd)
 	return strstr(buf, "DC5 -> DC6 count");
 }
 
-static int read_runtime_suspended_time(int drm_fd)
+static uint64_t read_runtime_suspended_time(int drm_fd)
 {
 	struct pci_device *i915;
-	int ret;
+	uint64_t ret;
 
 	i915 = igt_device_get_pci_device(drm_fd);
 	ret = igt_pm_get_runtime_suspended_time(i915);
@@ -500,7 +500,7 @@ static int read_runtime_suspended_time(int drm_fd)
 	return ret;
 }
 
-static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, int prev_rpm, int msecs)
+static bool dc9_wait_entry(data_t *data, int dc_target, int prev_dc, uint64_t prev_rpm, int msecs)
 {
 	/*
 	 * Runtime suspended residency should increment once DC9 is achieved;
@@ -522,7 +522,8 @@ static void check_dc9(data_t *data, int dc_target, int prev_dc, int prev_rpm)
 
 static void setup_dc9_dpms(data_t *data, int dc_target)
 {
-	int prev_dc = 0, prev_rpm, sysfs_fd;
+	uint64_t prev_rpm;
+	int prev_dc = 0, sysfs_fd;
 
 	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
 	__igt_sysfs_get_boolean(sysfs_fd, "poll", &kms_poll_saved_state);
-- 
2.44.0

