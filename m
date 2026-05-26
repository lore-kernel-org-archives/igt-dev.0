Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5406ACD5BD0
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 11:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30AA10E659;
	Tue, 26 May 2026 11:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPTxYqQO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6058A89DC0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 11:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779795623; x=1811331623;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=6scP/Z3RWC5jzGi3EvmoHKSyePedpM5sRQbqQmMUkb4=;
 b=LPTxYqQOrRQk/l6cYNu4wCUSBdhcO1+Ruo9jqLANKBv3wPvNGPDS5guJ
 gtQXpt/AU3SRF2gQQmLpROr61l4iN7Oe69aPLBPo9RIT2UVohIQEAc8BN
 9FCaFJculPbaVpAadjPiozm18gnlD4dd28u7FGlsO2GvMmcOdU4jbNFoN
 7QBwmhJ/4WQCg2KXIPnPyGDx3e28jC4XSJo7nk95Z7DKKt9L5PWcXaI7H
 CAtiuf6Ahohsy87HcN2H0+15i7Q9aZVp522dfeGuFLcOfmwlqrYtHU3Ww
 hcC2uXVmY7viwuCEjl41bcGaB027xjGZdYHVq0WU48kdxZ+FSNjgn7TXY g==;
X-CSE-ConnectionGUID: pdG+qEcSSEiEJEGRgk8bNQ==
X-CSE-MsgGUID: Skh5s9JNTm654jt+2FuW2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80719681"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80719681"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 04:40:16 -0700
X-CSE-ConnectionGUID: Jq/4vbGZTcSqX8dHjx49tQ==
X-CSE-MsgGUID: 57uAjp9cTFO+3L6TxPMvqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="246863058"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 04:40:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 04:40:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 04:40:15 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.39)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 04:40:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgUcd2swYVZ/1myaReqW6g0ocNyVh+lGs9qqnvnSyLxAkSHjF5R0nPI95lMTJSuAugMXEeX4PN0rZEhbUUW+CP78O15NJ9E3TMq+1mtPJXMO4Bu//+pqBtbu6uj+L97k2uNUw2+WFE/dARXHNG02HSi2g8nSCoSRryy9MtaORvkbxixOxwvbKSSElWyha/1OdEecyVNZ0E2Zyyd4GmKNGaI6XdnaTjWDyXlVyYsI9haLwvoCj/4W9xPtFGuMG5XQcc/HIDaVz/EyiGpNEQWbTGyEwBcN5ni5UhMWBiEb9lmOWKGqDJQs1VkrJyo4mMyL3w6nSQWPiOKx7rWFoRBR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRfKfeMtpaJXTo1etKWIcJHqWcKa59S+sRKbTt5msP8=;
 b=bMkclDl0hGk0csIIWH60SOJCjUSkVGvPaIZhXiN/PTKGEVhqJp5O+zoH+R6Fec7yqqJ9NsCYVOxGe+KTIB4zWuJ/X4al+5cLbXQv7QrWmEJRehzRk9qkKUrotZCYALXn8pkRsgPIkOerbBV0N1ze1Mu2J+eS/kZoONtDYUyfL2P2cgdqMBvr9NWPkJPOcbC1BZlBM9ItvZsxAkp5AMsL63kOQ6dlZ1du85NfNERZWxwSORGqtLTRZ3bx64bpao/baJMKZPlWJ3AnHwia7hKTptDMikMo52HkLgexq6aF5dN9pxAwRzGAVPtamHlQHutQKvqU9Sr1l+d3paH54e35HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by BL3PR11MB6459.namprd11.prod.outlook.com (2603:10b6:208:3be::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 11:40:08 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 11:40:07 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH v4 0/2] tools/igt_power: fix Xe crash via drmtest path helpers
