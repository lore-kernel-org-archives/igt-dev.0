Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFCCCD5BD5
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 06:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB10B10EC69;
	Thu, 28 May 2026 06:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkamZMkU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE69410EC61
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 06:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779948009; x=1811484009;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Kyv3U479GQwqkn3u5PLs0PvDcFXpd983u1XsjNkQ4GI=;
 b=mkamZMkUQZ6wWIW59Y829XQeCJ5xafUQ87GGo/vq1bi6wuE9svACV02K
 xfJrFnSzz2RmUfQJpm2FCDTLnEDVh35vMfCOhnEneZuw/DZTOHwNtawz8
 gmyqMJujoWh+mIgCsPLUXr/2Zhiz4Rz1ebVolyqUN38UxbyGCuo0EWQ7u
 5ycvcevLcMPKZcpquw6wHiGH3tirSyy1s6/baXhfrfJzQo6WddZJbmdzc
 JxhKq4ASCMRlEXfPcc7S7P1GfKQRdxFB/aD8yNP7atsOTXe1O+9NQQE+M
 WiyHXeuesagCziKFz3leJoUXz5r6hURz9QOzDe4ntdTXqKp4aFnYI9YCH Q==;
X-CSE-ConnectionGUID: t/536cKXTaKaH/AaY2bfIw==
X-CSE-MsgGUID: W2YUAM0iTlabeAK1aXCCXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84644616"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="84644616"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 23:00:09 -0700
X-CSE-ConnectionGUID: pgREFaZuTpKCszV+SUKkJw==
X-CSE-MsgGUID: roDXEEg7Q86/t511eeIzPg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 23:00:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 23:00:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 23:00:08 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 23:00:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTYcYCBPZ/TNY3++CMbRkQ+959zjDrH9T83389ImgSf0nvZFyNIC7TRN79vggorDAABJdvZf3ZX2x5W7c6HJ5qFxOAXTDgzFFEeDgTcXceqpHSjuf0YiFWii0/bDbpPkeN/3ELGjrbc2KdShdBlo9tVxBDckHhsSYFJioBiD1UvlNiyUAadhNlC3uSghFm9xQznSJL+2lyMViS9oko7QUnhg6x9vKfSp5Ph1zPkh3sxRACVS8kvpqx4H385FIf9sO9PJT8taWA2ZnVYlDP+4Owemr092DEDzhAMXbW2CX4ZQZTUnlhJlyTr7tFXvSWWPjUSWjKNWB7iqC7ySNKJaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+wVHspf/CTt4QtzfIVt6wLt+JniX/muqTPhf8cYqRk=;
 b=rrkoUmyX/0suxi2g+QtKK3sgMbOTkXuz9YbY3P0IUJYiRRIgS17vYOIcY5vWu5GU989gsqtUSLCVJO4uhY7KGJhhvRUJBlDapxgKlfSW3VwVTm7rfB6H1d6upqSjP3wcaLqAQ/nHkinLn48YEZz7u67ZRBiLarkZYnN/Of9QPtqrZ+8jXC6NQ5b7slwc8aA2+tOl3THKK7Ec09tEefhIGA1nxASrNZqmWjbG8zWPKGE58ij47ueAXehNW3zk5uvR6Jd1BBu7Ymkch8y3PzQh9kzgsNdXVZ6AzfyDkcdQwAr38HDj/es1tWQBLL5+iiuEjdZSz6hc2kCliW7ocJ0YQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SA3PR11MB7653.namprd11.prod.outlook.com (2603:10b6:806:306::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Thu, 28 May
 2026 06:00:05 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 06:00:05 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t] tests/intel: Add current IGT PID to driver options
