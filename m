Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0B4CD6E56
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 12:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DC81132EE;
	Mon,  1 Jun 2026 12:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4HXxKOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F8F10E7A9
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 12:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780318026; x=1811854026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HM1knaQtm5E6Ow2zie6uyHV3QhWLzGbMNKk5B71uSYs=;
 b=G4HXxKOof1Tt7T1oLIew4AX0quWnNDMTIk++2QQFY1pSEwdbRXnphks8
 H1p7B8ITYUoPJV6BDRo2nRDmIt57CI//tg+yRSMKWubV9gfMvHWfiZfUd
 y9nnYoteMzK0k6mEht43B9AKD/18qhlIYA7iqrEify31mReyyoawZPh0M
 h3Pmga4ZPGBvQYDZrxXJm9YzYGRU6QCZmn3fWrBUYUX1XKRleFfhomuah
 z9g1aIiw2matiIK0W7GFBz/bHbm9qa4XC8xcDcLum1cSD3BQyVH6ZB1RL
 HgkZgkSsonxBkdSZY/ia6675QvKP4LWOCbHpgxUbvGspbzHoiqIUJ4RIe Q==;
X-CSE-ConnectionGUID: +YdwXReuSlW98xbHUqjoKA==
X-CSE-MsgGUID: hAj3idb0RgCcmFxXwlNiSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="91384314"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="91384314"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 05:47:05 -0700
X-CSE-ConnectionGUID: 4DYAY2i8ShKeuv7lGc640g==
X-CSE-MsgGUID: IJIi8VoJS9+gs+gemv1VzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="245394418"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 05:47:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 05:47:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 05:47:04 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 05:47:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDOdogDPsFlNr96yWWr0P2KD7rYrnSfISwrrJGUvri9v0xXZj+FjsUtoXGrO4EcRoFRPh1uu3FJ93ddPdaan7HaQ7MjnzQwsDNG1Rd7ofuTgyMPSTtW45BvetAbCrra75oMzmqGAC0gEE4e3f7gCYpeRGitw8ardowFGNvZE2q7+Tz7T1Z35kS+rBAZPN9BkCI+7xfjnwdle3tq0ORV+vpSfdNjShQ5bQvZdLnZbK7MuEPMxGPLIq/IkZrQX/mhL8V967LWwghVN/8TehFFxqCPXGasJlmk4gyAoR9pfD2kVikr2U7AX16WxYm/Ddxjk21bSTIO9vuShth9jThpI5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MB2ViqGRV9AMKNlApnZFiZmb2Uudx/17bDTK3IEl+3M=;
 b=iix7Xhfrz7QB8u2nAaHfkhiHsOoXErPagLJMMEUeCTiwKFWKe4Ki4sV3GGa7j85yPkPvR9MM99QU1FIBI79cW7lHOr0zGB2AHaBG22DaZfJoNlVd3WXkDhxTxDcvhJL+VEP4ozoZzvyJO3LBbFZ5xgP/nJUVanJjjzhuY6WoroFHYGzmCixhog2aiOBAUD7NPFDA91OskRSaj4kCI6Cz3OH0OUi6b6IOAEwZIHnxGvwwKIuy88WqAlDR6SXhqKc5iVgh1Rj0bBhNsjdFqtbH5VEfY9FAmCxPtoy3NR2UrYUJmrR3eMoMZPHysT4Ss0KeX1QUZb4bikVoLM9l/2nAvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 by PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Mon, 1 Jun 2026
 12:46:56 +0000
