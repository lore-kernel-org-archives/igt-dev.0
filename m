Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D3606B406
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eXatIuca;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=CR//FOdg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A0A10EE96;
	Mon, 23 Nov 2026 14:55:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6A110EE96
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795445668; x=1826981668;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=6QorhscBLaL1Q9416qZMatrzWAOK/ub/xGuVXQ0qvMk=;
 b=eXatIucahPTmLy900ZQTpnA5UUu3qK7+rI1IsY8YknWmQYXelFlNLLzx
 qF3hGRhA+FyQv0zArY8/8aTHYUdA1scDonGdRMyqnF/715K3Z4PizRdpe
 TQ43OvTYBmHRzOYOfWIT/UWPzP2CTGJ1rlO75fi/WqLzHtjTuvWuxjwc5
 NpoUG2ObObQFrObkStLOttYG6iyz4F3kgDuz8q6J72UKDO+pkjU10/EiW
 is3Bko2bkyBR+xT6JS//FRPsMgqlY2XAb+xudZ+pyHMEJTd/zR26HjsRt
 8d5Hz74H6yBdo3yAVWwkBs0RdLEt2v/GCvVAhR+2J5OBhaxzF3SqfnQU4 Q==;
X-CSE-ConnectionGUID: P7BITTdFRDaMt14SI2c7Pg==
X-CSE-MsgGUID: HBfZtz+dTla0dKkQfUimHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4104113"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4104113"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:54:28 -0800
X-CSE-ConnectionGUID: 10SbEbmmTo6d3JVLKfXuqA==
X-CSE-MsgGUID: a/EONzw2Q6qJKSyySQgLNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11329842"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 06:54:24 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 06:54:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 06:54:23 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 06:54:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOyDtKXugGGjL6gMFZtBmpmANXjylGqwL03Hw7hv2d1+do/N04i6M2QWKG3Q7xsCPFElHl/xH0IXooTSSUm1iQe+Jn/39QnxaJjCNGj1OgAqvpurYpdZlWCm/J+nI5P0dllj5TEnUX8cpMHLM+RQ74c7LVmSMZHxbNkVDBsjvEa48IY4YO9Svhi/bfDAyky/PJU3a96oLK2m8fK0MvdbuOOaIXufrf+RvRapxWQK6lRIJRtFmXmuEa3mRsaxT2WrauhQeE3VgAXjy9A8aunjo1SmEeb0U6qFRDkMkwGK0JbvP10IP3gqDlWElC5k7fZvg7aIjlF/uOZvFmFrB+5FDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79P1nZ1kIotqeKfAHy64jZZTp1ha5VcbzLigbg35+EA=;
 b=IBVe7EX0BufhCN0E/JMVcU44w7jTIKStjFL1GS+LRH7Jshz6UK4mrh+sihvMfdnQB8cMPlblb5XOFh9m2kAGjY5sK6csQ/3dHb+gHHG8BQaWnX+z/Bxg7EbtOQTpONC7AZoNFIjn65x7+RlW3RfhOB99lHPDunGJqzo+kdieIlchO3AfSjMiSOx/gCICKsA0WYyMJ/hibxhDWtJhSE8Fuy9a1sXJBJ8pxqNgOaPldUzS60bxJKiQcDhLTxEMaUVAUpfK22vWlBMhD1VDpLnODlv2iP2K76ZMi9tC8PzsIqytw5cavCxnzwyuasjJAw2WZF9dWHjUHbz0Hm8/2Q373w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79P1nZ1kIotqeKfAHy64jZZTp1ha5VcbzLigbg35+EA=;
 b=CR//FOdgQZDU5IE++h7XM/ELIHGwxvcgw2k/R+el3Z/QWanNDiJ0Yoa2KS2wV2UzCS6AbxS4kbhGf5H0cRr85+cOQO0oqDAZbaj8oiYeVWah5QmSSi3pLH1gBxGW+0c+dU4AmLi6Qr3h9WETRtdCnx0/S3VEmeZpsjdSPHDBk9Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DM6PR11MB4578.namprd11.prod.outlook.com (2603:10b6:5:2a7::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Mon, 23 Nov 2026 14:54:21 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 14:54:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 1/6] lib/igt_drm_ras_nl: Add node and error counter
 listing
