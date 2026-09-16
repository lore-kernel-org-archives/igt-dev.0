Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31E0C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249FB10E170;
	Wed, 16 Sep 2026 11:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ra+NPBZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79BA10E170
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789559534; x=1821095534;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=1ZQk2LquV7MJoOJhML6WAYYb0LyIONK5S85LJLrylE8=;
 b=Ra+NPBZRC3fCQGSyaMG4GtMtTITjoUDw2szj+5z3ORv5TgL0LdP6h2yd
 p2iNr6sXmFuCDQuigzrUGELSKlQ7PTGP5bgDrOV7X1PFTnSiaaoijHV4V
 +YZmkoB6CeSz2bNBDfhl8crDV+fGm0/Qbr1phV4WeZPd5ZpeaFSL7KQpm
 37MspM/Y4uT3tYyPOre9Udr03ggV/w/Wljmz9md06lcCLuYCHcWAybewC
 5RUqGjd3EIG+1Qyl3MD57415jmCigJXZ8OzjvDMHHRfE+Ta5xS6FwhLNd
 wL5Vz1S02ezACqS/DutOa8IulCdgYFQKB5jytgILZO55jwcvpy1pVjl7e A==;
X-CSE-ConnectionGUID: vSEGEYy7QjqEIixhIDAlng==
X-CSE-MsgGUID: +WHK1lOMQimLV7peYdF52g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89777215"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89777215"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:52:13 -0700
X-CSE-ConnectionGUID: Upy1ClIFQXG8p9QjiWA7iw==
X-CSE-MsgGUID: 3bgzYpITSC6uTERG14B5ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277444857"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:52:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:52:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 04:52:13 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:52:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhGRpU9GZSuCE7vSFmXFjGkiEiKC0fPp9fejvlk/G5NMRzJb5iJUMJrZgiD+bAoC3WUZIUwSBBDz5K4cvmHXgisDl+B5qV8L04SCCc04PSOJuA75sBjVPrn5+CZew8zXu0X/4Ghropq8k8FBLGs81f1uMNgswmGec0nyFQaPkXgVlOtR4PJvXDeKbbTcjWwm85Hcv22JX407n4OyaYqsZ2HPIKO2kIerSQOkMWEm6CV9DYayEomSue7YJXTbq75Fsp+5MeaY4t2JRZxC1rBf/pZVUaWdnHjPbtp/hZ4CqoWnG++nuWKdsEUxZy+4eZYzCJ4KBmDH9YELsbzm040SFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uk863/DSYk2qArDq5/rlExv2fI2K+sBGuh9qpuKWWlQ=;
 b=ICm6ymGmgLF1MnoLXrqR7o2GwXkMk8Ktv4ccsGSMsrCzpb6ORdHhkDWkP0duK6LfLo13c/zDlnsVWVSwlERqbaPkHm5G3PTwljHoA+1WI6XBTIdHK9MAIq0bDlHbr9VlvkVqWSvMFOsrpMKsATHYvfpZjbHPbL3/K+f4T1cx0+Kw3XeXdLbA/jti4hMNSr+XQVWqwnmhCqKL4SLrP0haKS9+XkNYDPfIHZPFDD6QhwT7AFYE33f8256E/TP9F+4n9apKgjKCF97P6aHDPTwd6PdJJI6Yt+s3wVrhWHHJ+O/OUSoGPtSlzVjDYJDd1xdUPXPcyDKddGcELekojjOnsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS4PPF821BFB4AC.namprd11.prod.outlook.com (2603:10b6:f:fc02::37)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 11:52:11 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 11:52:11 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 0/4] Add PCI configuration tests for SR-IOV VFs
