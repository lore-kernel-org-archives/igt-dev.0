Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9452BC53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 11:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467E310E64E;
	Wed, 29 Jul 2026 11:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cao3Hk7T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D9E10E053
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785323015; x=1816859015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8/3vv+2TJq568ScQNJ+X3MGQ8TxlWhouS755ZTs+zHg=;
 b=cao3Hk7TyyqjomIsPePorBvv0dDdYyA1d3sL58ajwpiOugD0w26lXoRa
 CaGT0JadrdN5Mkk41zTCXNBfBMLdFLRb2FHsYzhActSACqacPCPXlSAui
 a5JkwC9H9NpZDEStcobg4BmsrJ4OWbvNJaro9x9bvhqxrL1k7lve4GSeo
 sB4vp7qhFwbEYNK+8C5r0DGRpDn2i0E/aNi4vnjRfpClG08wLIsxtCT2M
 66dJ8QvOV2zt3rRCPXtBACoZJZPdJsLdeg5+d0NxrgAUeDNfbGmk5MEWf
 2XmVJmskdQR3Pekd7/PvZUAU2/TFhN+8AXmmC1a256gyoBcQcGJRskGcV w==;
X-CSE-ConnectionGUID: sRmjCJGzTtCHZ4WYrnlUmQ==
X-CSE-MsgGUID: FZSOXPeqSt6oqRCdSLI4/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89743512"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89743512"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:35 -0700
X-CSE-ConnectionGUID: rHX/5YljQrOFD44SvHx6sQ==
X-CSE-MsgGUID: 8wKFDSNpT7q94y1sxTcq4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256652897"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 04:03:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 04:03:35 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.15)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 04:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9K/ebtDHpUZbsGSc2pO6hH5DItxjuZTvwz4uGoYaDpkvXWKACyovm6HQ+olsNEVCGdwmOK92GNlNLzPA4VnckA2xABEpUSQzBQQFQO8UlZMLd0eTsqQ4O/RrghW41HgQiZz3+qVL4fWvNOnP85Awwo+nJKDsT0dog9DYSM7U+NpLIGKjdor7F9H1TPJl4bMdAvvmdrsr7UzOyMElZC7+/lhfYazA7OnIcnWiwIw+DzID29N9Ja+tSGyvOKevSZfOocD0QkiIrtWFU29vheB5pOxmGaGcLp1L341nUWHP/lgCUgGTE85q+Wi+uxh2bfPw/jeM3oB3CqJXQXT3u4Lfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvxTXZcCbJ2aRUNFW2HRI+R+D7Po0tdEApjweJ5jw0Q=;
 b=vziUdyhCfDeFiwn1TqE15AQ0q7T3T5VQBncr7ZGul3inpUAJKHyENuk9wnLKh/OpVvuKDtyXHlJOv9zC9dnaVxqi8MGgb71XR7vOmccVEnfmkGmYCWKMLbr+sU6wrnLzLH4ofqzjUgq177CZeaGgQ5tWOMmjMIW452OcXQZEGQy4GH4zvwGU/1lTMJVTU4z1QdHONAQvFi/wd+HnbDMaVZetWCR5wyJHrbcJv0MWrk0O/uJWNRzSzrSVjdMysZsdIDWrdoURoOjBC9P5ARiDgzOWvYEVv69Rrix1GjrWRMoo/A/7VIYFnVsZ8QRTeaT1UlQtOXJ5UrHnY8M39aJYoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 11:03:32 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 11:03:32 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH RESEND i-g-t v4 22/31] tools/intel_audio_dump: link with
 minimal sub-libraries
