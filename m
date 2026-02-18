Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94778E9A03B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 12:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448D910E283;
	Wed, 18 Feb 2026 12:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmpZskpa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5899010E5B7
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 12:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771418043; x=1802954043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fHwoS3Un/Fp/pq1a+Us8ne6H6561YyhS8abMoTlYk3E=;
 b=MmpZskpae/3gGW9rxDWtsdPJ5yxteFXzR9bN+xJsjcdezusThmCINXOI
 g9y7h+IsYsvSL0ilJtlkfYRMaQpihEWNLxfE/aQv7625vQ/PNjoQ6ylaY
 V7KvhTUhVbym3K3SB5+xmYjypPn5bJebUIGDSz5aouBjqHqQEYkYY6GVq
 paweqhT3uFCLBsifJjhEzKweNBZzMXVSLv0ZBjBbTmAvZ114jFYrCWZul
 e9m8pR11TvY315MVhQ1Vcm26k82L6MmrpMq1oSzVKm2Kzml9ci7OrZUBC
 5CXIutunRFjph6hOk65QfXM4xP4Naiz7/U+QJNj/RgWJGXyBh5yr5j4PF A==;
X-CSE-ConnectionGUID: VgVlH+4IRhGihh3h6yKknw==
X-CSE-MsgGUID: 4PTSl5JiQOOiFshWTSWFzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="71512252"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="71512252"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 04:34:02 -0800
X-CSE-ConnectionGUID: DRlF3JwBSkCqb+aTef9eaQ==
X-CSE-MsgGUID: zYk1PoRVTEKP3/TSqIfp5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="213423506"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 04:34:02 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 04:34:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 04:34:01 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.18)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 04:34:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvu7+uU4bV8+eC7cemoVjrZRIEbTmzjVPDVUtqxby2GKq/shw9ZmFpU+9BRqJpQv2Dy5ElKpT5R4xlO86sSBKaqCA3SZrCHRtqAN9rxPJQATp/H2AZMv5R2Ud8LIlf+tzCRnmLY3OANPF8mm8bSk2r7cTWM/UIL+OcPYVl5kCEx5HoL0eC4MHzL6BrDt/0MjinxhrRdnd6m1g0rLwWCBlUVqjyQonBlWygm1IyvZ+qtkPv/SRSf40/K0cVZcaBoyKpGfQojGrw7FLHoFuWr9Qjw5rim4c+Xs8cnAMXsYaGIVwfzzZmf6ZdYb5bd3ElHfc4z6mG25rtYLaWBCSbWSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T98lSqCVzr9z9xjsSFD9iFPLrQnIho8Q0tgilXSPQUk=;
 b=kr7V1JxFNkyieJ5zRavsKLgiKYxa4nutZOfWQOYE2i1OdTth9Gpdwp86ced6A4hjWQfE2LM2Et5yJECj23lW935WFDqDrpDdOdzUAToUGz2jBI4gLVQljpokoz9EpXV+9vpq5n0wrmJhx9jPsBZWM+Sh3Rt4aYc174uJ/8QITx2e3HAGTHgDslHJhhO3UZibF/VE0T3rjdEJomi+ulpLnXIRyOSOGeBz++fJBeHoa8x7A1pLtmc0SURNd2sTEfpjkWIdUjb8opcJI44RdqZ1F4me97KKHHhU7n+8vKhSBAerxPYLU3CSqNFs3ACxPAGZxkN3iMxCcf5wCgLPwb0q5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CY5PR11MB6187.namprd11.prod.outlook.com (2603:10b6:930:25::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 12:33:58 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 12:33:58 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>, "Sebastian
 Brzezinka" <sebastian.brzezinka@intel.com>
Subject: [PATCH v2 i-g-t 4/4] tools/lsgpu: drop cairo and switch to igt_core
Date: Wed, 18 Feb 2026 13:33:59 +0100
Message-ID: <26ab797d567aba0c1917a19e850efbf0dcc4986d.1771248283.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1771248283.git.sebastian.brzezinka@intel.com>
References: <cover.1771248283.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CY5PR11MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0ce1a6-c018-4be1-da45-08de6ee9fcda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VmWHzpiz/KtvIB9pmOcIosSiM6tFBIfAt4192juG1ukWlYi9cD8wLpriMwkW?=
 =?us-ascii?Q?rMRFHuzFMREsd8FZStYxKOFl0z4/+XWZd5iJ40q4SQNU4fubsVC/3bifhrj8?=
 =?us-ascii?Q?MkhqvZi7TWouuMpAfJQEzXk0mNsHUChZpdOLe5R4J5bneLMHOgtRbXUCdyn4?=
 =?us-ascii?Q?eeySbNB+Gqt64lfQotynYnAqsTHZjW7dQ4/FSQxOdcibLEVKLp2cTzJ+AUA+?=
 =?us-ascii?Q?Ri5YOy1mE5zyKBq9vGfhbGQUpcPo/SaZV/nDDHJdTPUvU+/wd8bJ9H/8o/dx?=
 =?us-ascii?Q?qU+SF0dthzMprQvw6z0XFCKvcGIilDEV8GMKauTa5UufWN3VADv05zvunYC2?=
 =?us-ascii?Q?Z0ff8wg3cPQyksucaoLIEUt+VNq7f1czQLklGOOaU9pXNMKov3O3Hm3jbJLZ?=
 =?us-ascii?Q?4j4DpdyJv/z+QtT2vKECLx5PR1pRAzh39LIZQzsMHIQiMVBMWWEEwyW8mNvM?=
 =?us-ascii?Q?Y3fdQ9rDbXOZF2L10YjnabEDNeUAFDlo1H68h4YEfwlj17c3wBz+nNfil1Ee?=
 =?us-ascii?Q?deKdBwn31hmMtHJnSaaKVYKyrw+ewq3K/OeEmkHqttjqopFKET6/bvCI2udx?=
 =?us-ascii?Q?SmP9ZOwVd71jYA8VDiRxhDrnLl57S/38dWMew0AHaM++J+QGpXPbqqBd5QvK?=
 =?us-ascii?Q?Wf4NwYnuYVzp/Xi1INzmqxpDKtkE3prqJ3SxwzrkgVp1N6JHUFEjQX1ycCpm?=
 =?us-ascii?Q?l5xVLyK8ApPiD3ugZLZA9ffark2xxY+hkGwiH2SHMxq268v949GtOWfNPD6M?=
 =?us-ascii?Q?Fv+Gk6+5pfGrQsq6obO0RdeUZU3+IR3QvG8SqZjjK5/vrxGbzRAbjnvMV3L1?=
 =?us-ascii?Q?RgPRTKfZRVnwiwXOeljhC0JF2ZzMS4zANGtTmdGyrN75/xwoFYwwWF230uZW?=
 =?us-ascii?Q?HqoOuikHhZkVPaVxH7EgMtgXh+HlUCoFIKgCS5qWSf3rIyDhHsU5HNXddBTR?=
 =?us-ascii?Q?sS3M6j8ecGFgNO24YRbsJFbBJ2pG54loBNiHdqxGRNrW8stYXIXYld6dtbBC?=
 =?us-ascii?Q?XuqCyGRkiCMOmsSn+0Bx89fd/YD+EMHaNkNonzmPzkvrp/8DmO0zT1ThTBuK?=
 =?us-ascii?Q?i4C8PdHusaxO7FTMXphhqviewF5i7LzpaXpszIp+HyShqhGTIShHlLN/hQck?=
 =?us-ascii?Q?ymz6r9A+FpA7o0eRlkolCVqnqu/lxk2mwkPT4acohIL3NrsgrwdS/KTwFZXt?=
 =?us-ascii?Q?WOyXTF2gLwj0JL1mGSA8QLV5wZ/5NEfLULRwI/OFbbq0wtHPBYUJIDPkwian?=
 =?us-ascii?Q?vqxsrtk3C8rn/ok8Z3038OJ4aSF4SRbshxqmeHmFbbqsp9h/HVjRXnqaMvTB?=
 =?us-ascii?Q?ftuY9TKkY6+AmPeVAX6RZYeKxvdk2FEQ0HZEj87dRPt5/BmE646F8YMlZsVi?=
 =?us-ascii?Q?UAQ/LBOOxR1+1gyp0PHIdiz7SyouxFoSAqpkzVb4YCU9i7nZb4dEhqYaHgRU?=
 =?us-ascii?Q?Rif5M3sKOQWxO/nsMy/8Kj2rynRCjsm6WEhJld2NA3PIJc0YFeEvHcwZWN+1?=
 =?us-ascii?Q?PYeVIcb7UTQbqeHmKOHsJ4u30HTP/G273EQ95J8sEdqP1FlX9q6pVDvpFd1X?=
 =?us-ascii?Q?lIh/yFOT65A4C6oD60E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z36tQwUSDOLIBYRQ9BjZ5C40CJsCsdbVEbOGIgug+Rqgqj1QBFwGdJBj8H1h?=
 =?us-ascii?Q?SakvJ21FE09PnkOzIaIko+q6Ha6SYiro9H84Qsjdt1WhjKf9h97Fdv+aVpfW?=
 =?us-ascii?Q?OMxFeGqMHq/uY2HgG+HI/f7msYK0lISxxZyQ5Vf8s8Q/Iio3uoH+AYirN9TH?=
 =?us-ascii?Q?TRz9Bk/Iq8UhNQrcXkYgI2AYxsHKOlMTCcsL4ASgWcs18uOKsPAim4tLUGto?=
 =?us-ascii?Q?xgtMEoxqm85+Vl595dLfJX6c0U/rb678O5ET7iZA3v5+1DXGt5gpoFRPJZXp?=
 =?us-ascii?Q?f9TcoyvNyu1X4J8FqnaYZQA/ua46xUx82X+wXLfZXNJL7HXuBIp14ksdAFDi?=
 =?us-ascii?Q?zdwFG7wSb1MQAZGnhazYVSoR/EIJ2iaA84K4w+SYuhccKMFDXRtxjnbN/dnG?=
 =?us-ascii?Q?F/bFhXi2uXUUdNO5FwJTn2kZAHL4QSm6RfpkHZjGxJKc36Su9mCHYwMwB0NV?=
 =?us-ascii?Q?UWR8tRLayJm9oVIKLpH+yadZG2dAR7G3uQ7OSDZXCx0j6LFS1dQByFHBRouZ?=
 =?us-ascii?Q?O79wfEBz1ccmUAeZkYGhugfhh7bVQEQrMsF3/EHrDsXVkmLNE69Kqer4rnJE?=
 =?us-ascii?Q?QdauSf9mi3IfxEh1xvhf1Q1V+G0oxwa7axJDKaglCuAx9OobEPonvA1ua34p?=
 =?us-ascii?Q?XvMs115cEjtbjnOq0V6Vjd1/Fg5b1WQF8H+IAnSTOwsWfmcO73+NYap8YU5k?=
 =?us-ascii?Q?rwIebbvcMdsnnLKZ6eIVzDSGj33kLuvSnTKPEN+EZFZ08S6qt9nhwoe8LLFD?=
 =?us-ascii?Q?+S6y6djReIwYmBEQk+Zh3CWkNXE4SA7jC9cKg+nhvFC5t4Ag16LUhzlQ/a0d?=
 =?us-ascii?Q?M//PhoeMbAX+e+u5xKFjBwugCyxM7rMrIuCinaSaaq+6RcugYEvQ1og+ZJtR?=
 =?us-ascii?Q?oRyJGnWKQUW+nF31v86wfQaTF6SKcu6xGuk6vc8ChWE/i82d3k2W/vP+9GuO?=
 =?us-ascii?Q?oMXDv+w1POXLcmMzJ1Fu+OByq1pBS4PHtF9qraBhbO+2YRChZ9Ar34v5deHZ?=
 =?us-ascii?Q?fL2jS96qvpmGdH0iah1HvwRaYRa+TnVQkaERysURHnrX9Rx7TpxYFMNKKZCw?=
 =?us-ascii?Q?YWKAl+WlGO3xVtOS5IlkLIYv1Qb0seCLyVPEZqxgORyv2+FM6ILzxsQt70VA?=
 =?us-ascii?Q?AySCrDcebhH44pKD+dYKpMJPVI6fmsGeB2Z0HhYSsK0Hi8XqISQDHQM1jGwj?=
 =?us-ascii?Q?vc5G5ao541AmTLVKKjSQeeL5wkGveCugUkVW/6chidali+JqDEC3oqYgE268?=
 =?us-ascii?Q?PW/zO2/ihUwAp7sIV36hDfKozpqGNBYIbQJJ79A5AKAldn8DSiUDjPh/bIsX?=
 =?us-ascii?Q?oOgNwjTUbe+KUmR9MuF3HNxzArRkKFHXK/ngu5Wd/J0l19s6t0R1KeYYYuI6?=
 =?us-ascii?Q?wiOvdxwTIL1D9k6etYHFyhNfpA77aQwo8FYTH0kLjLZ4ZqtRCf1OnVzCAHJZ?=
 =?us-ascii?Q?MLVJGB+QTbcy9fLtpHhgdgxw4j6BTR37PLxY5Rw7PIqwg6zERrD4v+AztVyj?=
 =?us-ascii?Q?Bq2vIb+mlkwWNY79mtAO7cdl+f0/TB7fLNz+vVcavWeJh1d5hwpO0hGknaEX?=
 =?us-ascii?Q?99DhlxAfWkHWBFhb30apQv0JVFk1tyTmhA2WCqTGMUHci2RTqNx2GM6nX7WZ?=
 =?us-ascii?Q?G0BmG282ls+rR+i7TspMJUKXR5EhMfLX2Fr4Xbq2GOrBNV5mkJr7Ki2J95FX?=
 =?us-ascii?Q?19wPr/eVDf2NEDw6AiERI1JiPAh7AztMdjemLm5XbTF3Y60ouGxNUvk3SM0w?=
 =?us-ascii?Q?LxdVMW0/N1seHyQhQ6YUQM5q/lB/dvw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0ce1a6-c018-4be1-da45-08de6ee9fcda
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 12:33:58.5166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IarzUdBBaEm/Rd982/oIjkK6vftXZD1/+xjETCGV5IBynVhzY04X2SxQjK4cMw8dm3UBbTGO7HtHFO9+h/ydOENmoCbi+S9ZZqOgJ57RbZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6187
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

Replace the full igt.h include with igt_core.h and link lsgpu against
lib_core_igt.

This removes the cairo dependency and limits lsgpu to the minimal core
IGT functionality required for device enumeration.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/lsgpu.c     | 3 +--
 tools/meson.build | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 935371dea..057a594ea 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -33,8 +33,7 @@
 #include <string.h>
 #include <signal.h>
 #include <sys/ioctl.h>
-
-#include "igt.h"
+#include "igt_core.h"
 #include "igt_device_scan.h"
 
 /**
diff --git a/tools/meson.build b/tools/meson.build
index 0fc2427f9..b7387ee8c 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -57,7 +57,7 @@ tools_progs = {
 	'intel_tiling_detect': [tool_deps, cairo],
 	'intel_vbt_decode': [tool_deps],
 	'intel_watermark': [tool_deps],
-	'lsgpu': [tool_deps, libudev, glib, cairo],
+	'lsgpu': [lib_core_igt, libudev, glib],
 }
 
 foreach prog, deps : tools_progs
-- 
2.52.0