Date: Mon, 23 Nov 2026 09:54:10 -0500
Message-ID: <20261123145414.2243338-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DM6PR11MB4578:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f18831-442b-47d6-5102-08df4971a6f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|56012099006|261009223027099003|261022075727099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 5pSD/lLsKcEc7n5Spva7cBuvLajx/tqW0IFX04UgMA6ibsUdKKpE3Whxb7qSPFHDo8rNQAmGUp+zz/rPyTwufCwf76n/8M5MhahTCsETMpHhUTfgUbqopX95moN4FGCJVrl1I+Z4hUszDmwFsS2u3ApstSusLDmil3dUO3PGRSnvS5gcLyDium/4aGp94+9Dw5pEqfFgbxXxfv1cU8cbEPn96vgeR00Jm0hHsX4hO7QVe5cHay9KiX02WYYg9zi/P9BGEoDaGEVWZM6ddOBWn+pQM7OSS01INDTjHUGVewaLxJJDlOInEk03XXLxCVeNia7qXVSgGAoMVlSOsj7lp0XzxvZyyZyQPMBEHijJ89otTKCDRcPdGKNuAmluLozBDlMn5vAMYyq6610tcrL3t+RKtrobYIl2rEI0Jv4K0/bHPuF3l2kLF4PbPlkDl2oV0VjTxQAbrHzOSPIsRyzNoWIFFhCgTs1rE2/1KzZc/l1HJW//Yn2G8+f2/o5NU2+M26FcP5IkvRfd4tT2r2tUFHQkxWOrP7eAUTPC7XL1Qzofhg+IsvC+U1tIlTuYScLa5XdPHuAldOZV/42+enPidZCVmpfLBR2coLgQXUiVgrTK2tPk8vZqhV+hW0TekacL1lOYjh/bbUiBM2DkMS2qBJBZV/n9Jiv4H1rzhyM6RUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mnK0q8Vm0vzQVoLoVNEeDHN222bMYBiSUvVJNJQjwijdGc/FL8JS5Jc6SNdB?=
 =?us-ascii?Q?pT+oAWcWDaCOjiaHP78dvSPNd40aERobOH+FPLlR7vJTUl9zl8anottk3TET?=
 =?us-ascii?Q?d9U0ecJ7qLivePB1vD++yl7hE0qEwAWSbx2gFzdf0fmUlIrEEvpslqUMF8Os?=
 =?us-ascii?Q?bF3ITtktiUglgLQwsaU52whIo4KE55UVbPKZY1yctCwaVB4pYdglQDov514t?=
 =?us-ascii?Q?f/vUzsniEuJk5EhGLKR8mJC1Te0OUE8kV0yaltpBHeKg7LBNOPXIF9WJTUjT?=
 =?us-ascii?Q?QcUq5St1GWUr9y1hGDgrxwTgBPsX6bprPLh8+7qCNZKXZ0Yv/gRqQ6zn3JW/?=
 =?us-ascii?Q?HONcJqG5dE+FocVqxb4tCAIIwGqcFS3p1iby4egAWv5PWk4XS1DPkQDum7A+?=
 =?us-ascii?Q?kDBA8gHxtGupSeilboRoQKA+S3se09gmH3gFk7Xrzam8AaCxPiZLBNRyj0YQ?=
 =?us-ascii?Q?bdiU/CXdpHLrOREFw0f443EiD6358MR6LreS0ik8+LC/GB71GJozIcZMaEXP?=
 =?us-ascii?Q?dH1f3bgIWWN2MSmOujBGY8eA89pPRhVfQqVHmua13EBa2MM9DcruFjk/x/LB?=
 =?us-ascii?Q?YDRKJ3eXuGkIRyqVqSlICtve5rXbnt89Y1gkYh/klDtcAyI7wlO4Mas3J13e?=
 =?us-ascii?Q?7k/uGPgdy+pE7NGSoBwIpP3pvZYvbCJZztWDKkG2kIvB2mCjDE9PWstlm2Eb?=
 =?us-ascii?Q?2+vEqt7HdOtlnbVVr07wGWkVmintoukyuHsJKn2yXjAoHFe+3JNOFil3FWRg?=
 =?us-ascii?Q?bApkBVSEymaXwi4lp67vssrKj/qQuIZ3mdmWpth1TrFaw6wA0V/IiWD78vxz?=
 =?us-ascii?Q?NnPUye+aSnXK+ZsPPvqkufSuS0SzQYr2dPCrHsftVmL0nkLqOHyDIBmgdAT9?=
 =?us-ascii?Q?A1Zxp5Xy1MMz7Hw1WZszEuSg96y/zp7Ahq3p19SAwqz+GgsRJ+SP7OAiXNSc?=
 =?us-ascii?Q?FgKiyfxjcQI8JU5+FUPR82EosTXL+OuTJbatHovGWN+oPSsQCjymGSgqVTDT?=
 =?us-ascii?Q?wefjJa1qMoYT/EHqPTQXFpv/ZT/0yGe1rp7p83ztSVuvEfPAW4GwK7HkJzis?=
 =?us-ascii?Q?Nt/lLcEvlcCUF90B/5HG76uXpSLm6W2f82RTQGuWMF8Np0hXa++pZVoEROWH?=
 =?us-ascii?Q?fuu3XPY1qNXndi2LYREW4+l2zlRG6e5dZceaJlx7Vwe6t5Si0hZ2bTdYCwC/?=
 =?us-ascii?Q?l2MWC7idDx24Ho4b7YXTjdNmx9kImRJacUpv/RZbvdS+4K6pLiFHkzA1F/mi?=
 =?us-ascii?Q?3vTSepzAM75q+lq4I+vwZZfCradDC+/Y3VqFsgfHcoCO3VLgYGFdCtrqiDhp?=
 =?us-ascii?Q?0UdsLQ/Z0HZ+v8siH1lX03YAep4lVJX1HxTMADLeadv1zCx7+dtSw1DXSpVu?=
 =?us-ascii?Q?i4nFZ7ZA9JHkzTe8us2P1y7VVJ3RonLwyvP4TtYpHoFM/X3GTYtxNaj8sfo3?=
 =?us-ascii?Q?EFKZQ/kYqezJ2vBUfiiCNsQWIaZpMNf1hovmf/VUhqrrg3bkZIVcC+hQIAws?=
 =?us-ascii?Q?L1bIufJaBpPtEwae4XGWVYUw+UJJ3UhLwdWenTSClFg3lT9Uz8FMhrBgSKAD?=
 =?us-ascii?Q?Zsnec1SCCDBg2LuJtyUhKNsog79x9W+CjlXFLb4xQJDKFsX2bN8Y0jqcLV8P?=
 =?us-ascii?Q?kJ70Nu8sRtBU2MvZk0t+R0PSZjdDP41/NjCSXYNR6lqO/1zyxNifO4zWa+pN?=
 =?us-ascii?Q?/jFFQfh5reMZbaHBtrHS6yvIliGmsLvYGWxXfAEQkK0zcjzZkqMDmsIAP3i6?=
 =?us-ascii?Q?l5FSvf2jPg=3D=3D?=
