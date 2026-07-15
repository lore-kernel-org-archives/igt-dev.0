Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27094C44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 12:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DAB10F032;
	Wed, 15 Jul 2026 12:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWCnUfxJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E9E10F023
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784117770; x=1815653770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nLWfR6gpoVw9Rlvv5n0G82fyEbEscFm8cwXXopI0sgs=;
 b=KWCnUfxJSTAEovwMgLBqRJOZQbOsAmQjTOEcG55KSP5cg1/E7Y8RLENh
 CI1J3jhOSxFlvBZGSoXj/BYi1F4bZTTrwr7e+TKbkzOEjXAkLllmDSC3z
 3pLHjb0IIZOeRBWGX8TsjVULTgV99Pb99OXGrbEoTTy/eCXz6v6byS+6E
 t90nnBXAaUu/oinlvB0WaUqBQ5PEvLXBm9JEMGwQLOwEIlULkgOzJTu7h
 d2PdO3PFfQJYdCODB9mVE6qNueC5g8qVw7vfdvUJs4ZJwdPA45o+HDky1
 RI1GQYwOnXt4gFTEjkDbk5gmCqyUANVoqp7xJqLJL2i+XxZJ1A8bgpg6o g==;
X-CSE-ConnectionGUID: +DNIRCadRLO6vhOspWMWaQ==
X-CSE-MsgGUID: RGMOIKR2QWGzVvz9rRs1TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84607112"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="84607112"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:09 -0700
X-CSE-ConnectionGUID: XIjYy9qOSsmdZNKIluaf6w==
X-CSE-MsgGUID: BbrY8Vn3QSqfgPbXjWaeYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="255659734"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 05:16:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:16:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 05:16:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 05:16:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXbo9uHbK2ca1dnAxAs53koMVytFuex/xhVk9bamrIfgfC+NMuTl5ACmxkeEJxBCPcX4CQPEjSWoznRApk9XB2B+LhG+GrJPmXQi2qJdqcpMpXGIHV5DNZqwEhEiQF+n4HCJwh3RJ1CCVzO5P871sbH59iUtFGRvKF+IvXKaAnuPmXybf3YtoWznzKSJToVBuOmZc6qDtl7Dh2jy3yWUoarKUnUreO9V66W5e5t6KxW+8BD4Kr4a/uJSzUsqJrl4DawxNJWaLf+IodEx/U3FNQJYUdzggqGq9AASnk+xo2WAHFPMO5hoB+gUfteBKXnFQdz5WlmU1EHqMvjLiYj2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbo6DhBoR5mfw4C7wytfmFCAG+2RkhlA3hMd5VrHc5g=;
 b=cCMh3AcYn8pr8BsGjnFWRzO4pAyvuTK0HmspLNLn/aS36xfLuHa5/WwCQP9C97dgkS++r2Ae4ErjkHdVTbDkIWIAvZ4Emtc0EuhrXVMMBOplQZfk5625SHwsbGfuLdsnrUpd20T8/2BzMPgNNPz3Vr5Btr6A2SAE+G4DRk8rN/0VZziAgihO9PkorGOcF88UYK2U6b2T/uIr/ML1ozwyynrx4BZvhGX/ZHOWUbM1kprLkNF0Q9X0dc8YFSezSK1LfYY89KQEq4S5OCCMs3THpFv2eaEVB7FVMgtiMeXJ5cgUy4UcWMkevetzdwKX1G3qw3fYX8MtXy34gcefNH/Q9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:16:05 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 12:16:05 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <kamil.konieczny@linux.intel.com>, <krzysztof.karas@intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v3 30/31] lib/igt_core: move igt_load_igtrc to
 igt_device_scan