Received: from SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833]) by SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 12:46:56 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <zbigniew.kempczynski@intel.com>, <x.wang@intel.com>
Subject: [PATCH i-g-t v5 2/2] tools/igt_power: initialize xe_device cache
Date: Mon, 1 Jun 2026 14:46:20 +0200
Message-ID: <7b866a298e08e0b6737818a9497bea668aff7f0d.1780317251.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1780317251.git.sebastian.brzezinka@intel.com>
References: <cover.1780317251.git.sebastian.brzezinka@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::14) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6897:EE_|PH7PR11MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb42b6c-a91a-4247-921c-08debfdbdcf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: QrCaSzzbeesFpwda+xvWysDWm41JBt2OytuFRwAL/9I2HTcy9hlPII1M8HBTj3bDQXlJg3thYnBkAxNPdCF+wkiyv/ubZisE4CS9o8RO1Wy62bUbIaq7sV1STIF7JuOxLsc7Fr213XgUZnFNPEoP4c46lP6h64tc4dOKhyyNNbDw3ulGLWdxZjVGtHN7O48R62Di5CroQnpNBCUSaA7ElDPZ66Kvgn8GE1Rzhu4t3FviSTMkesQkQshvlIvAuKdSzVW60H9mZlJDdeP1xXf0Qi0hYRn5y1XD6K3+BR3NfG7BOOe+aAbn4GQ6s6Ep410z2tU7QHOycDj4sDKFJMtc9KHnV6h3BoZnT2pkcdCsKDVXfYV9mF2fBeNB8yMLy2jed42p29bKzHzpx8vrVFyLqsVO9pdfwsAxPAiuX8JyaBZMdIOy1Pv9Sugy8BoSjuCsdFvECsUaMSxYWCGULkoxM2oFmlz3ow9dlf0+NRL8LCEYLfS+jBqFCNE6CrBlvu8lPFZsY+iXvHve35M+EEJkrkW3s6WRcWS13yWzLLJXuBN/Nd+bHObYFs7lG6cBVIMMnMes6s/dU+5a8zqLt6CB+d3zBaSK9StxvdiJYbK9SbhrYuTiH69v9jgcD7AjoHNm9HfCEWWkIsehLhGubr8m7CYyxwcfkLn0xXNK824AnnndH0FUNeQceH4Hg+E/cjDE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IjbmtFfmjL3dBZrOZ6/ZUuZRT/5scMVQKu0loDbaDwF2ZrzpmpPyETWv3d+T?=
 =?us-ascii?Q?oDQM3h+/4hMV4CTo9NQvzcigDZlgO7bvgD0QvUjKP+7RYeqB0NCZFHRCPC38?=
 =?us-ascii?Q?oYNowKLQTh/2euULjIg/0YI75mC0PVZK1uljEDbJO7yOl0wtbxrrcYsltsOQ?=
 =?us-ascii?Q?J7IQhvQ5YUYaegj88sWSVxzxzi9QukD4zJ2/dIrqOL4vjofGytdr+/QUuF+n?=
 =?us-ascii?Q?0kPCRnnFaSnJezSPrrQoYzuWUBkes4nVTnD7CF9GSAY4Hyp+rYfhDVBM8BVF?=
 =?us-ascii?Q?tHot83Js9kdSPNLL4fETU0u6x+oZLg3THt96HFnmz/u3AHFlOeN7oLI4Jk1t?=
 =?us-ascii?Q?yLenSj05kQajmMgasNmRUnFU4Bc2stV6F6HWgmqSM9zWOAIozJkEcqEcsCny?=
 =?us-ascii?Q?J9/xBdLketg7y2D+vyIrP/ZAl0/ayHDjUxyjnjLliWQa+HX82cE6GdfNhld6?=
 =?us-ascii?Q?k+MQdOc9MiUaO/dOCEOb+sltOZJ+XgIrIHtKlFit5GrlfIpd2pb3KlfN9e0+?=
 =?us-ascii?Q?J4m/lz1d4s0ptqUI+ZyfFMgFBMOxZKlorxI3mHIRLd1qvIFgJxjaa9CYz4jH?=
 =?us-ascii?Q?U5j9UUyGIMLT7oFs4Mxr1f/BZ/Mo9jkAjZsmhmpJ1P0Rdj9czYp4Pb6KFl75?=
 =?us-ascii?Q?YPlCGoFJA5950OfF6jlsuFGX4gAXfLg0BY5EevLc3Qj/UGkZ3SUmWQS71M1c?=
 =?us-ascii?Q?aUelRtkApIV6FL8ssOZJz/Fw1iOtqx7iL10n4iBT5Z8av1FniEpj9wqNv4tr?=
 =?us-ascii?Q?A6iyHdeDxgGZ3EeuYbP4G8gVwd5lTVuiIFsABe0QFrsewjYEPpUTd6oY94tJ?=
 =?us-ascii?Q?IUdnfWvqJeuNRL9n4Xmen5SS+A3SgRd6mb3OBLEB0CqZikmEOvclbVHusx7n?=
 =?us-ascii?Q?BxNDxUbBEiiBVNJuYkEoBLwCiBaHc/y+FdDwbiTCX7rztuy0zJmzU9tQAxVp?=
 =?us-ascii?Q?MRGNrwvkt/8RaJt5GoJfXuyi3QwzcSzSbAmqhj4f83gOYvMLaHWJewwriDUm?=
 =?us-ascii?Q?pFBV97mAMtwuRahTM/FbGxjXlhKhSz/Keu33bW93o1IHwvG0yA26XW1rY9C2?=
 =?us-ascii?Q?xkfTj24P6JX4DQTRqvLhJJfBySyA4MUb1IZKLzDxHVDVALHiz/0nhAT4XjiD?=
 =?us-ascii?Q?Wx41uwrdZNxYBYzFOk2XurF3+H65lZqr9juwkUZt6H9w3vS9FOhL2umn8/mQ?=
 =?us-ascii?Q?P02OkU0CTIb9oCRDR3KIBJtNYuuYf8U14yxx+fAflhfeUoAFTt/XHQYX1wjy?=
 =?us-ascii?Q?QdDwX7osWIJ3kPuu1vQTOBZOA3bHyVM02k0kbk1+vnKpcHGp9Et8qZopb47n?=
 =?us-ascii?Q?NEFlyPooAuXp2C6F8dlapIpBBhLUmXa1G27ikgpuCYD7txSZjoYKoeWr6WoY?=
 =?us-ascii?Q?e5thZps4OI5gtS+pZUzDipshsToPxW36eJXam5VXvzYGduB8B6ctQf27avtE?=
 =?us-ascii?Q?jtJe+wOQI9hk+MLUPjm/VUfZJwGTNlSp1olsRmUQ06v/DosxeGG2OIx9Se3z?=
 =?us-ascii?Q?EknxF3CD01N3LwtfDo0sdIYNVpiIN0hFL5PUNy4R7nB/wd91SuBEY9WeuXAP?=
 =?us-ascii?Q?EMS+9Il5igP1rQiBRuI0z1zlQ+usHkurd3cx0N1juhcw1SuQ5nysOTL+7SJ4?=
 =?us-ascii?Q?Xi9XXLqckWT6Ol/WckYl9owiK+bau+H0WFkMsfttO0QOcpVMS12v8CXQe6Py?=
 =?us-ascii?Q?20aLuH6bZJixLakH008U1fHwuZ/SN8hJuMFcTVnKoTk7LF6a05KIhJKoeFi7?=
 =?us-ascii?Q?gJ1Gb985YIe/69p8m8heHPIeru/rnxg=3D?=