Date: Thu, 28 May 2026 05:59:57 +0000
Message-ID: <20260528055957.2876648-1-krzysztof.karas@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::30) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SA3PR11MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: a26968cd-a9e5-4939-a5f3-08debc7e5cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099006|11063799006; 
X-Microsoft-Antispam-Message-Info: geGtquFlHJyCmP//g4V8aL7ERd7HRmojnmlfiEAw8Nh7FQ4IUcyeYnthAMX/+Kgo5FWtaDTiEUdSk+ZkqN41B+IRgxHucGfQ2hKBBRRyXal3VZD4fFwbKuKcmVwRr+T8+gj9GPdrIIXsGMXsz8eOPbadHxEUJ0MpCvvWQVwLExXgW2R3r+fIsSEN7ryCaeiKBnEq6AXcodu8vLWycw8da03T+XQ8HAn0enM0Ela3z1XSUJccE7uG0a34hLexqksoP+RelK8is8QF6RQNRKZEoS5cUreZYvgDYCJYVerNmlEM7Tx+CE9enh1zWVR4LmzlMW2stZq+k8RGjEWJGTJJQbOb/X3ZWu/Dn5dTuXwlW9Gv0/xtukZ8RMpSqoW/HD3sfe3qIPU+k6GpO4W8ZGlgP9bkj+J/Q/bY5b/fD96P+8rx41ZGESN3ZfdkZnnpKOWviYEcl+S7M93SI6BeL6bDUrMu+OD2a1iZNmbGtW8uuBRIZKI8o3dWuasi1IDMkeEz4RVwwWKFDGZ6P2LcM7KBNcSe89pDgryJBTu64a0scs6hyyspGmx/j35VjMDsaRqG3qs5jTTih7Q8e0ANMOltYJI50b414RIx11NvFvAy8WsjNdjpOLYvVuB6Rptj7UBmWLPeuX7R8dx2BCNAC0FdLL3o4C+RnMb8P3d0Ws8WtLI7V+eQaHFyky8EKhV8slG0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BBCRYPSdUNtopG1+255NFpUamFMbp0FmJS+G0OxHMX05n+lLNnm+/T4mbq/k?=
 =?us-ascii?Q?/TEk15pTAKc5g/emx6L7QegPLUC6qiGff0vdNQMEI1Y5i4lTwyEa+n4KIVfF?=
 =?us-ascii?Q?Dyj8cCsskgz71fD7ceCLnJt8K2WlSdQDgDZi1oDRcof0fPKP5XwXKSn58QRe?=
 =?us-ascii?Q?rI0ql94xf6XijW4Z60XKb73bcmvKsiibBQi6xwMO+tqMlJLcvbYtjxKWod3c?=
 =?us-ascii?Q?WZcxoA4CqgeRE4U3RQs+3I1BBv3NTCg/aPeN/CzDE6Gr97mIo2qm44tptGLn?=
 =?us-ascii?Q?RLE+r2mqo12jvf2wfX9d62vKqTj4a8Ms8FpbBikX2gqzf85/8z3iUWcVmVLk?=
 =?us-ascii?Q?NwjBlSnE52S4uWvJkGNtwpokFlWFyCKVKobv1XWmXsSR7masdmH/GxQ17E/e?=
 =?us-ascii?Q?Z6EufO1LpJb/bU0hGzQz8lrJI5CYMQ+OgzOLO/Lu0fUxzXTm8OgO4/9Dkb2v?=
 =?us-ascii?Q?CaNY5m9VZBAk/RFPz/MZylFO6aPFXyPCJEQ/dusnAHAWC6C77zhVGM7rumLk?=
 =?us-ascii?Q?T60hLSiSjmTLkPA6O9faYNfCBIW5p3koxrXupMxKHrdiQr0Ol6GDzXaMcc2S?=
 =?us-ascii?Q?9WgMRpnqCgzUu9quqO17AxxGytTXryQ469GjphUOmh9PMiJpWONVlyGKHigD?=
 =?us-ascii?Q?qCBLfhR4ryYfX+mEn9lOwKuckmIfhojFNWys0w19PkoJT2ryB3lOzvu8klRc?=
 =?us-ascii?Q?KvpQBr/fHY8PfLFOHL80eJ53H9tZK1xLbIsqr/E15dWfyTymj+Q8xyru/RjW?=
 =?us-ascii?Q?PiftDvsD/mWmNkrUW5ODjISyC06KVm99H70mNq/EklmG2n2l742cBblJkfSW?=
 =?us-ascii?Q?g+SqNFET9p4cwJANMyCgN0hh+/xEmtCF/HHma8ynsLEq9hu/w2aHoT6R4aoR?=
 =?us-ascii?Q?4KZoSkU42pVBTu4o1G6PiCsRpsD0603Pt8IN5OtCqE2+Mz7G/oTbc0QfFD+1?=
 =?us-ascii?Q?1vxIJMwz8q2vzgIMaDzQVkcgHG8VEhJylZl4vUZ7odlQV9WKTtK5jZ9mSAoU?=
 =?us-ascii?Q?Z1sMtYHqM8/kDYNatJL9kc2oqu3TlkCWeb2HAQrCvLgW3s4HWHNqIr2Bi7q0?=
 =?us-ascii?Q?68w+msZlOXrRuL4yS8ezWP95lg3WqeMTg8xXWsXo1qtVygBToHIxfHFXxf4U?=
 =?us-ascii?Q?ENL6MJfepIPKbcpJcLmoQ8f+VootLgWb2T8Xy42A/89DDAXg5vEULVo8wMDC?=
 =?us-ascii?Q?/+mBdIXWRSif5W/o8CiNtMufkKA6naJv+U9wdq27wq1DAMPYqbeiijXiazfQ?=
 =?us-ascii?Q?p9VRvmCJVApxRfkAnSQ6vy24MVd/mG21rOuDGv+jWaYRCRbBI0KN8gcQBiTS?=
 =?us-ascii?Q?AkpGWx4Ir9rALpQFa0yM/AsNM+l3Mv3ML0hPH+0jrvL1fk+ZCVorqDaK53io?=
 =?us-ascii?Q?FHi7pS1AKLEGQQ0g1cmTcTee2wIjaN2GA73iBS57LVmQwMwmMTwNtvLfLZ0L?=
 =?us-ascii?Q?R/8blNG5TgxxpSHmtdc2kyqUMoPML4/96pcrYtCgsFQg16FYz0LQaoMlSWXQ?=
 =?us-ascii?Q?soQGZeVyz6jof7HxlqUrJDCRN1sfzwqQIHwmkYHYwoGf7vzaD8wd96PcZBE5?=
 =?us-ascii?Q?pGVQQhiBa532Ja4o2ENhSyl5lAtH2yfq7k7K4YY5ZNz33Azi9g0dzDv88UXh?=
 =?us-ascii?Q?9+on/je1OA6cEXdzTdmf+A1gGpQn93GF4QTaBA+svvca9DQkd6h/MuefZPJ+?=
 =?us-ascii?Q?gzourCz0PzxIqyQ2dCVlZ+OdirQLJIlg9XF7VXGALPGOYYHUAJiM8frCAUK5?=
 =?us-ascii?Q?87flzVbaAOFAArdxjqCR+9H4j3g6QBk=3D?=