Date: Wed, 15 Jul 2026 14:15:40 +0200
Message-ID: <db4400f05ba72613df363cc62496319a5c0fed9b.1784117512.git.sebastian.brzezinka@intel.com>
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
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: bff9715d-2205-42f8-84aa-08dee26ad7c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|6133799003|11063799006|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: iQucQk4smzJ+h6i9e9IEje0Qsq8Ax/4mGZF1Mlllwlc+a+zGo5uXXMyV7Lxw0spAtdI0HnFqHAs0yg9gzoIdSFtqY6uIjRCwMZeZh/c7VxpTWj0Io3Nf6q2Udex4adane+/CrCxjTTkRo5BGyijxTeozguusN0xcIuNtfJNRFsh1IyUkq7oU4FcmH7T3uE68b7nYgXksl2v1bHTei+wZagOWIMDVISzmcs3cCPHOpCfZnohENGiqaBwC1YIFETTXXZLN6448M8+TzsYMEavkRVtjEggmeIGLqK68GHIH4Pq/5/7edwahM/IFGgwkHdohfO9ZjTkDW3Ehxd3DzT7d8oIxy6a92gZd0koJDKQx1frz5ipOIbx5ZZyqBXTRAhXapKXnSKVrhDnfI7nttPkhCnFqQRqNkX8Z0QHo4XunExw2kO2WmPUJp8es4XIa2lUildy86hmai1Wg/mKca2YGbNu6YruTQ4g3QRMvbTvNQgBBSnn45RywBCHYPE9s5HgxwHmhigX1WC0tSW07xQDpf6r5Ge73Q44ZcvxO4RD+fY4VlKAKf7ow2mUX3e1khQUlHCeCKoVQu/mIyeqHpjqnn0K6ATKs8zJ7IDLzyui/1BA+RVgmVd+qGeQt5w6rGYPQdhZqfu+KpwLpqOl44A8/lQ7DTT4buVoz5XBTRllx0cQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S6YBB2KYh1qElUfPZxPL0M4gQbkTMk8WReH5YGGyDFljrpiiZtka87l4WZkT?=
 =?us-ascii?Q?lc/qhO+sehdnfUT2pZst+fMs2e8KEIXYhqtJ3DkguzqIzWnzxkMQxzFpL08u?=
 =?us-ascii?Q?1rNb4SHzP3YEQ/vEiZmIYiQUKmNVkzsV7CNQTHYOPPfuLVO0jMtIuKuNkBLr?=
 =?us-ascii?Q?MkeeSMsJKxJObvwmjzfSGaZ496Lwwl+vZsXpyqIgmuBJgke3m15ZP5sRdpvh?=
 =?us-ascii?Q?5an9CDokU58NSJE29ENGjsg34OZwBicEIjYtGQWFGIWn9BkfpJDXYIsN30Kq?=
 =?us-ascii?Q?vrUNirN5w6OdYkmFAVpOqq8WaC7zE61DIEzIwHKmxnRuRNfmFin914zSSqbX?=
 =?us-ascii?Q?L9ImHGV1uH8FyLC5naeAVvTnuNoYh8FU4TX7h3X585xBb0wOSY7SXIVgAZAQ?=
 =?us-ascii?Q?LdLJor5jN7pGYcjseorUQCb91aR1RNBWjLryQzDbDu92ZfDP/hA7rxLekqll?=
 =?us-ascii?Q?Yra6F8R1U5RiH8Px4hZX2vob2+nP105kya8qB4qZ82UYJFV5ZjrfVpKof6b9?=
 =?us-ascii?Q?1SxwAu5RqqI54kzi+ijhwbzrTIU69RJzDsZO9EWVP7NxMt8DnOh4/2fSZkDH?=
 =?us-ascii?Q?plelL2qyMwMhTdVOtXvVogTU/UXAI/4HmP9ffTEGDH7LI+qt/HRLMZqKkpiq?=
 =?us-ascii?Q?3oFeArQBO2YAbUsh8KRB5jrFrZgkVCLFUNvWvpQavc4A5Tu4WYG6dpxsyVaY?=
 =?us-ascii?Q?AXjwQW/Mp9SLGmD9lkF+LcWqenNVLbfPPRSelzqEYjE0a8isFYkvkXN9Gnn/?=
 =?us-ascii?Q?IaaY5FoOhGVUTOirwz3rnyU2pRBsydwKXtOfJPmuNkv/t05eRDnoacddhzpa?=
 =?us-ascii?Q?I8rOkAr7zRsEci0v6SxnPqJLPECuUXEizYh+WXFwp7O+Ft93z0cYDXKp+plJ?=
 =?us-ascii?Q?I+H9F2qiXlrr50EhtmwxzAdswY8TW7lQS+ZrRZfnBvnZDR7Do2OgQwXQ6CT5?=
 =?us-ascii?Q?Ss4UyelWVZqLRtLvGob3yslAlrV2CXrLjtphN55ZKbaIFlmdAolwicCKPTxN?=
 =?us-ascii?Q?chTeYm6LDOagfI7zE+n0vAgX1+ckyNXaLPqbPnS3kEU59u10/0llchdp4iqd?=
 =?us-ascii?Q?/WVp7UILMaoX8U+wTaLlwjjrAuJQi021O+XX76Xs/J6L1nxnJrM0BKxTWcQ4?=
 =?us-ascii?Q?TmKTprIdHM0bSQ9Ww1mlCMIYounqwi6+wuhxHej7CHt70u+GinKsfvPEClpv?=
 =?us-ascii?Q?S2P/QJEUWWm/zJ5R1/+XZ2nq3XUUrCLsrP4YV1xUm7imm8mD087qHfOyW/7L?=
 =?us-ascii?Q?jDRdDxJgYCvo97pW4Awliex7dATuV7UeJQX2tHICnVWZIqGKOLeN0GDutLlw?=
 =?us-ascii?Q?H0pQ7k42BG6Tgkhnz4KHErBx3Ny7TyumgZvMaGMtkeUYKqBHEv8hQ25afifn?=
 =?us-ascii?Q?DbLm6ZZ+qliAAr4Z7Wga0Yo6P+chi9YAgKpExN09M3eJ01qbufouwv06Wo2s?=
 =?us-ascii?Q?RHFVEL0dJtXb0XsoQHll2Z8olVQUxaKjSFulH+HTjgsyf7vB8h/PofUOyfnQ?=
 =?us-ascii?Q?DCUtySD3CiQpv0MP9Owh5y5rUZde3CuEzAFNELrWNeiQvc6e6swRqANp/Bao?=
 =?us-ascii?Q?TU5qwSjte1/+tyPbjnBy3qKtrMwnFjABDw0wyiK2EF/XbUKLPTHc4fnXtFqa?=
 =?us-ascii?Q?B1fcX664zofxdOn0jJQ89WzKlRZDYq9MJIbnoJGkljSeGdu4IkCCk9TE5tHS?=
 =?us-ascii?Q?W/uaOUJHo5lfIK/mNzgvMcrX56Ss58X9eQO7LfoUsL54yWAJAW74kuwoD2EW?=
 =?us-ascii?Q?rtR11C/UTNpPAPDzIRV6bFg8zjxC7QE=3D?=