Date: Tue, 26 May 2026 13:39:52 +0200
Message-ID: <cover.1779793438.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU7P251CA0011.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::13) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a655dd-7fc5-4dec-c975-08debb1b8955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|6133799003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: Mms9LS0N1+Y1nErjoCryShsgLH5RVf9v5Jb/rC/oXbiDf+mIX1/zHuNEu9ryOOVe+46DofIwo8Rq8slPqBtz8RPQrf5J9L23Ue3wbXGtY7cU9rVdarf/PwUXSK5C+6/W3o8ALKkjZnss8oNRcJN2TzLo9GFqydT0XA0/pOhJszVS9Tm37cWpfxOArTR6i+5wk1xIfqxMNe8gda/E1duJdD7SmYy9vievqY1+C8hz+VIfjd0G+qZgfJEhkSdyYp2707lqEROgbtwI123vdSISZJfEtJKMOd45JS1SuArS78R/Yq5RTkuW9tUS7GMSAXJZfCt7yW+26Ol8vdooJpGoJNz08QB1huj2Iu9kgEvLuKDlrDM8NL/YiEBESBQB/UdDwMZ0V8g19r5YMVaF20N/ckN4IetN3jwqP7StgObsJXr02GwDWFaB5sCUNA/WszIRmU0GqH7V6a+iEAFUc+/mcXpq/OEwwUUUONo7NSZpN2/4yLZpHkdF1Ktj6D+TnZg0wa5TVD8fgu5IITr0quuVjwQr5vg/aUbpBK2sqXIsKT16m4I2bQ910tUo1xVH51n+F8Sc4iSOQTQleLkNBkhTff6gnFCTp9MkYqccPSatsPm7NWTD+mnhVTdT4wuvGRVvNBoG4qlJLMg+cJ2ZckZoM3PjIwldmLd105DRX5vdM1SmLuqneCzmz60jlSpFVmqr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(6133799003)(56012099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nk7z2J3kHG56Oz845/OhpncBhaJ6cG/EqTaWIedbS6yvbqdcLhtXFPIo3bJP?=
 =?us-ascii?Q?HbtOXevd8sVtv6Tuhn1tP7ALB414XJv7+62yoIFswZ1GRf4pOW+qi0iBHpgm?=
 =?us-ascii?Q?7Z1DnvNiE9+ZgGDk7Hb1eZVetuz6pYnHVx+fwY1YQZ6tx0jkxonUI6OojuwC?=
 =?us-ascii?Q?nlLlswDbAZt3EfmvAv39cfrCvZ7CcH3bBuCUZZSTo5dXiDVHOADBa4OMU4cJ?=
 =?us-ascii?Q?HHi2YhJSs/X5RAw2Sh1T7iL456x6T3+ko2QXwOdyNMfKexXsSLUfIomZCUTt?=
 =?us-ascii?Q?4i6+fiP46oYgwArIy32g2v10wEDXjEqk7ZL2+LIpl9ANo6XLJAGgMx1PSwrz?=
 =?us-ascii?Q?IlE05S+vFnoIPsXwqSX/FnOblk/veokzL+d4BsYo+eJ1o4BwrD+157UjH4Sf?=
 =?us-ascii?Q?HB2oKg0kQVM/FEoffeDBspHJc/stwHO3mlaz2SJbPY7j9IJsVpc1bud2h0SY?=
 =?us-ascii?Q?7wyN9ktV4tQcIcsetQ0lLTwm0YjfLhPDo3CtvUf3i/jVipx0EshldOJyRcxp?=
 =?us-ascii?Q?CKfjleA8hp65cj0p/lDDsi9G55PS9VmX/pbafUW9H+ZDanCp8+ymC4hPDK5f?=
 =?us-ascii?Q?bBQ/aR86uKlip4UUKIAy7Vx+chEQI/NF9PuDXFUlJ4VcCLbnaLmnnjgcK2uD?=
 =?us-ascii?Q?S+sdVnxGT3g/9b6u65ojuu6VObDvr2V1XpNbbHpzNga9tSpAZxbQ8d4A9eQl?=
 =?us-ascii?Q?fkU7I/VJtNBncIZz0vFkf3HNeaLJX5rCwLaAG3UJwRt9S8aX9AoR9TYlOtWg?=
 =?us-ascii?Q?euXvA8KehkO3yR2v4I6kXSl6GGZ7kCnR1UrdqGrdHjFQTMCTOtVl9gq9qTna?=
 =?us-ascii?Q?KpVYZpqbTgUUq3wwgsEgP+zWOcokyPkS6bzYOZeEcWX6w7YLSVYkkDoV+e4S?=
 =?us-ascii?Q?8k5YQEFx/XmF3iNNI8rx1O5Tv6HIup/hbLfkV/fhm6T/hGreYGxrVh91JGyl?=
 =?us-ascii?Q?/u01Stv0twDffHQHIeYNsB/466l2B3+bU3bBW4c/0Bjxo0our1k7oyzi9jFX?=
 =?us-ascii?Q?7gzRM5KdzL02W/g69Bd3fDIszJBOl2X/3MI0TSIEL1LHSveOFqX8WWfWIiFJ?=
 =?us-ascii?Q?Mr0I769+DCdxqanBqgSsQqi7Aynq3MTV3ZvqzAj77g7XaSoaFLQ0++LmxCX4?=
 =?us-ascii?Q?phy2vji30NIcwJAApNljkaK5/Rl8Xochv17A/BQmEciYdvnRiM0GKXOonILX?=
 =?us-ascii?Q?BbUYvrF0f4aycXYv57fTJjy38AK1ucb+vG4yUu+FPwBx4r49EXPB2dSL0opn?=
 =?us-ascii?Q?EN6SrTRxvtNUsLfFk/1zgEfBdI+31Sd/PGwoThOBpEW6iSxih8wat7HjaB9N?=
 =?us-ascii?Q?7SUOLfNOSFEZR5L1DVBF6hx50OeM9xSPl9+7MOee7Es9CwPflyoRr3fDw375?=
 =?us-ascii?Q?lKRaf3LcD/sH28OQsJveeQxbE6ue7RSD7uRicrIe4p544FOoT8lcvo01pKMO?=
 =?us-ascii?Q?7IGM2DNYFwTYDR7r3QgwRS3PV87yJ2VP1s3ezNdYnPtwYFX7PCGMa3MzHF5K?=
 =?us-ascii?Q?UxTOQfVaEruZmquZOZG6E8aw0E+5ehrn6Ly6wt9XFSsvqeAbIH47NsSUdabg?=
 =?us-ascii?Q?PEfNcwDK5mR4VQGEgD5Le1kgAmabj7+r8/l0PFG2q35QCLTDqq7HGlMtzBDX?=
 =?us-ascii?Q?4WwZ5J/6ZRsEIHD+pDTuFcwmO6ukrd0DiNXfNovavHDLWVj+04DmczpiiuNM?=
 =?us-ascii?Q?2BVeNPI8EKlSuNC8kCYcdFJ06j0q+y69O1TYatMgFCreRBpz/R9jP/txXyWd?=
 =?us-ascii?Q?0D591/tMPxbiFFD0ZVNfDExDTXbfl7Q=3D?=
X-Exchange-RoutingPolicyChecked: ab4PlfdyHbPSLAFSVfSpywXStRebmwfig0P6jVziRHIJqfw92SkqRmlwkjsVEwVGJRq+4mw1bMvXsXRAGh44GCVX8c5RgmwQLlucEHsi4Dw0ROsXbEievTrGTUuoOr82onP1y3wU7UeAZ4n6PZyGSuUQDfaosTRShL/paPElQpr7b68mUi71RxTM6Tf6tygRaYFZuwdYzYoBcwyZQngQAUQSXuXRPQMVAUQNoxSaKHmuao0iHVyWcbnmHNNoLQblrWkqknjuraBABUxXAahhJcZVT9m30kk0CHfBm5mqc156ooN00TxoWkeGrNRbvDrloA0JR2uKzNgPHNLiDskCzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a655dd-7fc5-4dec-c975-08debb1b8955
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 11:40:07.8803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nj02wUBXFaF7Ww8X1z6YifHjUNO9znesrArfR63qq5/i3C0pqXM8QZvzWDIdo8Flt4aRfjpzv/z2T76oOSF831ksH/bHhFkMtwU1gHveblQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
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

igt_power opened its DRM device fd with a raw open() call, which skips
the Xe device cache initialisation performed by the drmtest open
helpers. This caused an assertion failure in xe_query the moment
igt_power_open() called into is_intel_dgfx() on a Xe device.

The fix is split into two patches. The first adds __drm_open_driver_path()
to lib/drmtest, a non-asserting helper that validates the fd is a real DRM
device (DRM_IOCTL_VERSION) before initialising the Xe cache. The second
switches igt_power to that helper and its matching __drm_close_driver(),
completely removing the direct Xe dependency from the tool.

v4:
- rename drm_open_driver_path to __drm_open_driver_path (no asserts/requires)
- add DRM_IOCTL_VERSION check to verify fd is a DRM device before proceeding
- split the single patch into two: lib helper addition and igt_power

v3:
- remove redundant if (fd >= 0) guards on both close call sites

v2:
- move Xe cache setup/teardown out of igt_power
- add drm_open_driver_path() and use __drm_close_driver()
- drop the direct xe/xe_query dependency from igt_power
   
Sebastian Brzezinka (2):
  lib/drmtest: add __drm_open_driver_path()
  tools/igt_power: fix crash on Xe devices by initializing xe_device
    cache

 lib/drmtest.c     | 30 ++++++++++++++++++++++++++++++
 lib/drmtest.h     |  1 +
 tools/igt_power.c |  6 +++---
 3 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.53.0