X-Exchange-RoutingPolicyChecked: qCxGGaIYWka6/OBzynSNWosclmr4Qn9ms2JoVV8ojfDrYHjy9Mvx52E+pWnXG3fx2qSqcEsiu33F0gKveswwQkOImMmCSWcRsoaG8yirZCDng5N5IhTOzXhqc6tbyT5GarXQ+V0vWcIfTsY739ul4enejn8q6SQWYyX/PvS5Jh2vHkEdPdk9M9BMVBFTPEdiuBmcCtt/Cm+Ls0A+TWJGLfVCoIt4ZtieEa03Uzx0PkfP7TUvvWHNCBgQkF5CgMkk1iB9KJ0el+RYDWjNQNMN7O1AcqtOv1PADl2MijqLjGsy+fHp4iEXa9YNu7xZtvyN5KAdgFZKkYQ26qIC9fTWew==
X-MS-Exchange-CrossTenant-Network-Message-Id: a26968cd-a9e5-4939-a5f3-08debc7e5cf2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 06:00:05.1007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPolKm94WEGutoYpEgAg7s8ZH4w+CbuxzbpiVYD4aPBxGumUaCjnAlDGwLovjcugcJ62GzK6LcgyvK3UHZnq2REtai+rCd/h0VuBSPeGOvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7653
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

i915 mmap selftests lack trusted address space in userspace,
so use a driver parameter to pass IGT process's PID to borrow
memory from for mapping. This will help to restore test
coverage, which was temporarily limited when following series
on kernel side was merged:
e8c3344765aa ("drm/i915/selftests: Prevent userspace mapping invalidation")
82eb94b1fa13 ("drm/i915/selftests: Run vma tests only if current->mm is present")

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tests/intel/i915_selftest.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 6972de64c..1a8385883 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -649,8 +649,8 @@ int igt_main()
 	igt_kselftests("i915", opts, NULL, "mock", NULL);
 
 	igt_assert(snprintf(opts, sizeof(opts),
-			    "live_selftests=-1 disable_display=1 st_filter=%s",
-			    env) < sizeof(opts));
+			    "live_selftests=-1 disable_display=1 st_filter=%s st_userspace_pid=%d",
+			    env, getpid()) < sizeof(opts));
 	igt_kselftests("i915", opts, "live_selftests", "live", NULL);
 
 	igt_assert(snprintf(opts, sizeof(opts),
-- 
2.34.1

