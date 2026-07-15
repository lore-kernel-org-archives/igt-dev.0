Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE623C44507
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E01A10F02F;
	Wed, 15 Jul 2026 12:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgRqLm21";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F95410F021
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117726; x=1815653726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mdkAdafUDMT6Ws3vH0shhdnfxlwu7EkbRD9go0DaFUQ=;
 b=VgRqLm21ardiAUrSSCMHaZod02SBBZF2/6UixQr71PpcIJ7orItvekCt
 OPV5btZIsXk9958cjFZwINiTs/ozCde3JKKjd5tLEtASHA/+RYkwCL7nU
 NiO+7b1DkQqGSdHHwEitUuc11VmHjQXaWWMIHZ4VsHhRzxrRjioK3f592
 uzbJQi7CyUdLgexaV+7kRhQuIhgA9ZRCAzgiZqaGN1/SKubPQZBqTWtDD
 sBqInagmRWiNS18rA5rO6F+d/UPrTgZHmBLOCte6dpTPGAgGTR7R9JwCu
 7a3NEMtm2e9FWuKsUXPNz3a2cZIdhdigLjGUWF0M2QNolh8OBFMSmSlE9 A==;
X-CSE-ConnectionGUID: 8b6gx3d3Sei1Nh9ZEPfdPA==
X-CSE-MsgGUID: xJbPKor6QDyggrUx5ltw2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102175897"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="102175897"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:26 -0700
X-CSE-ConnectionGUID: IanxeVRZSS6fSeD8xsDc+g==
X-CSE-MsgGUID: AJwVu0vnTLu3Bw1pxLVuqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="259985086"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:15:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:15:26 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:15:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqAaiPGaxqtPwbdZr2ApxJxC53GsaNLy5iFsvYmrkJnJv/LdIQElsBisAH3oL1OhDSBF3VdRsZ1FAoh5nr9XtyPAuAakX5JhURYU2z0NMX7FvUR/N6kVPusja6CLGKvORUXfCrUnLnOL/dRzUQgcPSSdG1hn+3S9+ib2ubhLU7hKzOpqSzWJAZACqoEA0c/V0h3KmSNONw+bIxGcVvALFXMU6epQbMSax27kVhFTtpPXx8fZWEvrXwHVDh5V77TersrJZ5G4fts46TlPM+KMlbYe/zpi76ilLiRr1Bdh4knUOoBBXm5p6ZNjFxwXCz+owfKGQUI9d/hFY6t+xmyOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPgQtPKEgN9LbsFd3juVBUDmbtxODeCFPi4wkmiEcj4=;
 b=yxb3ysyU5xriQVVKbQVZ28wdzwVIDhWgxUzu7E/KEnD/849nIwoO90tT2gL7OnkL2y7oqww92e18atxSWil7CWBZVMT0gq106GHP81BS2e42GcnFD+oM5JeYMAbBrdMRiaPFIIZzcqSegZGuEATC0OL2tEC4XLwCbisV/LLIfo0C3eEG/o0egH6ob1gt28R2SG0Gwa0uRpyyqxlffLrWvJLXo96D99CXuE3VyZSdtCZfTP9GsqJAVz1MkcMylVj5iyx3dNBZt14UDVFeilLwXkCFMUQ+KzraW7geVdbo/FsqfhWiRZ0fY8Ih4RU7lZCgoYxSlQoG0vKkIHz5xnqNaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 12:15:23 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:15:23 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 11/31] lib/i915/intel_decode: introduce static
 sub-library for tools