X-Exchange-RoutingPolicyChecked: VLLVC3Mxofv6+2yxIhFQ9BZ3Yj5m8/dI93DEguHYXPt3m/0wzvPK061j2IXHA01J2DLSHRIZPOLGtCcvl7ArF+o+Hv7Qdq/qSZVsdN5tADokury/nKFf1YPt4lL8KX1xCvV3Vq27+N/OaVrLZB1M8iVTY/LUmsxIeAhLUt8t5VuE7OJoCoUvU1g7s1z2Ui9iNbhFJ+GpTl4Ry2TIxDpTdlbKmpYhGYNhbaL/ul8oZJhzRv5PbSGGtn/H2IXiX2MIFeh78lv/AjVaRbJWW3xENxA1svpVRwrcgzAy6TC1wGZaRStJ5sl8pU4VmVIfa8MPBd92b+2PfFVAyg2JA9WM6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: bff9715d-2205-42f8-84aa-08dee26ad7c6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:16:04.9529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdLAMGxJy26e6bk5GX7ax4wPL6u4Q9I9+UU7eCOBMoChed2Mej2xcm86FjGci7TwQgRkpZJEQ4vG65goM9Kksl0qhNAuVrlqkDS4lQS2Kwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
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

igt_load_igtrc() is used exclusively by igt_device_scan internals to read
per-device configuration from the igtrc file.  Moving it from igt_core.c
to igt_device_scan.c co-locates the function with its primary user and
makes it possible for lsgpu to link against lib_igt_device_scan without
needing the rest of libigt.