Date: Wed, 16 Sep 2026 13:51:57 +0200
Message-ID: <20260916115201.1973752-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS4PPF821BFB4AC:EE_
X-MS-Office365-Filtering-Correlation-Id: b39db5a3-455d-4335-a9cf-08df13e8f11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: SWwXulfJlsadeuLdN6z5f9/+JRJRjRY/SVM2P+TLA9vlwtXHt6vBVdo3kp3pXyBSdvZlmeAmsFZU7reogthtS893vioKRrlYoHDEani1OT7FfRriMC2/VWQUhFvcDu2ThQaEXBCarIEy9j26Z7VKloT7lJmivBuoShX1s95Z2HTLvsJd3v8fuCvHfmwYb9CADeqbuBtYNlfKnHqVNa+BG2YhpRc1l+SRwTEcpqJdxYIcthtn/cDHsBpj03v6Y9QiJFxyZ7ANupWnZiRMNCS/nXEFHeADQkRvv1HvLPGVTQ7vd9b+chRsVLilSXXp2Cl6coSG0tgJN/nWxUb8y1DJq03ic4gWjhLCB5iJKqvULwnyu6/sNOc98nbui1aKaxpb1OzmiCmFJUueXxLp0mxZl6zJ7uKfM5Q7lpaoJMIaXyrHYT3diiQjaP0EvPHBODNbW77xyLcEKAJttQEVGwnvFNZwxBV8p0lzFW/tkeVJdilY4iF6Kov5kY248DfbMBzZAQLkEdmOF/ETEiR6Awc7yiKxiIKRn63TxXU2aQTrwD8JtyFCkk4rSLR/NoYY0fX3XWRWV9umRyeScpjZGVYfzCnfv4t9wtf4QgGnfll8Z0aD72vZ7e4pdtTSkQTghKwJi99/eEqRAFmCj+xAAqJ4DmElfkMl3Z+eIr0lxOREFQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTlwNVZXMjJjL2p4UEhlbVpNeGhLM0xZczI4WENIN2VVWFlKVWVRMlRqdGhx?=
 =?utf-8?B?ZUtSeGxNZnA1b3BjL205VDBINWFteTQ3YzRRYUc0Q0lSa1o4ZzIvR3Y2R2Ri?=
 =?utf-8?B?TmhkQXRNTmJBS1N2bGI0c2NjbU53K2NnUlIwL0lDUkx4amRYVllNZDNpQzJN?=
 =?utf-8?B?YVVyVHhYY05TcEkxY2RpSThWZDMvbWRla05ZQ21BWUtEaE5GY3pwS2Z6ekEw?=
 =?utf-8?B?SGxvK3ZSanU5WFZ4dHB4RW1aYUxYbWhQUFRLQW1GWTNHRHpSUEhTUVFoc2JZ?=
 =?utf-8?B?QzA3eXExdHlWSnBOWWM3ZzcvME9CWmZhVVJmVTltMDlMUVhrZ04vRkNYTUFq?=
 =?utf-8?B?eVdSRTBjY1ZzQWsrQmJlWVVsWTdQK29QZ0ZUdkxNSzN1elBOQWZZKzNjK01s?=
 =?utf-8?B?M1NOSStqQ0gxcjVDaG1oU3JNZFpsdjJjQ1B4QktxdFFuZUhYUTBJRjM2Q2pH?=
 =?utf-8?B?QXJaa1g0U2RYejd3UGRtVXhXUWFOMDF4b2tPQ2NjRmZHMmdKOVJuNVcxUmQ0?=
 =?utf-8?B?My9MRUE3dUZ2aW85NTFLRUs2d05RWXNMWE9oaXdKRWVqVVVqMjloclZDRFF0?=
 =?utf-8?B?VjZDaXE3R1ZLTTRxTDA2VEQxVGpPUllJSG1FamJseG1oVGRNVXRMSzhDVDdH?=
 =?utf-8?B?ZVZsVUlVeFprVW0yOVJ0Sm51SEpvaUREcnBpMlhFN01aMUJSemVkMGJMa3pm?=
 =?utf-8?B?N1I3Qnp1ZFlHSitDNlFqbXQzTjl3TXkvcmk5dWtCSndXMHk0RWp5cE5SV290?=
 =?utf-8?B?ejIzdVNHZmdWcVJ1ODQwMmE3dzM3TUtKd0MvVkphOTdaUmpuNnk4Yzd0bm1x?=
 =?utf-8?B?TWk0RHM3Y0tyVmduRFF3QXE1OHpJaFlhR0lxemV6WExlcFF4Z0dBcWxRSExV?=
 =?utf-8?B?VnQya1ZkQjFLb1dBcS9TZ3A1UkR1VXEvUEVyaGd5YThwT3QrZGNveFVsVFJr?=
 =?utf-8?B?eGhYbEVXbUJHWmt0L2RGL0V2VlpmYWdtMkErQndCQ1ZVa2NXZnNEcnZJQWhE?=
 =?utf-8?B?aWFnNTREL05LMFB2MjZuWUJlOURWdkpZK0VIZmJid0tmdDJUNWtNOGRaYTQv?=
 =?utf-8?B?RHNCUnMxeEpoMDN2MkU2aFNRUE9pNFc3eVY0SXNSRldId1Q5RHdILzlnZTJp?=
 =?utf-8?B?cnJDNUxJYk5qMTRBRi9BSVg3N3JydXhUZDFHbEV3c3llVU1PbXN6SXhuMDEr?=
 =?utf-8?B?NDQ5YUJ5bEh3TXEzYmpNWHFOM000SzJMaFZVTmF2bGFyZHJhN3pRWjFZdVpn?=
 =?utf-8?B?SHBPemRZWU5QUDQ0Z0t4UjdPeERCVmsydExpdjNsZU5RVmRVdnE5bjZuT3pr?=
 =?utf-8?B?cEdZa25DR3Jvc09sV1Bycml4K0t4MGIvcXVrZ1BLdVF1dE1vWE1nWTRheEtQ?=
 =?utf-8?B?ckVjd3R5Tko5dWpWQ2xCZU1LVG9OT2NqVHlKY1VlaFhQTGhUMmVuRXBDYWZ5?=
 =?utf-8?B?R1QwREk5Z1ZZVlJpOXdaaFVsMG9TUENPLzhVNXVINTIxSEVzQThpRlVMejZi?=
 =?utf-8?B?SVV4VXRmZ3paaUI0NEZ5ZXJ0NnNmaG1TN3QyMm1ZRjlselFTRFMrNERqYnFS?=
 =?utf-8?B?Tk9KdFZJM2hzMGVIR1pzR2pXa21lRWJOVFBxTmI3TWlZQ0pEZzExMkxQUWdk?=
 =?utf-8?B?U0NKc1hoZU5GdzdyS3hneUxEcjBZcm9nZkdlaFFLWTFyYTlsdWJCdUR4K1N6?=
 =?utf-8?B?bTZJbVAwRTBoNTdYSGlaR2VSbG96NEpkOTQ2RkdISVRCdGozeU1OZm1BKzk5?=
 =?utf-8?B?Q2lMVjJZSjk0WEg0eXI3d0FuM0Q0MXhjWlJDaDdBWE1RNVNLL2pmdUwycSt3?=
 =?utf-8?B?eXh0Sk8yenNpT1BPL1RtUm4wVWhBWWFMMVprWG5MWSttYXIzSExkckRYaXlC?=
 =?utf-8?B?R2lLU3NBa1cwWFVjblJBYU1BRXpSb1hJVTMyamY0bmFLUThOZy9qZ1h3RDg0?=
 =?utf-8?B?NkUxV0RtOVVhUlR4c1FSSTFuNHVqT2szSXRHVUlSbUVUclV2UjExSjdtR3lz?=
 =?utf-8?B?M0JJQzAvQUh2S3liYkRmMk1ReTRYOWpPRmI4eHJVVmVYdGRjZzZxK0ZYMWtX?=
 =?utf-8?B?MGNLUkdBRHd2QTZLMXhBQ2ZLaHFta1diZ3JsZUh2aTM1R2cxV3FXY0t6MDZF?=
 =?utf-8?B?azBkUWJzN0JTUEo3RWJrY2VBZWE2d0tKNmhHVktzTWVjaTVIdGE2TU9ZeW5O?=
 =?utf-8?B?T2w4bklBTjZhVk1nNFl4T3loTzZJYkladFpnZ2MvOFpFUFNsbWR1eUJPMEVD?=
 =?utf-8?B?L2ZvUzlaWmRGWllWQUlNeUtJeTNMZDN6cUN5bEhvZzBjUGVRTzBQbEhHWkU1?=
 =?utf-8?B?SVUxUFFpOHZpTnlSa1dML2Q5dERJZnUrRzJtcXVXclJ0bEdaenQzdVhleUVW?=
 =?utf-8?Q?nRwNHIxRRlw07DvU=3D?=