Date: Wed, 15 Jul 2026 14:15:21 +0200
Message-ID: <25e1c4c9e4e0dad4bef985cb29556115f7f60bfb.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1ff7077b-0f7d-4d94-8291-08dee26abb7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|22082099003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: x3PYQtfJi1qqwhME8+ItGhVlaahPbjy5nH7+yYDBZomobQybo9z1zNrwW02eS0QWQd4IgGRVHE/oUE1cCz4O2R0pjJdNQLfDBg0MClqxr02bKj7CFXsad1Mhv8hzvxuH9lGZDcGS1kOWiIYoLNnLudGNKBtKAXyWuxHxQSdCS/ajh3AbGY4OCwYEd153yLCJA2smgvqW7cjRg7e/FaF2FDfyIjjLNwqcKlkG2q3+xZ4ZMQJr65DGglPNQYAiDXaScdqz8MfJeC5CdNKWOhvHZiP5JetPsf2n2F/RG/+Nnoy94LXFLur53g/LHFHFyetxE+mCQFa268zExPZHQ/vGZSmZWnvvlcs4WH5fLpZbbnjuts+ZlWEbbqkIDjCQCPJ08lhJmhWakqPimwsJ1491eIVjgUGhU3Yf0SdH5nMSO4f2iC8y2z1CYokCwDD0vUg9uSX3CgqgnvaGLbdP/lJwbn4qfNd++dIc8GuI2arbiFLplJBHtvqKEmdOnYuzG+BYi58YwrPyjFtSEQtdoBdaHstnNq9tyw4xy3z8V0fcADCEeS1Z6+Ac1/i8/yGec0FKWQ+a9JiH7AXpmkqQCw9a9JVKLD9CzttaRyqnU/S7o59RTMmaE2jupD8hYjeWk8ocdThp62lEGPslFGi/D+70uXNSHwOcqDIrOMP2reahZ3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DlUmvxBW+7yU4cZMIWDB28MNsbsNZ9AGHw5Xa+glU0SO2jufwA2wvzSGeoJ8?=
 =?us-ascii?Q?XMP/slkpJVos0D/taLtklTvIL/RJNEGrQPqeHfydUsG83D76m8ZebVhYpSPb?=
 =?us-ascii?Q?djcinFpvBvahZJJos34ZdJuYkQtOf9IfMaDp6+Oj9xjqPX547aDQMYK3WlyM?=
 =?us-ascii?Q?Roz8sa2ODCf7clGnAag0KlBWDSN5O1QxQ8mL6rjWudvaPbEkx/VQZamgwUbd?=
 =?us-ascii?Q?hTNQhr82K9hBrU7VXRj/cuLFyPmDzEPN57tN0R50lz6TwrUX//wPk9jwsDhU?=
 =?us-ascii?Q?bi67ZAHEGOiNwEou3nb7aUBeJj8Z/PuBNhTQHIboxg4VFFc7dJHy4o12YzH5?=
 =?us-ascii?Q?hCD0Yo73HqZRYUFu6+3sruM+yP3kPSGODhRug08+OPYLbcrgY2PrWes2s3vg?=
 =?us-ascii?Q?42+mlUBePhtkP7CBRrSpwcHxcaXAkr5g/QK/OfvTFEesRj4662hQ3PN9IK46?=
 =?us-ascii?Q?WVLKKmQHUHoNyLIo2GyvcnSmn4vNFyvUz2DjpOY025ngKNdZyA6BKp/HF9Ry?=
 =?us-ascii?Q?mYbxL+DWolb2awEAoZKRl3jQWmjQxfUqQAKww7MWXzzX0sV//pHxYPSRuM4x?=
 =?us-ascii?Q?gRv+ByDKSXIF3JTfZsTc8imihpqYIs5TexfnT+7Nib64hgnS6r8oZewEZX2v?=
 =?us-ascii?Q?+2DhLdgPoXjMIacG6YwZrRibEK5drDVPhC0bFOWzgRfz3iqOZHUS8IUjiLcc?=
 =?us-ascii?Q?bi7wzOIgjivyMIcOLXNgMRrAiTzHuTyel7Z6Kh8vc+HOf9/pgeDMabwlkOyE?=
 =?us-ascii?Q?Umxc/Jvyv+hj6jzNscEzs7qKxYEWu+DuEAfpIBibB34uxzJ5D0mVuOt2yILp?=
 =?us-ascii?Q?qJYp2jpjyM6OxhOS5V555BubmJbR1Nnlu7YVLZJzecijdm6TEw3VNkjLGYJX?=
 =?us-ascii?Q?Ux/4HxIMSQr7lCdRsk/X8s9hqJXeCAryrxyNswV8S1Q2R/Bvh9fOdq/ve2Zo?=
 =?us-ascii?Q?qEXGNDbOI7T6BYkCN72jBzroXxCp+3J6Q4IDZhdFTsOQjbAyMXoUDOhLIZju?=
 =?us-ascii?Q?aYif6vLe9UPFI6wARl6cmm0iGhCu/1PEcKvexfq34zH5KxQezOATrYEVSHcn?=
 =?us-ascii?Q?VvFqfYx8I9FO5IqJaz6zPZ/X2TqGt+owa5u3ontcQVOFyg9yB98Z+7Q5CX/D?=
 =?us-ascii?Q?Vuzf9jbaxp//c5EUoUyYUpNvZicMUf7pQNfDb+J5pGK7d4pNxtuek16w5GeC?=
 =?us-ascii?Q?Drff/Wcopmv50U9dZ03UgjkgaZA/BQqTehEcsPuA9O5E/EcN+/vloaOEMUHb?=
 =?us-ascii?Q?P19s3AtZMUvHg69FZyysSnaGiMmuja5/oq/PJed9I5PG3P7AWgKk7TseLG9i?=
 =?us-ascii?Q?xBnPsIlrHMXxrLNtLTew+n9znKPFVPfYcnBbtqXrRLNlYEtnod6YGZt+cvfE?=
 =?us-ascii?Q?0OamA6i0RJ2UmSf2aKR3tBVpCjwYvuAxSMXnbahT2WOY8/AQnHn3WKxGIxX+?=
 =?us-ascii?Q?q0tg1ST8jp9zuHk7z2+ys5Kns9/WWmjDsrxJSJPtpleVrLnEvuUeHZsGABJR?=
 =?us-ascii?Q?APsB3Wq+unMRSxnD7EvsamQ5xbAJDP1f3tQDcgOSQ9g4+bTSRdu7KQdfdeUW?=
 =?us-ascii?Q?wPPDTYgW76BlJT59xkUtBiwbKsRVNGwfreTzEEVNNjRznLDH2XthphdLR6vx?=
 =?us-ascii?Q?hmrxEF6qbG/vIWnj1cSWfqcviF7SHeMu/JtpTIeBH+laBBqSRnWptmlAQfoQ?=
 =?us-ascii?Q?u9mKuREC67o7BAdSWfL+Rhf0bq7ryGqbiTTvqxz6B1USo1HvL2zwMnqy89jL?=
 =?us-ascii?Q?zhFQO0GXVIQOhDglkVE9MUvhEWe2GbI=3D?=