Update the declaration accordingly: remove from igt_core.h and add to
igt_device_scan.h where the implementation now lives.

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_core.c        | 47 ------------------------------------------
 lib/igt_core.h        |  2 --
 lib/igt_device_scan.c | 48 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_device_scan.h |  2 ++
 runner/executor.c     |  1 +
 5 files changed, 51 insertions(+), 49 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index a7c097d9e..2f737b01a 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -972,53 +972,6 @@ static void oom_adjust_for_doom(void)
 
 }
 
-/**
- * load_igtrc:
- *
- * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
- * home directory if that is not set. The returned keyfile needs to be
- * deallocated using g_key_file_free().
- *
- * Returns: Pointer to the keyfile, NULL on error.
- */
-GKeyFile *igt_load_igtrc(void)
-{
-	char *key_file_env = NULL;
-	char *key_file_loc = NULL;
-	GError *error = NULL;
-	GKeyFile *file;
-	int ret;
-
-	/* Determine igt config path */
-	key_file_env = getenv("IGT_CONFIG_PATH");
-	if (key_file_env) {
-		key_file_loc = key_file_env;
-	} else {
-		key_file_loc = malloc(100);
-		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
-	}
-
-	/* Load igt config file */
-	file = g_key_file_new();
-	ret = g_key_file_load_from_file(file, key_file_loc,
-					G_KEY_FILE_NONE, &error);
-	if (!ret) {
-		g_error_free(error);
-		g_key_file_free(file);
-		file = NULL;
-
-		goto out;
-	}
-
-	g_clear_error(&error);
-
- out:
-	if (!key_file_env && key_file_loc)
-		free(key_file_loc);
-
-	return file;
-}
-
 static void common_init_config(void)
 {
 	GError *error = NULL;
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 3337293bc..afaf35aa8 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -95,8 +95,6 @@ extern const char* __igt_test_description __attribute__((weak));
 extern bool __igt_plain_output;
 extern char *igt_frame_dump_path;
 
-struct _GKeyFile *igt_load_igtrc(void);
-
 /**
  * IGT_TEST_DESCRIPTION:
  * @str: description string
diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 7c7995224..a15a4624e 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -33,6 +33,7 @@
 #include <ctype.h>
 #include <dirent.h>
 #include <fcntl.h>
+#include <glib.h>
 #include <libudev.h>
 #ifdef __linux__
 #include <linux/limits.h>
@@ -2477,3 +2478,50 @@ int igt_device_prepare_filtered_view(const char *vendor)
 
 	return gpu_count;
 }
+
+/**
+ * igt_load_igtrc:
+ *
+ * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
+ * home directory if that is not set. The returned keyfile needs to be
+ * deallocated using g_key_file_free().
+ *
+ * Returns: Pointer to the keyfile, NULL on error.
+ */
+GKeyFile *igt_load_igtrc(void)
+{
+	char *key_file_env = NULL;
+	char *key_file_loc = NULL;
+	GError *error = NULL;
+	GKeyFile *file;
+	int ret;
+
+	/* Determine igt config path */
+	key_file_env = getenv("IGT_CONFIG_PATH");
+	if (key_file_env) {
+		key_file_loc = key_file_env;
+	} else {
+		key_file_loc = malloc(100);
+		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
+	}
+
+	/* Load igt config file */
+	file = g_key_file_new();
+	ret = g_key_file_load_from_file(file, key_file_loc,
+					G_KEY_FILE_NONE, &error);
+	if (!ret) {
+		g_error_free(error);
+		g_key_file_free(file);
+		file = NULL;
+
+		goto out;
+	}
+
+	g_clear_error(&error);
+
+ out:
+	if (!key_file_env && key_file_loc)
+		free(key_file_loc);
+
+	return file;
+}
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index f24a193cd..5b04033e3 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -103,4 +103,6 @@ int igt_open_render(struct igt_device_card *card);
 /* Add or use filters to match multiGPU devices */
 int igt_device_prepare_filtered_view(const char *vendor);
 
+struct _GKeyFile *igt_load_igtrc(void);
+
 #endif /* __IGT_DEVICE_SCAN_H__ */
diff --git a/runner/executor.c b/runner/executor.c
index a8907c575..a2cf517df 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -35,6 +35,7 @@
 
 #include "igt_aux.h"
 #include "igt_core.h"
+#include "igt_device_scan.h"
 #include "igt_facts.h"
 #include "igt_taints.h"
 #include "igt_vec.h"
-- 
2.53.0

