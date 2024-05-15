Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E71CC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 15:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B542710E4EC;
	Wed, 15 May 2024 15:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0Q4NwtK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C2710E549
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 15:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715786179; x=1747322179;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=HDOy3l+EM8K5oq0WhQ3KpUxkF6Ek4P/6nMja3zig3Wc=;
 b=X0Q4NwtKMkdApF3N0Q+wcU6P/o3cxZHYydwwHmH6i4Ug1bEpqNTcMqHS
 zP/Fh0r8yNlgDOg7WVDvH8nPCDVj2fIbq3vnc6b1npUpkZopHczypLsLP
 x35iAuqWkgQH2sn7KuLpQB9ZczJs3piL+qaBQWC8/tMDJcQXcxTfAvvzy
 ZfCtAOR6p7zGlntCDTM282qaUM44V3dROX3thUSW54yhIFRD+4NeV6pFB
 55Sphz8So+rLwX72YTJKoBLk40v2CK0bv0cU675+ztCD0Qep2xU8mWfBi
 tcwT9Ypt/7XYD0Z3dI431SE99o2Ct8xZL88hL55vyrEPtouDVH5rqfb4F g==;
X-CSE-ConnectionGUID: dntvmvbpT7uzjGb1y3UCPg==
X-CSE-MsgGUID: TT1ax+myTy6B8TWwh+sHAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12060596"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="12060596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 08:16:15 -0700
X-CSE-ConnectionGUID: mgf463iUTnSovp+AFnyesA==
X-CSE-MsgGUID: w5BwNYcSQPSF2Z/NsSequg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="31161597"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 08:16:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 08:16:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 08:16:09 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 08:16:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2JUaPcupo508oGH7fFnHy/wG6v2tXIG3fUtJ6V46uE+0KuIsgXqZNEwaeg9iSPqijVaoMy+vXsT1IRUEPE7w3gHuZFIcvuvR5Jipr6/9QifsFD31Y26aHSr4Du+w8O4FPNJI3351c9Yzb1W3w05uP7VJx+9ziQ7ikmAe+6+IftB8exFnbtDJE2s3Pzl1gM9fCvHlgbdgc8U3OQ3jPdWmEQRUVCbG4sStM+D81OhmB7aTnH1q0A9K4kGXU/2tZsiPos67u/9jbnwcUgcH6b+VLaVIo3gpvMZeHSkZxDISmAmYl+3uYbLaLHpaylBTvHz9h3w9FK1WK5mOKToRgQ+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHwCqpRep/CYBfNy0ivQEaKK/a4EvE03GNhmAPL/nw4=;
 b=TryVodzmMb4Brbb0HCCZqHsQFjR44fvOaf6IRp1qFxAo8Zt37DBh6W/CrWqi68DyH9p09sgz/vT54aT2oIZuXuJd3VCfRMH/7ACDnJZXn6CUw0SvwqPKjQ0peBPGjaB5+UBJ6TU92ecAgAX1K7FCWTnewC6js9YXn4KFlBHaAlc/dbdpftzmAcIeC4GO40E0RN2XZ2ygGe0itd0hZuiK6XNt48hKixU9BPtwrOLWvENbv5cuuoD7CVoBf6onRWsioaO7E8XDUqfzmYKbrwZ5ioh3YgTHWo8lNCEDeMx30Bw7+C5qS1q/TQPDDaEXEBxe3UB0sKifgrZMO1NXlMekcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5217.namprd11.prod.outlook.com (2603:10b6:610:e0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 15:16:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 15:16:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_wedged: Force a rebind before exit
Date: Wed, 15 May 2024 11:15:55 -0400
Message-ID: <20240515151555.70885-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5217:EE_
X-MS-Office365-Filtering-Correlation-Id: 8343f7c7-2199-4a9a-7d2e-08dc74f1f1dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j6twHqK/MMX/+qdNHjt75/fbeg/hEMRNR2MU3e/UNBEvLvCsKJjgzvVAp6x7?=
 =?us-ascii?Q?JzhfXxLzV0S4vV3M0InJXsAQpnHhy9LZ7Q27oVuexoh+2mz5eOKH2egaSuKN?=
 =?us-ascii?Q?NetubjMvP8Uji6PiqVzG550s1jbFJzmL9ix22UpLNMdY3JFZ3ZBO+aVE6ZVH?=
 =?us-ascii?Q?NX6pROVGHayxlQeWQ/XNRftBm+ez4tSq7xRvkAZs7P25zg+AwkUksJ3v41QD?=
 =?us-ascii?Q?0SezRir+4PLGCQv3v/x3zuL3BzsLJqonxu7s0bNAEwricVb3yv3gZkjWNdtL?=
 =?us-ascii?Q?TAaRo/Lmk74k+BfCALj7wOkkc1guFftdtDjUbgog2sdV5UQ+wr1S5tqtP5ju?=
 =?us-ascii?Q?cZz9cdXa1JED4rVHSryi1Lp9gd4S98EK8WaRQ0R+IAHSTzeyY+93hMmCel2F?=
 =?us-ascii?Q?FE4pcpaf96mcaojloflI4eRnUn40RBmp6fKFBAgjwFUbVYHV9kE5W61CIaIp?=
 =?us-ascii?Q?OEkFQ+f1mbUFUMExx6XTUgzqFzW25tpxLCiBC21cMak0zK7ikHdhIHqbJ0sJ?=
 =?us-ascii?Q?5ovB89qQvYTEoob+a4dGBAdsU7GaSHTvFy9unErlntSvjKlUdyj+uMEGarQ9?=
 =?us-ascii?Q?yZMatMPA86yTB9AIFmvbdJbmPju/QWOLp2qliKlHxy+YXC0d2gEZO2T1r3IN?=
 =?us-ascii?Q?KypLvMYuHkf9EpP2GXHCHJLVjBjgsU5fBImbq3BFsKcefZRLNaWdOcqedkUL?=
 =?us-ascii?Q?ynuGMrgf5Pg4XlOn/pRCQBz+3Yp37LEQTvi4pmEOynQlBrcNYo80AFimXV0S?=
 =?us-ascii?Q?GnS/fmMjL8P6yzRyiTFunhQLu0/MkwkXDi9jCLJICU4nU6zlTm/k80zJp7FN?=
 =?us-ascii?Q?tmE3IFzF0VmW9dwMkLy0VpLoofz9kHUO4fjaI0QNVX689gM+ndNjoNLgQG5D?=
 =?us-ascii?Q?CewsogLanHZvDgHWcG8q1LZjkoR4SYnM1H2UuMQ8Ei7vx/u/G09XVeerdbyL?=
 =?us-ascii?Q?/QZTlexdm519ionRQiQ2nc6Mv8/02HhEqZGClmY2s2oZ6HrMVLd9jkxpWixZ?=
 =?us-ascii?Q?zncECdbqz8HsHX4dghMwOb5RZ3e+qplIaG2UPk+J7UTKciGqq7Lk9zHF/lA6?=
 =?us-ascii?Q?k53Qqn2OAbOTGOj4hP4gZQjFIVQlEwsY4FifGhm6zI5wYY5eXEaPOneY+wNA?=
 =?us-ascii?Q?n4QUTdaIu5kth47rfrqBMmlvtSovDv9MAtrE6HjzCrz7qNSAvyxFSFMn7BdZ?=
 =?us-ascii?Q?qXvw1pbigTgRWmO2rO2dMHdPyAH+Sfm//2ZDZLfII6kp6erQzvhxgq0G2Q9N?=
 =?us-ascii?Q?fTdM0VcYtzpZ68nJuZc+5YagaogvR9wbHGhW1LjfvA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pcZzhHr87lgmKM9/FAs3lDT2kvbXPrjiztmsHSzOpzwkGailePLRQq+0zUoO?=
 =?us-ascii?Q?TVi3bJeyN1OYOOYR2Ad+Im+lwHf7VWh75bCROniqri0M1yheYP4PniHmpJJP?=
 =?us-ascii?Q?RiYBttyfNeqBNnVgoMejZ/M+mpKWSRbcr3h5wIvYXpDD+aH1rRlz157S7Woz?=
 =?us-ascii?Q?CiuU5V0KD3ToPFMZjo7soDvfgCjPVdOqE2azLBkmI1SOINh/zKIeaACvc2Pv?=
 =?us-ascii?Q?BQSxF9OjmNbzoi/Pg83Z/b1y3Rkl2cMAom3txeEjvk0CxpQGFC1dH701Q/Zm?=
 =?us-ascii?Q?h+mcGvZIeyx2q8TUW8sQK5vn5Dbd2x+lG0KlR10Ed6Z7MpfOITIzw72CYaSF?=
 =?us-ascii?Q?1zh30SMhviDdO3rHejJHYREz/TNZ4F22L6mMx7GO6zie0OIntn0J0+6i9LJD?=
 =?us-ascii?Q?bUlVXCs7PMLu3K6Tcqz888KT1pX4hOFSpiE9pOgB3f15fonk2OOk6HXuklAb?=
 =?us-ascii?Q?XgM+unA2C7EGOaivyGhtobtc/y0nnnE+9rOKjMpjNyKxg6HBIk+eqLVZLN2N?=
 =?us-ascii?Q?XBqH6QUn4VR2zuFHTIhyvSBtM+fBnWzfotZeqA36g2cKfpYOCsmQKi7jBQH4?=
 =?us-ascii?Q?SDjQK91utyskUYzRkqV/MrX+uN6KWkZoX4+QHTscZwQM4cSYzJPG6qvTOERs?=
 =?us-ascii?Q?0LjssfrP4ilcTsmV0+v6nErzrhaEDUFzPLs6pNmwdM6BN+iHO1W2upuUaR8a?=
 =?us-ascii?Q?5JSh+CvTazZ6q+JblApVO51Nsi1fkCvIRjOSlccfWzRXzPGubAPlHZR88Gae?=
 =?us-ascii?Q?ixl4v499/hsdS1YFijtGD8ZoaIWkViLcjtstWy/XodpRvvqWnIfMjrA4fh9D?=
 =?us-ascii?Q?MinviibOf3ABuLXmZ6UcLGgnOwnPv6wmvlUhbbXxUCIz05UI+uMWCtPUUA5y?=
 =?us-ascii?Q?zlplxfFSbeY09kjl79POdE6YEpQT1f2mJS8MLsjn923+/znYAds+13ZUXjt+?=
 =?us-ascii?Q?zfKHcAjMQp8zjSX5ts+XcyTvJ0zvwjONkgX2kr9B9OCbKTJV2tN7AW3utKaJ?=
 =?us-ascii?Q?YSHbKo6bpXDvttLhX3oyvj4kykq6A4hdg5Um5CCw/X9gdh2r7mr5DuRHGNjz?=
 =?us-ascii?Q?M90HBjwg/Z42IkcI24fHuvofPSabR6LFTFX2ZnmssUyq4XqFp45MdCa0zaT6?=
 =?us-ascii?Q?0eSj4gl4yPKS0P2qbvlFu16ZYJvPnDlWJGgGqrSZvXE8D6p7IoPPz3PodEqk?=
 =?us-ascii?Q?1Lt0DJU1o68dogBsHOzN8qAqrPTLp9gWADscJaMbI07tahn9HGBl1M1oJ6gz?=
 =?us-ascii?Q?7in4zuGnSagEIhtldWTAs6AMg2nTlZdvoc4Jed417WU7PAHEruBFFyJ2pbBw?=
 =?us-ascii?Q?QXyhCpmKLyqN5/wcF7JXLspt8J43Jd+aFh7qa5ko2Dact4kiRVTE/taGEFHW?=
 =?us-ascii?Q?mRR7AHQTwr9npG0fDtMBqpB9Z5x5FqvwVa136GFdt9JmICo3rwdExmC2B+2a?=
 =?us-ascii?Q?7MIXgpx7oFdxThB7Pz0CCk1oViT5sd1vUKo7SGHMKh1I623Ns/5fSm5G2ndv?=
 =?us-ascii?Q?NlG7an9fvbT3zKFI7mFCTCILqn34vypcp7D4mEzDL11MFqfcXDN8Qra5Hph7?=
 =?us-ascii?Q?0tRYxH2TqVNR+D3w/cAqwRjroqUguEbyQ/EAYVWC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8343f7c7-2199-4a9a-7d2e-08dc74f1f1dd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 15:16:07.5824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZQJDrDadjmtKKhhQ92u3f4WIy8b9tZAJernJQ0FJrpne/6xsaog/ArNJkZh4P1x+fUvo4yzHrsbUhWxyhJaDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5217
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

If the tests failed before the rebind, the device will be
left in the wedged mode state, blocking subsequent tests.

Do an extra rebind before exiting to ensure everything is clean.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_wedged.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index b9bd49fad..cff91077c 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -276,6 +276,10 @@ igt_main
 			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
 			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
 		}
+
+		/* Tests might have failed, force a rebind before exiting */
+		fd = rebind_xe(fd);
+
 		drm_close_driver(fd);
 	}
 }
-- 
2.44.0