X-Exchange-RoutingPolicyChecked: FJftzaCyvreiBR4OrrlaIOh2esfiqKM6m6NzMJ2ly7RDFHvQ5ZlYvcMR0ZcrtHKKh7e63oULqJXBvysAaP+T2w6r1DkjUz8mmeukS56Gh3q5GbZfqxNEgy6A6v2iXla8SuuqWjmlgUP5yM45GLK3LRvKDW/KbgFQuuAN1U40GCjV+D2ckkuLzYqs8QGbz3PAy/Nsy9xEarBr2BYvaOcr+2SVPWfS3n3BR4dpI4dfa/jeeGAzLrQOB+G+FrHnufDRTTw4e7BANosMylg/g9Z+6WJIHHLRG6el+/AMDK8CuF7OpE23rmRdRUDcB6Cnb/bhBf7DxaUfv9+4vB1KArfkpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f18831-442b-47d6-5102-08df4971a6f5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 14:54:19.2821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lm9wOn9C04CAUzkanMs8wOaCyMNN9UczApABOn3FH+nw1++Xm9o5Do+I2qOiTJ3zySCxpQtTVyf2N1lmQBY0aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4578
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add igt_drm_ras_nl_list_nodes() and igt_drm_ras_nl_list_error_counters()
on top of a common request helper that reads until the reply, the dump
end or the ACK, and records whether the kernel flagged the dump as
interrupted.

Enable message peeking so dump messages larger than a page are not
truncated.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_drm_ras_nl.c | 172 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h |  39 ++++++++++
 2 files changed, 211 insertions(+)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index f7ee3e373..282648f55 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -398,6 +398,7 @@ static void reset_drm_ras_nl_context(struct igt_drm_ras_nl_context *ctx)
 	ctx->event_received = false;
 	ctx->family_id = -1;
 	ctx->subscribed_grp_id = -1;