Date: Wed, 29 Jul 2026 13:03:39 +0200
Message-ID: <cbfdf8fd69713190d3f3d12ac9d110efaef96949.1785152675.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1785152675.git.sebastian.brzezinka@intel.com>
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::21) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: eacbd05b-7722-425e-9587-08deed61073c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YvmOdKLEO7NW7WgG49yPP330YeHBjo8c9ZSijEEjSfEBQ26eByOFdwVb3vNbnXli2Mp2JtfWDu8r1mFVnh+QyDi0AG2R0eBgKiMcvVsn8OdAjMvFGl0CgtGSgH9Rfg5fZLICzMjYy1L+6BsRIRa2vU5FO0zTRvwWw051PLLiR1lkaheKc2JV4IsMbapUAtOSa16PLTXZ6pYPGqPzidQ7HnA4Wq+vgzo1YehqSPc/K6Dx/naf0V3ssA533TeRL67ksNcwm2S87nXOkd7yH6N2jtO1wg2EBWHlq24HC/Id5hpaznG29MH7mQQUUYEj41VUO8k9SGOWkAAElU1NmrrsDUKQi0kNebz7GrtGH7uX8+dpUPMZQRH+CW0dOF+Qwz+ga1WC5BqdqVxLSH+6dbKy+Th9rIwMMW3WAawoskFLQWyFWwUnZ9ukKRP6S9g/9GeEj73HogHnPDeDXf+838tlfW1GfcZin9erUBpwSG4C36E4LY9/8t6Tn16YJaWNmA+TMSORWlvHfkOhQtgCS5ZQtM4m9MAOIP9qsafDW+cPRNzmePIF5ws5TpKVCl5aOaacQ6py5e7Wpe/fDhBiqMtV7VncdAyConcHdKmwc70lvkGbZnr72N5MXGVQgGEWI5VaJ3AgP+GQpszO6F5e6C28mu++8SzQlZbX/YwiLYf7yvc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C1bqUm9axZXW411CxfUvaG3DVpDOdgm0KPRuXBZSELi4UToAiDWb2qHzrsUy?=
 =?us-ascii?Q?MQ5xMuVXT/5/y9FTB1mr58ng684JO0U4avTqK+k/Twr+1agEeN8BO2XHeeC0?=
 =?us-ascii?Q?v4yZrS9MHJZyC9QKdpeCfAkT8gcNct93Zj22c+qMHGW3hnlZ6DvBmnh6eHlF?=
 =?us-ascii?Q?eCXTID5bWh7mKWiamsO9h33SZheYu55biY/osFD+BJh4qWiT/FJHJuBqfupu?=
 =?us-ascii?Q?4TL//De8ySGG99PzsH4XIiSqKb34iohIdh7dU1fBCIckHpFqUZh/CR3oddhQ?=
 =?us-ascii?Q?BwcJ2duwr6hAKTW/eWW0CA62yz/sGV9oR76JRKSyXEWRoehBWnZCAH2z92uW?=
 =?us-ascii?Q?OcpIrFFE0sWp7JGMK5rgX2MMSfC1awO1nzNowgH6lwV0I8urQdIdQDN1nc1q?=
 =?us-ascii?Q?48/+6VHnS2q1u5ANW9wQfWNSWPJHWMdNWa5VMdsJITOvdzGCIwwHyTJYnF3S?=
 =?us-ascii?Q?hEifZnz64JTvBoLgyNXf/N8Na79C+NuKsid5R7DPRdLuH5kJrCVN3FJz9Ner?=
 =?us-ascii?Q?/m6UiisNb3s6fsHdiQCGKEI8Fs79ye3rI2V8SpPMnM8oK5eRhhD0osmFFwc8?=
 =?us-ascii?Q?QZzTjR20p3NVsbvQiI1KBj43qQRW1zCYwuTJQT/+fnKw39iDvFWzxzKnpivb?=
 =?us-ascii?Q?xV1BlnHc3AMofP7S7xxkbvduxepkaySaMWTiVnCEj0E17l63oYAG9/+x46el?=
 =?us-ascii?Q?dRRBG9cZGf+juPGUrJaFpDjRbdmemNF2H1LwW/Rnot+4tLim9mgUncI/y9nI?=
 =?us-ascii?Q?8see1uWQfU76sX3SkjCIt96EBY3EH+Ax/EST7bYb6BIWX1YXZj+am0oL8q82?=
 =?us-ascii?Q?eUv3SgS3mh8pM2rGQb8OmW0kgWK3PxvQxGXNZkwO5l8mzqV0hcImkR992ibm?=
 =?us-ascii?Q?t0BbUn3Hsed8bLG9E9Yz9WZG4p4aBs2BTxs/bJ+H2jyOXprydvX8VM8bjI3o?=
 =?us-ascii?Q?cb6K3Mz0ngmS5ExRz96WEenF2cSfpV4ntapRdMskV4vJ9I2+wnsS1rWcsGVN?=
 =?us-ascii?Q?oQRaLDZbNISNkH9Z01Vdk53oSKxQIMoqRo+pAqYTQOHiquuCcSh85yOhEfS+?=
 =?us-ascii?Q?YCUbc7IA2FRVmQ6kkLEPNB3lmWnJvHFKs9aJ536p09rvWlVGh8fysbmq2+qe?=
 =?us-ascii?Q?RQdFl4UIzzKO1VTDmq7twHqAIbHl3pxeTyZ7zDi3jlwoWM/krPEVTr6eovKN?=
 =?us-ascii?Q?H0xSiuUUTA2WYrRwL/UGJN9QVtO4POOZmyOpkpNZT5HejxhaV3N8dbNCm881?=
 =?us-ascii?Q?x4uL5Qs6jf01cvU3AI58VxYhsKXUFEIsuINAwx81r8UzJuWrqOXSSgThgArS?=
 =?us-ascii?Q?oXOZETpNKfoV5sdT/cz1qwJe7eDLZ8pWb2W0h6C2Bh+hQ6YHnNtWRWgzidJM?=
 =?us-ascii?Q?jcAo4uYtegpqOhN5oCtlAK8gJqbRaaMyogp9Xm+KH66WcNbXd+e8Bkmf/vxW?=
 =?us-ascii?Q?kC+XKNmDhnSr45MZO3rYiBtoRT9NIDJ14ErWwjx7jODyBkOx3TyEDlFS6e4j?=
 =?us-ascii?Q?cjrCZ7yppqghTsBy7hejI9FAestfyuELZZF3N5PE5jUQTN3/SSeKEAGqLpys?=
 =?us-ascii?Q?U6V35CIdYry0/x/FcTJ+AikXeVVT1VhXjShe9BeDnj6RrqelOdpCmx9TK1MA?=
 =?us-ascii?Q?tBz5Wk3ExhhtoJ4610Rc5NOGdiZoHuyp1KJ24TKqUqBpANWlgCJp1uwz/87U?=
 =?us-ascii?Q?iwpM1IlzBQQPD4IOTS5Wlwsa7c+yhuACOowpHpiX+1gjRFiDWDvURB+BSxFO?=
 =?us-ascii?Q?xePRApnESOBCEOBEOlgy93piYcyFzmI=3D?=