X-Exchange-RoutingPolicyChecked: AU73rLZFshV/bplW/5AX65c6e++CSQFhybAEUMUUNlAvA4JJBEUrmnqXLzcIrh9VWVyvLetXIedAGWFPwEv1WZAVpDBN1S5hYlJGYjAFXX5DQiXoI/DJsrdg3kek7bZ4rLhSeQte36ti504XXvQb7A0q+3yhTLQuJNWd/WlWR1JiQDI0B/oiUn+zYP+RTruBNpXELnqdIGlFthzT+57LT9Qv2E3tyILUu9wLCFMohKGN7X9ugbRitcp9s6cvF7J1yyuJUX2KtlLu+cFctBSGlNb1Eg10rV/fQ2jfz1Cbm76Q4853uX3af4lBW04f5Px1CRPvE9963809/PBc2RnxHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff7077b-0f7d-4d94-8291-08dee26abb7c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:15:17.5895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7Zf3pnfzqf33kCKHk5i0VtQVY4Tt3SHkASY0nKR5hwlOwvA8bAHs401jptg6ehuFzrkRa4HXSTHttUsOalAhQ3c06rpDgjF7OCTqrE4qlM=
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

Add lib_i915_decode built from i915/intel_decode.c and instdone.c.
This lets tools like intel_error_decode link only the decode logic
without pulling in the full libigt.so.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 lib/meson.build | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index 93db217f8..8addc8982 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -423,6 +423,20 @@ lib_igt_halffloat = declare_dependency(link_with : lib_igt_halffloat_build,
 				       dependencies : [math],
 				       include_directories : inc)
 
+lib_i915_decode_build = static_library('i915_decode',
+	['i915/intel_decode.c',
+	 'instdone.c',
+	],
+	dependencies : [lib_igt_chipset],
+	include_directories : inc)
+
+lib_i915_decode = declare_dependency(link_with : lib_i915_decode_build,
+				     dependencies : [lib_igt_chipset,
+				                     lib_igt_tools_stub,
+				                     lib_igt_drm_stub,
+				                     pciaccess],
+				     include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.53.0