X-Exchange-RoutingPolicyChecked: cjmgXPk641Jbve97SP3PRtVXLBMC3N1UXGR85DO21+4hH/eHbImiABlOe28Lyk2I5Rfv9TlLOZBAltmSHTqVp5/jIyTWHvdgCVIpYIYJq1mmqIVSEJKkD9KK1vqElAtj4NM2xGrk65QCcCDpE8OwgxIf42rNtcy4ei7Ei/I+QnNjnRsP7fgB62d7ry0vbYjlSWkxQR8OglefbbvbGYzEkpIjBGZfz+ajH8JNuTyPK341bZuDgjaBP+IfnxzKcknO6hE/8m0HEbhIZR+rBdayE8jQJx/GkC1piLzJXvVerRXDG5T0Hcg6L4tYfPAuU7AtCtJgxnQxq9BJ8nB+i0Erbg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb42b6c-a91a-4247-921c-08debfdbdcf8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 12:46:56.1775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzdoL7sRt0aMh22dgeESi8QFX7nJjSR31CNfG2A5GjfM8xTuTTY5r/xxbMutUi1lkB+sDSCSf+lVQa4cDKTD1arxeIzNoYAx/a9ZuKvTjt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
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

Opening a DRM device with plain open() does not initialize the Xe device
cache. When igt_power_open() calls is_intel_dgfx() -> xe_has_vram(),
it reaches find_in_cache() which asserts the cache entry exists, causing
a crash on Xe devices with: xe_query-CRITICAL: Failed assertion: xe_dev

Switch both open/close call sites to drm_open_driver_path() and
__drm_close_driver() so that Xe cache setup and teardown are paired with
the fd lifecycle, keeping igt_power free of Xe-specific handling.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/igt_power.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/igt_power.c b/tools/igt_power.c
index 6dd180d34..9458315a3 100644
--- a/tools/igt_power.c
+++ b/tools/igt_power.c
@@ -38,7 +38,7 @@ static bool prepare(struct measurement *m)
 		int ret, fd = -1;
 
 		if (m->drm_device) {
-			fd = open(m->drm_device, O_RDONLY);
+			fd = drm_open_driver_path(m->drm_device);
 			if (fd < 0) {
 				fprintf(stderr, "Unable to open drm device %s (%d)\n",
 					m->drm_device, -errno);
@@ -54,12 +54,12 @@ static bool prepare(struct measurement *m)
 			else
 				fprintf(stderr, "Unable to open rapl domain %s (%d)\n",
 					m->rapl_domain, ret);
-			close(fd);
 
+			__drm_close_driver(fd);
 			return false;
 		}
 
-		close(fd);
+		__drm_close_driver(fd);
 	}
 
 	return true;
-- 
2.53.0