X-Exchange-RoutingPolicyChecked: UoW1X0sZjORKmbFMPeFqsrZvXpt3qxsEGAGgIB28XZZUHdNc09rB1wfu2DRRJDbDU70NuNwSasoBIJW+uhlcJxQLsWC4RCuCZua19BRODxgoDvtWdfTPnYEJJQNQeZKY2/KVdyRXjdXKsnZGFd+td5C/DBgSMlEH3luSC+Y3eRyL+cPYt9yp75GAm3B0p8+pxz+WxBjxoZKMxRZHfpTqzKU6eW6BYr/2ojxKe1Ptk/RGEaww1zdqs5vU9AR91dngvbs0E/qiOmXsRK/Et4pU5PxLQxGNBeJ20Q24mhtgAU/e+CIiWXsprgdFwoj5RDKhbovAaw//5hP1Yo5DbEHGDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: eacbd05b-7722-425e-9587-08deed61073c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 11:03:32.5043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RND8xk16HT4A9H0OTs1llI5BHJWqnnFWKNhWo8IWT/+WkL0oSQOXTel/gH6xCBiBylxeDjHv8togkzGfdzoVxqyswnzcPGzzwkyevoKFNJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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

intel_audio_dump only needs the register/MMIO helper subset, not the
full libigt.so stack.

Switch to linking against lib_igt_reg_tools.

ldd before: 35  (ldd | wc -l)
ldd after:   5  (ldd | wc -l)

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/meson.build b/tools/meson.build
index 2e8ceea36..f9bbb41a9 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -14,7 +14,6 @@ endforeach
 tools_progs = [
 	'igt_facts',
 	'igt_power',
-	'intel_audio_dump',
 	'intel_bios_dumper',
 	'intel_display_bandwidth',
 	'intel_display_crc',
@@ -104,6 +103,11 @@ executable('intel_gpu_time', 'intel_gpu_time.c',
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
+executable('intel_audio_dump', 'intel_audio_dump.c',
+	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
+	   install_rpath : bindir_rpathdir,
+	   install : true)
+
 if libudev.found()
 	intel_dp_compliance_src = [
 		'intel_dp_compliance.c',
-- 
2.53.0

