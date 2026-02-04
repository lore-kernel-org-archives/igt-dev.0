Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2E2E9D3E5
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 14:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE1810E65D;
	Wed,  4 Feb 2026 14:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIwErB5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2384710E65D
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 14:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770214593; x=1801750593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6DJbVF4p+wg+moEDSpOgBrfBPAOBJ2aze+WVHQS4Jno=;
 b=HIwErB5ONZuoo20nKFT2hMO4FwC6d16EWnQfH8SSUrnvgenml63P2/d1
 /0sF/v5pcQaTsVLi8XvBFgMUJ1mNKCw9uGgIcEQ8WT4ZM1WUYDNNcQFQu
 CD0MpCgoAdTF5ply2zxS0OztXHBr+WEYB3zvZKVSRflZqS+WQLAgTruBd
 yD94fIp8RbX1DwBJ6v3XTJqrT1sC0vYIvf/IY/TabqiHibUfjMLfQLMbC
 TU0oRagxNdobnC5VEq0s/yVkl6K+JCGAORQbdP128cBA2N76Jz78plkvT
 BMvYX1K86BXaXXt29o/9QCrMd6+Y6D/lfa96xKcTaSxvHkgqcq9fn1WyQ g==;
X-CSE-ConnectionGUID: 3UdXhszHTRaivhUjtqPFRA==
X-CSE-MsgGUID: KLT+NjFFSJ6hrbFRB9tUJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82835224"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82835224"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:33 -0800
X-CSE-ConnectionGUID: 9ctEXsGkTz+MiJ+a+BraLA==
X-CSE-MsgGUID: UrMqZtyaSS2O07QoS9Il0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="214668643"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 06:16:31 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZcHP6hVsfDTX1V2CtRQqmhpJzLzg4n6IhTim6O6l1MdSJsptMFbjVpodewI/o5Gxl/gaBJJYMC+zdN3/fkJd7wD2mYhXzmmuDLZVx3NR8/et4CbOioXRxHBpOXkE9J89i4wc1E1WzyprHJ8o7seCrSVmDYSmPQZY1cFWnrJ2JunBiL86Vv/qjb5pcDrkwMjylaNDpYM5cg9JSri/N9zXwSFhKe0OEPJESMyj1G3zaMsGnNxUrUav6yMjK/C3xYaMLt3Y9wPpdwWeL7QKDWeurLAQxQDE307jOGy2KrE8rt3oaMKUVnTSxVipfTyOXcZgQhNDMqfr48ps2mtTiujag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxQ6sJnf5OGn/PIm0u3I3piz0InLplaCqJj9/ss0kMY=;
 b=JuXRetUCU0yujMwYq7DYEp7BUk8nUwyEDCAsP/3bjSuC9dqye9fcuwe1l7PmKBhvRKk8ysVw8ZDSfO6Vz41eA/5Dy3c3wwINkgO4SQUE8VzmpWIXg8YYQq4+e+ShwOxAYXCoOcPcH6G2C2FWIzru80Rl5pGaJij51eF4vQGgAfqQesI+hc0tVBXLzfEXqbMsakDdn3tnjq42wjtNouxHUPDfgyAnnsJHDbxstb++H5ZaM4n66iMDZa/sXS0NqBSThqB/eUdwv8yZ7TkO4aHLLW68GbTLj+tOHd2pr1oAHE8eVJhayrvTOFo51SaBa9BvCEqFWbCWgvSMaaekg9j0eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 14:16:28 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%3]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 14:16:28 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: [PATCH i-g-t 2/6] tools/meson: sort tools_progs entries