X-Exchange-RoutingPolicyChecked: AogpNanp/OTiLBkvo+wKjeHmBTsGPfpRSCFpa99BWDSDcEqgYZl3npwu30aiHNK3rviTIRvlSx+IJRUXut60rTtKjZbP5xm0Lc4ARrlIIcGxI1TYLCMQ7dLTbOXezG5MYjo/HI0ECyqIjGiCsXNA6LY1+UZNWQ+MfWbG8bQKMs28a1WYTt0hDjC2uPKBmVFqv+xj+UFqmUCDrpENwyM056XTctsk/ealr6TO1uNqwy5xA0GaLRUQIIlj2KldpOpiF8yXkJ8j01NXIbsMMqdXaY/CZxaJrZJPQPUlLzsx4L0f7pNoZGzCiel7G9fJuDsk0lsGNF4IihsuyJMjlGZ2qw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b39db5a3-455d-4335-a9cf-08df13e8f11c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:52:10.9775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0y0hPv9Add/qRk+dHkl+ijSbsbsHkTv3k8RHD+MHXrpBh98MW+xMvPWCZdQFB7l0Ax4cOAXOIOFEyK3Rc73CDi/msUG+opZagdxv61On4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF821BFB4AC
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This series introduces PCI configuration space tests for SR-IOV Virtual Functions.
It verifies the required values and read-only fields in the common PCI header, BARs,
PCI Express capabilities, and optional Power Management, AER, and ATS capabilities.
The series also adds the PCI helpers needed to read raw configuration space and find
standard and extended capabilities.

Piotr Piórkowski (4):
  lib/igt_pci: Add raw configuration space helpers
  lib/igt_pci: Add PCI extended capability lookup
  tests/sriov_pci_config: Add VF core config checks
  tests/sriov_pci_config: Add optional capability checks

 lib/igt_pci.c            | 126 ++++++++++++++
 lib/igt_pci.h            |   8 +
 tests/sriov_pci_config.c | 352 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 486 insertions(+)
 create mode 100644 tests/sriov_pci_config.c

-- 
2.34.1

