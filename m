Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5B0C25B7A
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 18:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FDC10E39A;
	Thu, 16 May 2024 18:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ln2ZoEdW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1156F10E343
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 18:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883026; x=1747419026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=i9Qe5RBqg8LwrGbW9UGJEGL0D+1AP3Jeeti/c/fytPU=;
 b=Ln2ZoEdWiIjdYufZ8c8X0+v9eXGkQCCir1gz6rf5oDHtf7JVKKhcytog
 eXqYwpwpycXq713O+fO1LvFFY784p+8I0Ex8gRIWDTcJ3NWUUPUM8JZEM
 W7jgKkG7pMx5PO+ae1R+EosBgURRryRVaHFsx4tFO7WietO9vh0g8zk9D
 yZY4jOhbcfyIaleBMbVJxY2gi8+ZGmvmFAKUydCKdt+olVPBmgUEIajR+
 bQPlFp7u+cd9oTajHS9Gw61NwaBae4uT+wuscuf6Mmz16/BPuDtc/5UPr
 a6BD3ITnIaHYT0i7LOxykJTFxIMhwcB5Cut0pKyYsb51HFUGKsWadt0dB w==;
X-CSE-ConnectionGUID: aV7r9W5BRhqMzxbC2/nyKg==
X-CSE-MsgGUID: b27jkkPJSKSF/aLmrUMorg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29523996"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="29523996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:10:26 -0700
X-CSE-ConnectionGUID: iiT3SFtvTxOQNKNsLEnrfg==
X-CSE-MsgGUID: sK/SRD6XQFGWvVHjrszyrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="62349036"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 11:10:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 11:10:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 11:10:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 11:10:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7ZYsmQfYd5AkBjLrdjNPZhUpO0Ll3v8O/I0LuvyiBRxUGQ1PR/OB9eQYchDZKuYf9oDt8saYmBYERAG00U+T9IyZ8mePB6v9mykXZKO/WFsk86csaQbkwRT+dw0vs2NyX9TrX61MtBM/0j1BRbWncu3Li5x+35bmOpD0o0gF1fbvd6K3BGo3rqEXG4b5S7pvuXbSXiYjmVOBzOygUyeG5ffGVUQyqQlSJh1o+JzL3RAtddhaSvYvcYG+B0F1jJYjS0eia00jbcU6qqAR8Ub98y6rXckQTRIY9ZLqUxtH8mKCeTax2kcfdcpXspnx6sntDL8NCLpqx9/JYrl7jlVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tXVhTOjwCLHKWH9JMYk5rQb7tqoFKjiJ812lpHmq9U=;
 b=TLyukckwIfnl+MDpT7ol99zwxoMLxbagFx0DJNORj0SY1Fux5fD31+eeFhNhW8aCE+fjUB6eKHpIrR0mK8USeq1t+ytCO2RZVzRk59gBKAaIwv0Bk9SfJOTWW0YEoHVLEK2sX5Uj8KbhmHsAZM8YQTbdwzZevPdFCTiItf7ztQwLf7aLzMjKRb52fIkx+23vkCzb82VwrfumJujULfFPPELtvsTmwYOILH+Sit5hTbCdpQLNJ1pUbnDZQuwnW/OdRpB52rxHyqblzhYJ34ANu71WgfYmCoM8DIlH0zS1ZOtspW13UYz5e9QQ+NHhfu0oyGhxxE3tUBOzDIhDae9Gtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7660.namprd11.prod.outlook.com (2603:10b6:510:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Thu, 16 May
 2024 18:10:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 18:10:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <francois.dugast@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>, Riana Tauro
 <riana.tauro@intel.com>
Subject: [PATCH i-g-t 2/5] lib/igt_pm: Fix and standardize IGT PM library
 documentation
Date: Thu, 16 May 2024 14:10:12 -0400
Message-ID: <20240516181015.149824-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516181015.149824-1-rodrigo.vivi@intel.com>
References: <20240516181015.149824-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: e999a517-2382-42cc-f28a-08dc75d373cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yWZpuaULZR0x2ted9CKVeMWIX890yS1qZiYHlXzRnVdoWH7hSTqT9L0+Bwlt?=
 =?us-ascii?Q?mrjUvRFYNQHRbWg94Wzft8zA/BFlbXq9ATrSVq6Q8tT8GuMwGweCUqf4kn5Z?=
 =?us-ascii?Q?83UeLNep1kwaxwmDtz7hTrTYiFgTuJ6n9y2/bzKbrG08atfm1mfOVoWET0Aj?=
 =?us-ascii?Q?m0Zs8jfqmfD5jPw+lMAGJd5Vb1KtOnE2eCky2Y/we7uxsDJEySDc1WtUfSwx?=
 =?us-ascii?Q?eYWXjGj1bpvTQ6GYs55LFkbaPjP5s1zrrVNhmeAsDfNxBjGMQ1t55pSRX7w4?=
 =?us-ascii?Q?tUUuq2jSq4UmDj28A7tGog6LtMNetyZqXyFL+RnfYADyXp/H0aidBPdm16PU?=
 =?us-ascii?Q?+Baax62+lrc8OOCisIBoh/moOUbS64lBgSOAXv3qvyPzS36T+gA9pKnIdTi5?=
 =?us-ascii?Q?RgMDiE92cAjB6Pr2ObJKinlsEkj4XYFq/axO16iH7RNaOCftwDAQEzhEWlBi?=
 =?us-ascii?Q?9bNz/p+SAJZjYg3i0qdZZg4vH6MlK7Aa4Gu8tS/taJloGTNy9H/+tOLTS/Dx?=
 =?us-ascii?Q?jBRC6XQ5EZRqIybR8EqTS9iIIjScn8ea8gBwi86t1kloBfOa6LryMESCnlkV?=
 =?us-ascii?Q?cIkoHAkKnTMCxH2x16YbsqqjldYh3iObRcy56wIkIVqu8lGz/pgiCpfoIM+A?=
 =?us-ascii?Q?6Jl6ai0r/EbgYzhtI/pQnx/PhiSgwZJ34rJg1jOA7KSqUMnB8waUQL82oY5W?=
 =?us-ascii?Q?/gCtDs7ySKuTJDQZ9QC+sRjHA9bOVCn7Wie5aeCTGS3TTwltkqKEZVvuVWx1?=
 =?us-ascii?Q?evmXdISEoiZIYtP4dBwKCo0VBZDVwpuLFchT7a+2INGAZGSYryGMTzcLHXOA?=
 =?us-ascii?Q?EGtNoFzWep/jsKnpFT1IDETxGSbDixWWANizPjDuSxWAq/2vdutbW916mXqz?=
 =?us-ascii?Q?A25YliqazCDATwpLxHtkvVZj+7/n8SGmh0e8FE1xae6zlzX19hzQmoiGvywc?=
 =?us-ascii?Q?VoSJcAavLWt18fzOgpeiM6tIq/kgyLK9WXxneuwXj7P0HhgIxT8OsOsBFben?=
 =?us-ascii?Q?nKKSX5exdoVBExCY2UD8//c+6arNv9eIzrLwKJAhkZP03yORSt+ao9noIrpM?=
 =?us-ascii?Q?k7LglQALbCYUieA3mQXjISRHe9B55dBsRi8fRVGFuuYR++8TPF7dz/toWoIE?=
 =?us-ascii?Q?tBm3jGr7E5c7IA0FrsxaFLbHoV09aiAcE+tyPj3XTLkqQCiU1Vt0/M1+zFmj?=
 =?us-ascii?Q?YejVclLTi89tCwolDkUB9s0Ov3XZINq5z6pSZPO4U5ZU2i3Dp6tihEk1Nclm?=
 =?us-ascii?Q?WmSzbPobVIUwK1mA1WLWhsGmCavhp9CdydiHyr5kFw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sg+u1LnymatjAMPcatj28txY/fIjDOZ6eG184VZIgj47Qwj72A+AqhzymxcZ?=
 =?us-ascii?Q?qdmUaPTMdZKF8kotIEIbigUtZWHpsfjORwqmGmApzaTb4wPxxHef7Q57em8v?=
 =?us-ascii?Q?ac3dQGkXt4z/vUvfLOYiy3YL41ktKgosF4IZLoKqTgYaDC17Cwtbx3G8ZP3W?=
 =?us-ascii?Q?NitnZag77Wjjn8qK1VGIRv8B7VM99W1i3lPS0CBnLQZ45S3YNG0Nx0B3hQsp?=
 =?us-ascii?Q?82SjIbZduqqod+V4qGUxIC2Uqc3JMYuXAlsLFRHTYRfalmg3N/dooHff5wBF?=
 =?us-ascii?Q?NN5yFiZbjL1k487s6Ibnft7EryJhcwWDsE8uYzhIGY0pRJCn1yKktVMEsoK/?=
 =?us-ascii?Q?UEV+yObzLgLtehX6ikuXiCBeD0p8xJhfW6vKgOZHj8wrv6oOmqeHpBrQJIH+?=
 =?us-ascii?Q?2nyluhVpXgBSAy7wPGhzvmLkRT3VosFzaFzKFFTVuNLXF5L1gm7H9CPv0VbS?=
 =?us-ascii?Q?y9FIwMhRuN2LQFrFV7wKy2GwCfJ0b89sLTtvR2F6/wWLrrpu3vPs5c77GItx?=
 =?us-ascii?Q?uUBR3TUZeXoKXlEgolfUZxisGnqCghkiDattKSVxfHrI94dD1Wa6OGk6JiiU?=
 =?us-ascii?Q?7mjiVtf7x0VTNSeJXomySgFW0cZkcp4cwD/BpTUUNxYPscXmV2OhTAn6Sw+Q?=
 =?us-ascii?Q?wb8MOpisugU/5d1nvioolbmgyPNFbfKl5g6iYfR/9hoBIOZwFkFf37OWzmT8?=
 =?us-ascii?Q?Z7Z9BF0xVbCoZTACMgO/De14l1tMqXXIkYL27VL9Uhb27tlbIKhQqKKM0oBK?=
 =?us-ascii?Q?1Uc7MLtZwEQr0j7783D5Z0guD6uOLZs0Ou0VOO/gu2rU6Sx/81nU5MshPH8o?=
 =?us-ascii?Q?2sa8PSZ7sEfVg2UD0de3LDZEng+4xmi433fYkga9Y/eUUzHQcTLE4lMpfT8F?=
 =?us-ascii?Q?nSL/7u20gNjgAZqhogfmlw66gIYmEkottB1zDzGxN3KqkN5LrPUNDPSb/Tfz?=
 =?us-ascii?Q?I1r4R/xrX8bS8WcPugN6L1VGZiL5zewzz5OnODk61NrJJJgFE2tGOGZxj2am?=
 =?us-ascii?Q?30ym5mc/mHJYzNVkuv5X68g53aJTGZct8YQ7lfKAsgGkZR9EAsVtAIe9maEc?=
 =?us-ascii?Q?A6FQTGULcZogZfekZhB6ShLeBbDwBlg6PnlnsNnbgIyTYlh1eo2Q1oT/hh0C?=
 =?us-ascii?Q?9EtEcir0yJFgw4xSUgS+9xWuDzXhqHVw507z+pWLSDFH2FxFruLXT9msUvvu?=
 =?us-ascii?Q?pOABRmAlszmLxZkjJjIj2JTItWyLRqOapU5LOtCYv3FD8T+8rayXfVRv3Bqq?=
 =?us-ascii?Q?QbS7DmQM81ILUqbf7Vf92mjkphZg6Y1xuuVf6oa66yQtFKe6P9NOAbMa/O00?=
 =?us-ascii?Q?ETBT/VVD/+XxJPX94ZX5rTBun5FUjEkHP9sukFlcTWC3cH1AxL/UunSLXBEa?=
 =?us-ascii?Q?b9/is7CWEf89SPgUilT19ovONLbIsN7sDxwdjCA6elmJdBsFYCkyU9xg+z07?=
 =?us-ascii?Q?0ldDnlpw3QAj4AR23xRP2vK0thgimL0uhW/eYgpV6RXj97vO228HETYuYsu3?=
 =?us-ascii?Q?prJsgCZ31i98DTbNh+T+HMSHF+QY/tYLpMYDFrG/+IY6whKSMPc3EvAzSgpi?=
 =?us-ascii?Q?YWgS0WJV7URgeOV3AxUTwrTDqkA7GYFd5/fOJHVPj1euD6AzFPKA6WwpDLMW?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e999a517-2382-42cc-f28a-08dc75d373cf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 18:10:22.7494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CG+vRbibLv3FqNYJT/Pa9z/jbhFtQ457b9N5N6CBTBA5CCqybMa8hRbhaD3naSSu6WLd0nJW07NpKfCatKzGqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7660
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

A revamp to get some kind of standard in the various exported
functions in this library.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_pm.c | 148 +++++++++++++++++++++++++--------------------------
 1 file changed, 73 insertions(+), 75 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 928b72685..2c91aeb33 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -454,7 +454,7 @@ static void __igt_pm_restore_sata_link_power_management(void)
 /**
  * igt_pm_enable_sata_link_power_management:
  *
- * Enable the min_power policy for SATA link power management.
+ * Enables the min_power policy for SATA link power management.
  * Without this we cannot reach deep runtime power states.
  */
 void igt_pm_enable_sata_link_power_management(void)
@@ -469,7 +469,7 @@ void igt_pm_enable_sata_link_power_management(void)
 /**
  * igt_pm_restore_sata_link_power_management:
  *
- * Restore the link power management policies to the values
+ * Restores the link power management policies to the values
  * prior to enabling min_power.
  *
  * Caveat: If the system supports hotplugging and hotplugging takes
@@ -566,8 +566,7 @@ static void __igt_pm_runtime_exit_handler(int sig)
  * Sets up the runtime PM helper functions and enables runtime PM. To speed up
  * tests the autosuspend delay is set to 0.
  *
- * Returns:
- * True if runtime pm is available, false otherwise.
+ * Return: True if runtime pm is available, false otherwise.
  */
 bool igt_setup_runtime_pm(int device)
 {
@@ -658,7 +657,7 @@ bool igt_setup_runtime_pm(int device)
 /**
  * igt_disable_runtime_pm:
  *
- * Disable the runtime pm for i915 device.
+ * Disables the runtime pm for i915 device.
  * igt_disable_runtime_pm assumes that igt_setup_runtime_pm has already
  * called to save runtime autosuspend and control attributes.
  */
@@ -683,11 +682,6 @@ void igt_disable_runtime_pm(void)
 	close(fd);
 }
 
-/**
- * igt_get_runtime_pm_status:
- *
- * Returns: The current runtime PM status.
- */
 static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 {
 	ssize_t n_read;
@@ -711,6 +705,11 @@ static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 	return IGT_RUNTIME_PM_STATUS_UNKNOWN;
 }
 
+/**
+ * igt_get_runtime_pm_status:
+ *
+ * Return: The current runtime PM status.
+ */
 enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 {
 	enum igt_runtime_pm_status status;
@@ -728,12 +727,6 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 	return status;
 }
 
-/**
- * _pm_status_name
- * @status: runtime PM status to stringify
- *
- * Returns: The current runtime PM status as a string
- */
 static const char *_pm_status_name(enum igt_runtime_pm_status status)
 {
 	switch (status) {
@@ -757,9 +750,8 @@ static const char *_pm_status_name(enum igt_runtime_pm_status status)
  * Waits until for the driver to switch to into the desired runtime PM status,
  * with a 10 second timeout.
  *
- * Returns:
- * True if the desired runtime PM status was attained, false if the operation
- * timed out.
+ * Return: True if the desired runtime PM status was attained, false if the
+ *         operation timed out.
  */
 bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
 {
@@ -791,15 +783,14 @@ static const char *yesno(bool x)
 }
 
 /**
- * dmc_loaded:
- * @debugfs: fd to the debugfs dir.
+ * igt_pm_dmc_loaded:
+ * @debugfs: FD to the debugfs directory
  *
  * Check whether DMC FW is loaded or not. DMC FW is require for few Display C
  * states like DC5 and DC6. FW does the Context Save and Restore during Display
  * C States entry and exit.
  *
- * Returns:
- * True if DMC FW is loaded otherwise false.
+ * Return: True if DMC FW is loaded otherwise false.
  */
 bool igt_pm_dmc_loaded(int debugfs)
 {
@@ -821,11 +812,11 @@ bool igt_pm_dmc_loaded(int debugfs)
 
 /**
  * igt_pm_pc8_plus_residencies_enabled:
- * @msr_fd: fd to /dev/cpu/0/msr
+ * @msr_fd: FD to /dev/cpu/0/msr
+ *
  * Check whether BIOS has disabled the PC8 package deeper state.
  *
- * Returns:
- * True if PC8+ package deeper state enabled on machine otherwise false.
+ * Return: True if PC8+ package deeper state enabled on machine otherwise false.
  */
 bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
 {
@@ -847,10 +838,10 @@ bool igt_pm_pc8_plus_residencies_enabled(int msr_fd)
  * i915_output_is_lpsp_capable:
  * @drm_fd: fd to drm device
  * @output: igt output for which lpsp capability need to be evaluated
- * Check lpsp capability for a given output.
  *
- * Returns:
- * True if given output is lpsp capable otherwise false.
+ * Checks LPSP capability for a given output.
+ *
+ * Return: True if given output is LPSP  capable otherwise false.
  */
 bool i915_output_is_lpsp_capable(int drm_fd, igt_output_t *output)
 {
@@ -887,14 +878,13 @@ static int igt_pm_open_pci_firmware_node(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_pcie_acpihp_slot:
- * @pci_dev: pci bridge device.
- * Get pci bridge acpi hotplug slot number, if bridge's ACPI firmware_node
+ * @pci_dev: PCI bridge device struct
+ *
+ * Gets PCI bridge acpi hotplug slot number, if bridge's ACPI firmware_node
  * handle supports _SUN method.
  *
- * Returns:
- * PCIe bridge Slot number.
- * Returns -ENOENT number in case firmware_node/sun is not supported by the
- * bridge.
+ * Return: PCIe bridge Slot number or -ENOENT number in case firmware_node/sun
+ *         is not supported by the bridge.
  */
 int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
 {
@@ -928,11 +918,11 @@ int igt_pm_get_pcie_acpihp_slot(struct pci_device *pci_dev)
 
 /**
  * igt_pm_acpi_d3cold_supported:
- * @pci_dev: root port pci_dev.
- * Check ACPI D3Cold support.
+ * @pci_dev: Root port PCI device struct
+ *
+ * Checks ACPI D3Cold support.
  *
- * Returns:
- * True if ACPI D3Cold supported otherwise false.
+ * Return: True if ACPI D3Cold supported otherwise false.
  */
 bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
 {
@@ -958,11 +948,11 @@ bool igt_pm_acpi_d3cold_supported(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_acpi_real_d_state:
- * @pci_dev: root port pci_dev.
- * Get ACPI D state for a given root port.
+ * @pci_dev: Root port PCI device struct
  *
- * Returns:
- * igt_acpi_d_state state.
+ * Gets ACPI D state for a given root port.
+ *
+ * Return: igt_acpi_d_state state.
  */
 enum igt_acpi_d_state
 igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev)
@@ -1155,12 +1145,9 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, i
 
 /**
  * igt_pm_get_autosuspend_delay:
- * @pci_dev: pci_dev.
- *
- * Get pci_dev autosuspend delay value from pci sysfs.
+ * @pci_dev: PCI device struct
  *
- * Returns:
- * autosuspend_delay_ms.
+ * Return: The autosuspend delay time in miliseconds.
  */
 int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
 {
@@ -1177,10 +1164,10 @@ int igt_pm_get_autosuspend_delay(struct pci_device *pci_dev)
 
 /**
  * igt_pm_set_autosuspend_delay:
- * @pci_dev: pci_dev.
- * @delay_ms: autosuspend delay in ms.
+ * @pci_dev: PCI device struct
+ * @delay_ms: Autosuspend delay in miliseconds.
  *
- * Set pci_dev autosuspend delay value through pci sysfs.
+ * Sets the autosuspend delay value for the PCI device through.
  */
 void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
 {
@@ -1201,26 +1188,28 @@ void igt_pm_set_autosuspend_delay(struct pci_device *pci_dev, int delay_ms)
 
 /**
  * igt_pm_enable_pci_card_runtime_pm:
- * @root: root port pci_dev.
- * @i915: i915 pci_dev.
- * Enable runtime PM for all PCI endpoints devices for a given root port by
+ * @root: Root port PCI device struct
+ * @gfx: PCI device struct of graphics device
+ *
+ * Enables runtime PM for all PCI endpoints devices for a given root port by
  * setting power/control attr to "auto" and setting autosuspend_delay_ms
  * to zero.
  */
 void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
-				       struct pci_device *i915)
+				       struct pci_device *gfx)
 {
 	int delay = -1;
 
-	if (i915)
-		delay = igt_pm_get_autosuspend_delay(i915);
+	if (gfx)
+		delay = igt_pm_get_autosuspend_delay(gfx);
 
 	igt_pm_setup_pci_card_power_attrs(root, false, delay);
 }
 
 /**
  * igt_pm_setup_pci_card_runtime_pm:
- * @pci_dev: root port pci_dev.
+ * @pci_dev: Root port PCI device struct
+ *
  * Setup runtime PM for all PCI endpoints devices for a given root port by
  * enabling runtime suspend and setting autosuspend_delay_ms to zero.
  * It also saves and restore power control attribute for all PCI endpoints
@@ -1234,11 +1223,10 @@ void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_d3cold_allowed:
- * @pci_slot_name: slot name of the pci device
- * @value: value to be read into
+ * @pci_slot_name: Slot name of the PCI device
+ * @value: Value to be read into
  *
- * Reads the value of d3cold_allowed attribute
- * of the pci device
+ * Reads the value of d3cold_allowed attribute of the PCI device.
  */
 void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 {
@@ -1258,10 +1246,10 @@ void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t *value)
 
 /**
  * igt_pm_set_d3cold_allowed:
- * @pci_slot_name: slot name of pci device
- * @value: value to be written
+ * @pci_slot_name: Slot name of PCI device
+ * @value: Value to be written
  *
- * writes the value to d3cold_allowed attribute of pci device
+ * Writes the value to d3cold_allowed attribute of PCI device.
  */
 void igt_pm_set_d3cold_allowed(const char *pci_slot_name, uint32_t value)
 {
@@ -1294,7 +1282,8 @@ igt_pm_restore_power_attr(struct pci_device *pci_dev, const char *attr, char *va
 
 /**
  * igt_pm_restore_pci_card_runtime_pm:
- * Restore control and autosuspend_delay_ms power attribute for all
+ *
+ * Restores control and autosuspend_delay_ms power attribute for all
  * PCI endpoints devices under gfx root port, which were saved earlier
  * by igt_pm_setup_pci_card_runtime_pm().
  */
@@ -1342,8 +1331,9 @@ static void igt_pm_print_pci_dev_runtime_status(struct pci_device *pci_dev)
 
 /**
  * igt_pm_print_pci_card_runtime_status:
- * @pci_dev: root port pci_dev.
- * Print runtime suspend status for all PCI endpoints devices for a given
+ * @pci_dev: Root port PCI device struct
+ *
+ * Prints runtime suspend status for all PCI endpoints devices for a given
  * root port.
  */
 void igt_pm_print_pci_card_runtime_status(void)
@@ -1361,8 +1351,9 @@ void igt_pm_print_pci_card_runtime_status(void)
 /**
  * i915_is_slpc_enabled_gt:
  * @drm_fd: DRM file descriptor
- * @gt: GT id
- * Check if SLPC is enabled on a GT
+ * @gt: GT ID
+ *
+ * Return: True if SLPC is enabled on a given @gt.
  */
 bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 {
@@ -1387,13 +1378,20 @@ bool i915_is_slpc_enabled_gt(int drm_fd, int gt)
 /**
  * i915_is_slpc_enabled:
  * @drm_fd: DRM file descriptor
- * Check if SLPC is enabled for the device
+ *
+ * Return: True if SLPC is enabled on the device.
  */
 bool i915_is_slpc_enabled(int drm_fd)
 {
 	return i915_is_slpc_enabled_gt(drm_fd, 0);
 }
 
+/**
+ * igt_pm_get_runtime_suspended_time:
+ * @pci_dev: PCI device struct
+ *
+ * Return: The total time that the device has been suspended.
+ */
 int igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
 {
 	char time_str[64];
@@ -1438,9 +1436,9 @@ int igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
 
 /**
  * igt_pm_get_runtime_usage:
- * @pci_dev: pci device
+ * @pci_dev: PCI device struct
  *
- * Reports the runtime PM usage count of a device.
+ * Return: The runtime PM usage count of a device.
  */
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 {
@@ -1455,12 +1453,12 @@ int igt_pm_get_runtime_usage(struct pci_device *pci_dev)
 }
 
 /**
- * igt_pm_ignore_slpc_efficient_freq
+ * igt_pm_ignore_slpc_efficient_freq:
  * @i915: open i915 drm file descriptor
  * @gtfd: open gt sysfs fd
  * @val: value to set
  *
- * Ignores/un-ignores SLPC efficient frequency
+ * Ignores/un-ignores SLPC efficient frequency.
  */
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
 {
-- 
2.44.0