Date: Wed, 4 Feb 2026 15:16:04 +0100
Message-ID: <5a029b0e37ce4d57345c86ae910b7aee19cf480a.1770212190.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770212190.git.sebastian.brzezinka@intel.com>
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: af99c3a9-e583-4681-a128-08de63f7fc66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fXSernIO323JSTTOx+8FxMJRAXQyPBG/GA3W2qiHLSyeBs5btcaoZsEMq5w+?=
 =?us-ascii?Q?YY+9hzmFzOspTKHWutHJwc/5WgNEO5srMpxn8iE9J8sPrjvVXMXdyXaMM9XT?=
 =?us-ascii?Q?pt5Fn/jJxbTp1WmlhHpQv9BbdAD1dGs++koZnUdtSwBpkxQd5Cm8thVawfai?=
 =?us-ascii?Q?S1pIBcrgIiDBuTtQMaanlD++Cyb1XPB2k+viPOP3XTmso5iyn3/vd43Dk/i4?=
 =?us-ascii?Q?trh7dHKDX1mboqh8AyQ4Krp5FyV+6LRmtsZZYu51Kof9Fhy1cm7l5Dwm+TYD?=
 =?us-ascii?Q?wZ7wq9tZ8h4r9VwZpLpwUe6IOcwoIIrOSjoqzVE4lFeu9Ky1d0kFI7+bEIW+?=
 =?us-ascii?Q?/R2PLfwna/T7G36S8tMaIT46lacbnbzzE3dNsjtU6tE97AkPwS15oWIavczh?=
 =?us-ascii?Q?Gs8nlfWZ83/G4IzBZ0vq6Dvd4b9HqRzIQyLOq1a6zCdXW/zIDPCfHBuRu9gP?=
 =?us-ascii?Q?v0/2lThplYQ0MfwTr8kHJ/aso3L2Aj+B7+dAcFxo3XaAxm8uBKRxC4+duKCp?=
 =?us-ascii?Q?HI84wTlPdq7ltbJ6wZDSA2nlokNUCXANw1ayUJmr8dslj00uJ8do7TmETGMM?=
 =?us-ascii?Q?n6FL9EPRDDxl+mwcWFKyyQsCoEVpJIaJ9Y4G4Oy1ZvnIagyIvzmS/pVgyNVE?=
 =?us-ascii?Q?lfTMev13M9yIZkGt1F1C0bZGxrGRc7Fh5nK7unI2+WvUl84FEjB6BixVSGk0?=
 =?us-ascii?Q?LX4mhkTFfi4kgMh7mUgexphl1lK2v+qX/sIQqLBPI1iX7NDfQlNMJrUkss4S?=
 =?us-ascii?Q?l04peVii3f2YjRdXuRd3PKibfAidO+U898sifg5MInD5Dcnf5t/Uq35T//jr?=
 =?us-ascii?Q?5OkBkaXkGfmNNNq3z9dtXzsROqdWcKNI83oXHNX+tDM06iCgjVmv4W2s9aBl?=
 =?us-ascii?Q?XmOaA9SQVkHGVUh0IRZPmfLKfNj+KbNbjksHTfIzehVMNwymDCpm+NOeFW6Q?=
 =?us-ascii?Q?cKC44/KEU7yF2qbV8Y36gW4EbBRigw0ddshYaA8JfmGI18aohDsJwhFSaVF0?=
 =?us-ascii?Q?4M5qNZN22i2YlwFOUJLRvRx9YMShn0piW+U1uOQP1zzi4OJ5qhBcZ1G0UdfP?=
 =?us-ascii?Q?r8TlU2RPNwOOu3o9vnfrX+M96gH2mZQktmhX8nUS9fdIDmkYb5QWH44VfC9K?=
 =?us-ascii?Q?ewEzQB9kGIQqGeqSu/XUS5L4YQm65wKjbsg5NOc95XxWB/dqcuwW3eLNzu7D?=
 =?us-ascii?Q?y71eCj4p+sLe1zzPTV0q2nKCxrtvVPRYYbF5N8b/y6ej8/OGajTNDhjpJv+Z?=
 =?us-ascii?Q?vxuBrfJJkRomNY8ZvL0U6EBmo5kFSZg45lj50WKDw8Pjh3s3aSD6LXb7b/Bq?=
 =?us-ascii?Q?tqdgYXY4pK7A+0CMDvww/xluODndeHmWjrRTfpWrPpgVHsALKrk0QxAcvKsB?=
 =?us-ascii?Q?z+FEl19PaMor+lQDXAWI7OsV6RiDrHzO2NG823z87UwW0y+AzBuzvfwvWfnw?=
 =?us-ascii?Q?rlUwXKhND52NQxn7oenlkkstn3sm5xUEYQT4pCQvkwBBqRQXyBytrBNw2PWf?=
 =?us-ascii?Q?LjJcOnrchogF9+fTli1I7CF9iEqxqofiKvKQ5CF7FMvvyTKCb+pRVMkUg0rS?=
 =?us-ascii?Q?esPGNNsa6g6qqpMQMM8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rzj/WUWqRdX2aWOwCQ67pDhCodezJc6bTuer0NjrSJ/3Aa/cujv1Lw6EkRNa?=
 =?us-ascii?Q?ixebYxaoj86+5ecJLIUr90FsVt5kahCMoDJfQafhIbZsyL+UGx+Dn22+DbDz?=
 =?us-ascii?Q?rMRm5WZVN/Lh+SxNQssrgj6vvTii9owlZn+wGkFvmTzoUNI3PLBUiV10fWkr?=
 =?us-ascii?Q?VtyGuzfwZqyhzEdvspt9vC+gIVCeIEptP8Ft1tQJhde15TeskjNzGDO5+PeW?=
 =?us-ascii?Q?1ibAiA+Ih4g19qVIi9LRONSSrVo6ICIjAjDZLp0jUfs0u9fw8FvnvmZcQIOa?=
 =?us-ascii?Q?p09IfO8tE+sJlIbOiGafh2znCXBMlVkfV3KEQM9JARW/fyV66DQfhaGK7tjv?=
 =?us-ascii?Q?/Z096S5iMnVb76xgjXdMBm7+EGGCHRQ0M/lA/X3MLpP5deg/gZKduPVVVoMJ?=
 =?us-ascii?Q?TfBoaWYNVuX9ckxYXwIg5Yzcnbgu3gAcxWN/+NbL529pGS78d/CBsq7NHOWe?=
 =?us-ascii?Q?9BocByHhkYyeYoAGCQA3CcddJ70H84YI50wa1zY8gbiV3MsMY0J49kIIg7Pm?=
 =?us-ascii?Q?gaOLscfqgWuPD9ng7UETdB+Abdh2xzNaB1pe27ypgGuJW+qicDRNN/IUm9Sz?=
 =?us-ascii?Q?EboyTLZAYQB5pFq8VGG6T1IxLqIcX+8hjC/bvXvHQS32hNncutbTKkucpxQ3?=
 =?us-ascii?Q?pCLI39ifCAvLmORpRg62zjvnw4d7I2YB0bcTvM4pdT+1Vv5EmYwI+tYCtRwy?=
 =?us-ascii?Q?jwvFIwpkWNYziFph+JYcnjDaMWJN6bwOlg3MO+24arjDvpOx97gqNZXzssIl?=
 =?us-ascii?Q?rB/NVadN4FRxVeI6IbcodIF2vIa6GmUh8IAQhci08hWNiig8rxng6Hpc7N6W?=
 =?us-ascii?Q?X1XyUejevBrstLDGJfXjCchvKJFoR9Nk9MqURWQB05iqH5vOoyEaDRyX5iUg?=
 =?us-ascii?Q?7kAI0NlBHrGt9lDXMaYmSADy6Y92lV1MrpA2i2gSwbrGM2HSGGL6MSiENaHB?=
 =?us-ascii?Q?LDMXv7jglUN3Ou6ecCi46VM4rNoMa4ata7J2M7OqjByrgPEkBS31ZI3nSVoR?=
 =?us-ascii?Q?/n6QTZR6deUoIRUdzqKWGa7AIm0pExvfwzyvBykOeoQg7Vjb8BkPMpUYTt84?=
 =?us-ascii?Q?JU2SSv5E/GC2ZrnSQ487c9y9Ttucugv9tvE5TSHx9KRkiEuAaiKlt+/lqwvd?=
 =?us-ascii?Q?2FnDMYU6aOKC048QLeO36ToTWTh88hdzlsby/zKQrQ7QwzBhmAdkuk3ZOHAP?=
 =?us-ascii?Q?2N9fRQR7kZqtxPurcexUJ6zmVdr8hxMfzoNrt8EnB7GnXgn21DLBmfVEauYW?=
 =?us-ascii?Q?NC2vWaIF4GuuuGpPPnjZ+J4NnF9YX7fjHHI1CPo5SJo7urQHUOHAluZEk+Ev?=
 =?us-ascii?Q?bv49QtIfj28yAGvUB6dayf1WAq6sRS64FCMEATbdNZY9gT0nxIU4ZJoaBPPh?=
 =?us-ascii?Q?dpMGj4b/j8pkRA6I7UJD+TPHKdJvSVIYcDwGqMjo1IL6jZ5ZmUGuNobZotg4?=
 =?us-ascii?Q?Y9L57Am9Wl3+xBsWf8y6vI7ov1wWfnePxlzG10cR6kzwCbLBgM45JWeKrFOm?=
 =?us-ascii?Q?FT37j2rVp8wrc+4/RBEhgjACAha2T/PFoaS0QYDfAaI244bZ8tIoLCFzAEkQ?=
 =?us-ascii?Q?Ogb6aP3wztZ8Fj0Xlp7XC5vmjEBFcbMu85ILgocx3cXx+FaXA2CknxpNIOcB?=
 =?us-ascii?Q?xqzO/A7ln+EKD2RXAVJ9FTPPkQVj1B2teUdGSCg1Rcq/oOHlpLvZ4Jc7NQTO?=
 =?us-ascii?Q?tZgIDh8XOYWJJF8seBxjN6+hzgZKHhjdOBsR4sylIcnSXrzkrNf/vdEVxtxI?=
 =?us-ascii?Q?3S57kArOB6v3fdrC79m+BVzIYYtcXPo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af99c3a9-e583-4681-a128-08de63f7fc66
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:16:28.3758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buuIniGJkr7+ohI7JflXWwsgxGiJwL+sOZMko3AuSHDylcbEI5S4ev5jMOd0WmpATGRVBso9QXlIPiLYxMnIFPX6TZWkRFPhcOGfT4Epmhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
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