+	ctx->dump_interrupted = false;
 }
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
@@ -424,6 +425,8 @@ int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
 	if (!ctx->sock)
 		return -ENOMEM;
 
+	nl_socket_enable_msg_peek(ctx->sock);
+
 	if (genl_connect(ctx->sock) < 0) {
 		igt_warn("Failed to connect to Generic Netlink\n");
 		igt_drm_ras_nl_cleanup(ctx);
@@ -657,3 +660,172 @@ int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ct
 
 	return 0;
 }
+
+struct request_state {
+	struct igt_drm_ras_nl_context *ctx;
+	bool done;
+	int error;
+};
+
+static int request_done_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlmsghdr *nlh = nlmsg_hdr(msg);
+	struct request_state *st = arg;
+
+	/* A dump that fails reports its errno in the NLMSG_DONE payload */
+	if (nlh->nlmsg_type == NLMSG_DONE && nlmsg_datalen(nlh) >= sizeof(int))
+		st->error = *(int *)nlmsg_data(nlh);
+	st->done = true;
+
+	return NL_STOP;
+}
+
+static int request_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
+{
+	struct request_state *st = arg;
+
+	st->error = err->error;
+	st->done = true;
+
+	return NL_STOP;
+}
+
+static int request_dump_intr_cb(struct nl_msg *msg, void *arg)
+{
+	struct request_state *st = arg;
+
+	st->ctx->dump_interrupted = true;
+
+	return NL_OK;
+}
+
+/* Send @cmd and feed each reply to @parse until the reply, dump or ACK completes */
+static int request(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, int flags,
+		   int node_attr, uint32_t node_id, nl_recvmsg_msg_cb_t parse, void *arg)
+{
+	struct request_state st = { .ctx = ctx };
+	struct nl_msg *msg;
+	struct nl_cb *cb;
+	int ret;
+
+	if (!ctx || !ctx->sock || ctx->family_id < 0)
+		return -EINVAL;
+
+	msg = nlmsg_alloc();
+	cb = nl_cb_alloc(NL_CB_DEFAULT);
+	if (!msg || !cb ||
+	    !genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, ctx->family_id, 0,
+			 flags | NLM_F_ACK, cmd, DRM_RAS_FAMILY_VERSION) ||
+	    (node_attr && nla_put_u32(msg, node_attr, node_id))) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, parse, arg);
+	nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, request_done_cb, &st);
+	nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, request_done_cb, &st);
+	nl_cb_set(cb, NL_CB_DUMP_INTR, NL_CB_CUSTOM, request_dump_intr_cb, &st);
+	nl_cb_err(cb, NL_CB_CUSTOM, request_error_cb, &st);
+
+	ctx->dump_interrupted = false;
+
+	ret = nl_send_auto(ctx->sock, msg);
+	while (ret >= 0 && !st.done)
+		ret = nl_recvmsgs(ctx->sock, cb);
+
+	ret = st.error ?: (ret < 0 ? normalize_nl_error(ret) : 0);
+out:
+	nlmsg_free(msg);
+	nl_cb_put(cb);
+	return ret;
+}
+
+struct node_list {
+	igt_drm_ras_node_fn fn;
+	void *data;
+};
+
+static int node_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *tb[DRM_RAS_A_NODE_ATTRS_MAX + 1];
+	struct igt_drm_ras_node node = {};
+	struct node_list *list = arg;
+
+	if (genlmsg_parse(nlmsg_hdr(msg), 0, tb, DRM_RAS_A_NODE_ATTRS_MAX, NULL) ||
+	    !tb[DRM_RAS_A_NODE_ATTRS_NODE_ID] || !tb[DRM_RAS_A_NODE_ATTRS_NODE_TYPE])
+		return NL_SKIP;
+
+	node.id = nla_get_u32(tb[DRM_RAS_A_NODE_ATTRS_NODE_ID]);
+	node.type = nla_get_u32(tb[DRM_RAS_A_NODE_ATTRS_NODE_TYPE]);
+	if (tb[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME])
+		nla_strlcpy(node.device_name, tb[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME],
+			    sizeof(node.device_name));
+	if (tb[DRM_RAS_A_NODE_ATTRS_NODE_NAME])
+		nla_strlcpy(node.node_name, tb[DRM_RAS_A_NODE_ATTRS_NODE_NAME],
+			    sizeof(node.node_name));
+
+	list->fn(&node, list->data);
+
+	return NL_OK;
+}
+
+/**
+ * igt_drm_ras_nl_list_nodes - Call @fn for each registered DRM RAS node
+ * @ctx: initialized DRM RAS netlink context
+ * @fn: called once per node
+ * @data: passed to @fn
+ *
+ * Returns: 0 on success, negative errno otherwise.
+ */
+int igt_drm_ras_nl_list_nodes(struct igt_drm_ras_nl_context *ctx,
+			      igt_drm_ras_node_fn fn, void *data)
+{
+	struct node_list list = { fn, data };
+
+	return request(ctx, DRM_RAS_CMD_LIST_NODES, NLM_F_DUMP, 0, 0, node_cb, &list);
+}
+
+struct error_counter_list {
+	igt_drm_ras_error_counter_fn fn;
+	void *data;
+};
+
+static int error_counter_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
+	struct error_counter_list *list = arg;
+	struct igt_drm_ras_error_counter counter = {};
+
+	if (genlmsg_parse(nlmsg_hdr(msg), 0, tb, DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL) ||
+	    !tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID] ||
+	    !tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
+		return NL_SKIP;
+
+	counter.id = nla_get_u32(tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID]);
+	counter.value = nla_get_u32(tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
+	if (tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME])
+		nla_strlcpy(counter.name, tb[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME],
+			    sizeof(counter.name));
+
+	list->fn(&counter, list->data);
+
+	return NL_OK;
+}
+
+/**
+ * igt_drm_ras_nl_list_error_counters - Call @fn for each error counter of a node
+ * @ctx: initialized DRM RAS netlink context
+ * @node_id: error-counter node ID
+ * @fn: called once per error counter
+ * @data: passed to @fn
+ *
+ * Returns: 0 on success, negative errno otherwise.
+ */
+int igt_drm_ras_nl_list_error_counters(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				       igt_drm_ras_error_counter_fn fn, void *data)
+{
+	struct error_counter_list list = { fn, data };
+
+	return request(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER, NLM_F_DUMP,
+		       DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID, node_id, error_counter_cb, &list);
+}
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
index 46d31599d..4980904f8 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -62,8 +62,43 @@ struct igt_drm_ras_nl_context {
 
 	/** @subscribed_grp_id: Multicast group ID currently subscribed to, or -1 if none */
 	int subscribed_grp_id;
+
+	/** @dump_interrupted: Set when the kernel flagged the last dump as interrupted */
+	bool dump_interrupted;
+};
+
+#define IGT_DRM_RAS_NAME_LEN 64
+
+/**
+ * struct igt_drm_ras_node - DRM RAS node
+ */
+struct igt_drm_ras_node {
+	/** @id: Node ID */
+	uint32_t id;
+	/** @type: Node type (enum drm_ras_node_type) */
+	uint32_t type;
+	/** @device_name: Name of the device the node belongs to */
+	char device_name[IGT_DRM_RAS_NAME_LEN];
+	/** @node_name: Name of the node */
+	char node_name[IGT_DRM_RAS_NAME_LEN];
 };
 
+/**
+ * struct igt_drm_ras_error_counter - DRM RAS error counter
+ */
+struct igt_drm_ras_error_counter {
+	/** @id: Error ID */
+	uint32_t id;
+	/** @name: Error name */
+	char name[IGT_DRM_RAS_NAME_LEN];
+	/** @value: Counter value */
+	uint32_t value;
+};
+
+typedef void (*igt_drm_ras_node_fn)(const struct igt_drm_ras_node *node, void *data);
+typedef void (*igt_drm_ras_error_counter_fn)(const struct igt_drm_ras_error_counter *counter,
+					     void *data);
+
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context *ctx);
@@ -72,5 +107,9 @@ int igt_drm_ras_nl_set_error_threshold(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_subscribe_error_report(struct igt_drm_ras_nl_context *ctx,
 					  const char *notify_group_name);
 int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ctx, int timeout_ms);
+int igt_drm_ras_nl_list_nodes(struct igt_drm_ras_nl_context *ctx,
+			      igt_drm_ras_node_fn fn, void *data);
+int igt_drm_ras_nl_list_error_counters(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				       igt_drm_ras_error_counter_fn fn, void *data);
 
 #endif /* IGT_DRM_RAS_NL_H */
-- 
2.56.0