Reorder tools_progs entries in tools/meson.build to keep the list
organized and avoid duplicate or misplaced tool definitions.

No functional or dependency changes.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/meson.build b/tools/meson.build
index acd394e23..039103ce0 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -12,6 +12,7 @@ foreach prog : tools_progs_noisnt
 endforeach
 
 tools_progs = {
+	'dpcd_reg': [],
 	'igt_facts': [cairo],
 	'igt_power': [],
 	'igt_stats': [],
@@ -23,13 +24,15 @@ tools_progs = {
 	'intel_display_poller': [],
 	'intel_dump_decode': [],
 	'intel_error_decode': [zlib],
-	'intel_forcewaked': [],
-	'intel_gpu_frequency': [],
 	'intel_firmware_decode': [],
+	'intel_forcewaked': [],
 	'intel_framebuffer_dump': [cairo],
+	'intel_gem_info': [cairo],
+	'intel_gpu_frequency': [],
 	'intel_gpu_time': [],
 	'intel_gtt': [pciaccess],
 	'intel_guc_logger': [cairo],
+	'intel_gvtg_test': [cairo],
 	'intel_hdcp': [cairo],
 	'intel_infoframes': [],
 	'intel_lid': [],
@@ -43,9 +46,6 @@ tools_progs = {
 	'intel_tiling_detect': [cairo],
 	'intel_vbt_decode': [],
 	'intel_watermark': [],
-	'intel_gem_info': [cairo],
-	'intel_gvtg_test': [cairo],
-	'dpcd_reg': [],
 	'lsgpu': [libudev, glib, cairo],
 }
 
-- 
2.52.0

