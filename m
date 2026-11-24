Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECEC606A33B
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 21:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X984VxPf;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=k5hikNFn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAD010E74A;
	Tue, 24 Nov 2026 21:39:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D238910F0D3
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795556148; x=1827092148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6s/rdYC2qg6LUf2Cm4DwLusgMlu2GU8qm9UR3qfveUI=;
 b=X984VxPfJBl5QJOCE8JQwIGidOEj0c/HxybvOXcfG/6u52z0DnnkLEdx
 4MLxx8VrcJWsDlVDVkdTqkCH8iXkS7fQp/CTQSV5eQ8TA2G3AkAQaSf/N
 p7LXutxoPNgBA5nsW/Yr4DQoCsFh3aYlkbQ7a7VthmKc24+xT4EfA/Zrm
 XuOPDuZ2zADakbMwiXGeydYn4wbzNtmQhUybybsu/FquACrzQ5PK/Lhve
 EnBYpPYakXx4aES+YV4QzDNmbiFwbixoGBxJjdaGREdL4eGQFn4AmW8d6
 9qmsOYyNBX5U8ukVfoBC/+LhfMXfGev46tt47//gCruW31mu7pBwANOhB A==;
X-CSE-ConnectionGUID: TlI+doFgQmaE/U4n20Ortw==
X-CSE-MsgGUID: eHd0dbhNR9u8MQmz816RHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4472977"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4472977"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:35:47 -0800
X-CSE-ConnectionGUID: Gd1DcycMTialUMknJXjPUA==
X-CSE-MsgGUID: 29puCBo6SruBeTzhp1D8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="11583246"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:35:47 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:35:46 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 13:35:46 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:35:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdMkS/Ycy0oAkINzOvcYLHI7oUt6qlHFAjx6XrqHSTjeV1+0EzVDhFW2Pvb3wf1s1yaDUKBRlEmf85BXNAfDOehNKkWFIlR2niYF1bCz6kBjPyl5cMyIRhKIbJJOmvy+sZ83AMw7ZkPQqu9IGucVZXTpYBQMwhfJ6eUabL+VEVmE+SWU+8/DtGsA6A99/dIZLz3tWkjXQjNNpzPRCvDflgMMgrxPHZTPfmlVLgEIaM51F2/6OsqC6IrQOBMHnfKE0zTWbeZ86xbXwKEJuJ/nAux6k9DiCASKn91RmbbXxCZC/07PuN0Vg23Ah6OBsYOC0+tcg641HouJayFPqqYzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7kZNajAJJf0La6gIX3B+0cdu67Enh7+iKBxu77mv00=;
 b=l9ZiZ6NhwsCN1QmHObVcQZxuCsaSxh4/HdIPYn398VdQ3+jbwHyPxKoAVv0gZ5qeobySf7L7a0wY4eTiIzC60D0NDPBx0yEVio49BmkWh3XUk5zerIIV5vl2zD8BVDzJkuSvx2WLZQpjcbJ5TPhOH0nSweJFEoRjFU3n3Up4Kj00S2pVD5Gdslspu8rWZ8qhzuGLnE2aZkwu3HF2pTF2ylSCic8TRa+qI4l6KFWrZsAljPHgxSaCjWgDsZHcZQEGt0vQ/qbvNg60JIKAPrAHYA7diqQU1aEca5SvptFURax77L6cV/6LEuKSvB1Hs8nQIwFAs5v2EWpIj2SP7dxxRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7kZNajAJJf0La6gIX3B+0cdu67Enh7+iKBxu77mv00=;
 b=k5hikNFn6vfXZvinEVwuiRzLABnnhI74P+gIrOKazzm5pRfzt3z5n1yiZoNvHltNurQV2BaxVuSngn45X5eA6D/oJjsP9AMvfpHxWe3Jggnc6SNHcQxu7Y1YOQrhnytSyDH3wkKSl8pfxEdNZz8Bgv1OXXxQPx0aKtkp6p9y+sM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 21:35:44 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 21:35:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH i-g-t 4/9] lib/igt_drm_ras_nl: Add telemetry helpers
Date: Tue, 24 Nov 2026 16:35:35 -0500
Message-ID: <20261124213532.3674338-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::7) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|PH7PR11MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a69a87-e36e-4575-9451-08df4a72e554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|261022075727099003|6133799003|22082099003|18002099003|261009223027099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: OrAEY/ERc428PamU5kj/6GFjEyqejlLWM3tBS58cprblXWSzCD8+klxlgZ4p621tOk0NS6ynZwnAj7JWBWHhw7f1PfX/OM5HaWVnWSgEVWuQg5QSaJQmpklLkSOZa4GYejybza+XIKXTpNYRQpa/j2HfALOittX8baVB5v583tvV4U9AABfs/Ek70y0wbe6uKwBZgvbsLN0WgJZTKXL0uWJOg0iyUPhNAszZdAHLZq3w6N777ayZms0aoSltfXRRjKcbb2Auntjv34LHHx4dENy087mHS5tdTnN81Il+N68devvtn3VA85ZozS0Q0OTCvko8n/gi4TuWPpGUVxk9/vu6n8egsNLD/lIfhlv0MgXaBF0tOFuyp5qCmOCBArSHVMwgOFGJ0BwMGeIbh/1BxG+uSPbS0mGvlEnw4u9IEX8fw0JIkxr0D/Hioxm4RIvAC1mJ9QZkXbZDHBG+pTGlFslusRm/+uu38eIFjcDIy52qqv/KMcNIzhVKuTv4C/5RRqag+sj8+iD8iRYB7NFqe75xoxgLaSo3NnO8w5RdHwtqv6ibRhZVYoOc7yJRjzR7A6hxGqlqllmiggeYa1sbkyB5o+L4huQ4zqVwC/lmvecEe8hTdvMQXnUDtawcql5D2FU5rPG4D3goOcUeZvUht0jU3oTVp1dlipYni6oiYwk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(261022075727099003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5im3A+vXedEXuaLTQwjHQrvVreokn5e6yNseRUbbmeKslRs45pc3CtfrFZB0?=
 =?us-ascii?Q?SY4mdF8gT/xCtqxaGClnNUDgUMzVIlyRRzbWvCiMf4/SrNqQ9v7INHRC4ufx?=
 =?us-ascii?Q?MYqxK0KkVARZGwdeqLN4dy12SGW7aMOOR6/8+O76c+Edq94ma0WwwG5yLwNy?=
 =?us-ascii?Q?kUc8QHp8Pwd3+1W3gKl4zXxnzEd6z+ZjNSC7YuDzirLGjipY13VJM1ImwKOg?=
 =?us-ascii?Q?IAIF2+FULoJazBDQzxud3kb06pXTJx0zy8zbhD08wqLugZ7uIYGFA0LEThzD?=
 =?us-ascii?Q?rc3LlGxUdia3Hsc4l4vvkZKK92LgN6G98VSNkm/e/QDHzsexBi5wpXyBJYai?=
 =?us-ascii?Q?23TGimzOcU8zovgrG9w7mIBo6gGuuOGnGHW2HmNgN95Fksj04Spt+awcARmX?=
 =?us-ascii?Q?pAKYCyJHcYxBTWd7leNliOOMMuEbTzU+wlKFCeu/EY/i20tadvogxh28EfU7?=
 =?us-ascii?Q?JYLH1HBjIzCYxOIdrB4FYK6kwHmMYbVu+M8e/bOnyhS6eKh3VVeStdP1e6qS?=
 =?us-ascii?Q?UUw+EwUWrmWDYFHoWv7Zr51nL2RQ/fa5Rh9epmJkgkEAL2fTwm/YFAeToET/?=
 =?us-ascii?Q?19WTBqZydZaPJMLPmTvtYeU9vjCBtKCkautb5A9Z+AjjFD8bXcIkb7E+M8CS?=
 =?us-ascii?Q?ynwCVUN/TTs02gCIAWzV5q61+WHh02wAb9i+OdAW5kN+TnSwlzRCcHO5XsM1?=
 =?us-ascii?Q?qMf8SOQBfaBB2OovzxXqDSaSUQYYcmZPLZ5i4/cJzJzbMSrA7WJ8BzmfuAou?=
 =?us-ascii?Q?fjE6y/044HqP4pmRDsNmivJboiRDayJQJAWaxmtrFxPsssxgKLhbPQVas02m?=
 =?us-ascii?Q?SLgQe/Vyz6DtuWwF0LKDzvV8xJNuFGkBU/Qj7JANc47oYWpIhB6oi3VPlT8y?=
 =?us-ascii?Q?LZ4lrspFwNR6yyQcOSJlJtdte2+7U5laopv1jR7INx0sz8e2LA8oX5GUk24H?=
 =?us-ascii?Q?5i0XR+9eazMOhwXnmYy0qb4cAph/T0XUxk92yesmbvwSN5v4bUkzUbT1fgMP?=
 =?us-ascii?Q?DRJauB3ICE2ifM5pArlFJfMXahkpWdZuwaq052USNby/OqBEu9r3QpRXgY3r?=
 =?us-ascii?Q?21wvMwxieL/Ciq5uflQluMNjf8tv99DHlS0vDuBAkUbv2LAQDNIqyspojdEB?=
 =?us-ascii?Q?Z22I7z9T9vW1hAlb8pRaxM0Nb4Ra4gYNTyUDKgjnzRIUtfMKaUuLRRcJJl6K?=
 =?us-ascii?Q?qiLGT/C9bdfQMTtQJ+c4eKJPIYHN3nvbVrjFTTaUJNxa/w/3Yc+cFqt5hdFm?=
 =?us-ascii?Q?5MtRDKHtkTRlnHpPjHLm3uomnJ6GJ8wpgwvZaJBy2tDt/487NmIsuVIfXJ1r?=
 =?us-ascii?Q?1tCnS6aZtQug2oUC6IQ2m4aAZtU+gfU/F3tTnvzAxH+W+XSShosHTmRAx5ny?=
 =?us-ascii?Q?jgT1OoavJQj5l9jNdJPfXXRxiYUpHLTjXLOtFXojYMeLA4D7g9S55V9GQdfa?=
 =?us-ascii?Q?BCBdfA0/NZqdBk7ANY/gXN2c66cMrmZG4Ykrlyze32Q+mFp9l4lH4Jg6xxbf?=
 =?us-ascii?Q?MFQ3WSF/qYuTNL2zqtdA2zUWjCNKgBAsaZg9XTjjK+ZjUsoKSP0Jh/2SRmJx?=
 =?us-ascii?Q?Lleygts+OTTOE8IQvvYeP3wnOhcUh+Br/6nQpz21ubjSmH7+D1yQjdKbyL5J?=
 =?us-ascii?Q?odN0FsmOj3bOFm8OfbOyLBJM5GwUGR41j42XVNppVP+PUa/4BaAzavE4i+QP?=
 =?us-ascii?Q?Z+69YT3oJ3Z6ZT4wXBzNT3zOV9VePuid4GU8JmzaDNNC1b+sI1uMCnqMEP+2?=
 =?us-ascii?Q?gcRYbEqI4A=3D=3D?=
X-Exchange-RoutingPolicyChecked: hgL44mV0HLUvw4BQmcWd4JIjy/ywwj33pflqg4JkbfNN5ipXtobx6oI/aOe986qOE16/kqK8uTZV+KOilyVdW2w9ZVbs82Z6fPLTWujkHDTzvOQmgnrCvpbTPUSkc63wwm8lAjjrmItpwkYjjFzv7xMl253jrwJKzNW0FItMJ9jIMnb+I464V14fUubCC+u/UGazYzLc4Vbx2EZbLoZNXcEek+xEoiAPmzXjmzSpHjw2mNAxnVDaB9gj0CSe/pIr6lYpttiI9tY6XnPeuSEDf7wXbfxLeQUmF3cfbvvtcxW7Efjw7DXrnZdLb4VGfBeOROKayElJQigU638It+/52Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a69a87-e36e-4575-9451-08df4a72e554
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:35:44.6717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tK4vB1hIjmuHBoPdZ0pQYaoqc6lDHs/1Ycci8sRt5p+ojBlj566qNKnWqqZOzhHGChas+G6cFg8QQa8xByYrkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
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

Add igt_drm_ras_nl_list_telemetry_fields(), igt_drm_ras_nl_telemetry_get()
and igt_drm_ras_nl_telemetry_set() for telemetry nodes. The request
helper is split so that requests can carry more than the node ID.

Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_drm_ras_nl.c | 194 ++++++++++++++++++++++++++++++++++++++++---
 lib/igt_drm_ras_nl.h |  21 +++++
 2 files changed, 202 insertions(+), 13 deletions(-)

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
index 282648f55..bb2900758 100644
--- a/lib/igt_drm_ras_nl.c
+++ b/lib/igt_drm_ras_nl.c
@@ -661,6 +661,11 @@ int igt_drm_ras_nl_wait_for_error_report_event(struct igt_drm_ras_nl_context *ct
 	return 0;
 }
 
+static uint64_t nla_get_uint_any(const struct nlattr *attr)
+{
+	return nla_len(attr) == sizeof(uint32_t) ? nla_get_u32(attr) : nla_get_u64(attr);
+}
+
 struct request_state {
 	struct igt_drm_ras_nl_context *ctx;
 	bool done;
@@ -699,24 +704,35 @@ static int request_dump_intr_cb(struct nl_msg *msg, void *arg)
 	return NL_OK;
 }
 
-/* Send @cmd and feed each reply to @parse until the reply, dump or ACK completes */
-static int request(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, int flags,
-		   int node_attr, uint32_t node_id, nl_recvmsg_msg_cb_t parse, void *arg)
+static int request_alloc(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, int flags,
+			 struct nl_msg **msg)
+{
+	if (!ctx || !ctx->sock || ctx->family_id < 0)
+		return -EINVAL;
+
+	*msg = nlmsg_alloc();
+	if (!*msg)
+		return -ENOMEM;
+
+	if (!genlmsg_put(*msg, NL_AUTO_PORT, NL_AUTO_SEQ, ctx->family_id, 0,
+			 flags | NLM_F_ACK, cmd, DRM_RAS_FAMILY_VERSION)) {
+		nlmsg_free(*msg);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/* Send @msg and feed each reply to @parse until the reply, dump or ACK completes */
+static int request_send(struct igt_drm_ras_nl_context *ctx, struct nl_msg *msg,
+			nl_recvmsg_msg_cb_t parse, void *arg)
 {
 	struct request_state st = { .ctx = ctx };
-	struct nl_msg *msg;
 	struct nl_cb *cb;
 	int ret;
 
-	if (!ctx || !ctx->sock || ctx->family_id < 0)
-		return -EINVAL;
-
-	msg = nlmsg_alloc();
 	cb = nl_cb_alloc(NL_CB_DEFAULT);
-	if (!msg || !cb ||
-	    !genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, ctx->family_id, 0,
-			 flags | NLM_F_ACK, cmd, DRM_RAS_FAMILY_VERSION) ||
-	    (node_attr && nla_put_u32(msg, node_attr, node_id))) {
+	if (!cb) {
 		ret = -ENOMEM;
 		goto out;
 	}
@@ -734,12 +750,30 @@ static int request(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, int flags,
 		ret = nl_recvmsgs(ctx->sock, cb);
 
 	ret = st.error ?: (ret < 0 ? normalize_nl_error(ret) : 0);
+	nl_cb_put(cb);
 out:
 	nlmsg_free(msg);
-	nl_cb_put(cb);
 	return ret;
 }
 
+static int request(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, int flags,
+		   int node_attr, uint32_t node_id, nl_recvmsg_msg_cb_t parse, void *arg)
+{
+	struct nl_msg *msg;
+	int ret;
+
+	ret = request_alloc(ctx, cmd, flags, &msg);
+	if (ret)
+		return ret;
+
+	if (node_attr && nla_put_u32(msg, node_attr, node_id)) {
+		nlmsg_free(msg);
+		return -ENOMEM;
+	}
+
+	return request_send(ctx, msg, parse, arg);
+}
+
 struct node_list {
 	igt_drm_ras_node_fn fn;
 	void *data;
@@ -829,3 +863,137 @@ int igt_drm_ras_nl_list_error_counters(struct igt_drm_ras_nl_context *ctx, uint3
 	return request(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER, NLM_F_DUMP,
 		       DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID, node_id, error_counter_cb, &list);
 }
+
+static int64_t nla_get_sint_any(const struct nlattr *attr)
+{
+	return nla_len(attr) == sizeof(int32_t) ? (int32_t)nla_get_u32(attr) :
+						  (int64_t)nla_get_u64(attr);
+}
+
+struct telemetry_field_list {
+	igt_drm_ras_telemetry_field_fn fn;
+	void *data;
+};
+
+static int telemetry_field_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *tb[DRM_RAS_A_TELEMETRY_ATTRS_MAX + 1];
+	struct telemetry_field_list *list = arg;
+	struct igt_drm_ras_telemetry_field field = {};
+
+	if (genlmsg_parse(nlmsg_hdr(msg), 0, tb, DRM_RAS_A_TELEMETRY_ATTRS_MAX, NULL) ||
+	    !tb[DRM_RAS_A_TELEMETRY_ATTRS_FIELD])
+		return NL_SKIP;
+
+	field.field = nla_get_uint_any(tb[DRM_RAS_A_TELEMETRY_ATTRS_FIELD]);
+	if (tb[DRM_RAS_A_TELEMETRY_ATTRS_FIELD_NAME])
+		nla_strlcpy(field.name, tb[DRM_RAS_A_TELEMETRY_ATTRS_FIELD_NAME],
+			    sizeof(field.name));
+	if (tb[DRM_RAS_A_TELEMETRY_ATTRS_MODE])
+		field.mode = nla_get_uint_any(tb[DRM_RAS_A_TELEMETRY_ATTRS_MODE]);
+
+	list->fn(&field, list->data);
+
+	return NL_OK;
+}
+
+/**
+ * igt_drm_ras_nl_list_telemetry_fields - Call @fn for each telemetry field of a node
+ * @ctx: initialized DRM RAS netlink context
+ * @node_id: telemetry node ID
+ * @fn: called once per field
+ * @data: passed to @fn
+ *
+ * Returns: 0 on success, negative errno otherwise.
+ */
+int igt_drm_ras_nl_list_telemetry_fields(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+					 igt_drm_ras_telemetry_field_fn fn, void *data)
+{
+	struct telemetry_field_list list = { fn, data };
+
+	return request(ctx, DRM_RAS_CMD_TELEMETRY_LIST_FIELDS, NLM_F_DUMP,
+		       DRM_RAS_A_TELEMETRY_ATTRS_NODE_ID, node_id, telemetry_field_cb, &list);
+}
+
+struct telemetry_reply {
+	int64_t *value;
+	int64_t *status;
+};
+
+static int telemetry_reply_cb(struct nl_msg *msg, void *arg)
+{
+	struct nlattr *tb[DRM_RAS_A_TELEMETRY_ATTRS_MAX + 1];
+	struct telemetry_reply *reply = arg;
+
+	if (genlmsg_parse(nlmsg_hdr(msg), 0, tb, DRM_RAS_A_TELEMETRY_ATTRS_MAX, NULL))
+		return NL_SKIP;
+
+	if (reply->value && tb[DRM_RAS_A_TELEMETRY_ATTRS_VALUE])
+		*reply->value = nla_get_sint_any(tb[DRM_RAS_A_TELEMETRY_ATTRS_VALUE]);
+	if (reply->status && tb[DRM_RAS_A_TELEMETRY_ATTRS_STATUS])
+		*reply->status = nla_get_sint_any(tb[DRM_RAS_A_TELEMETRY_ATTRS_STATUS]);
+
+	return NL_OK;
+}
+
+static int telemetry_request(struct igt_drm_ras_nl_context *ctx, uint8_t cmd, uint32_t node_id,
+			     uint64_t field, const int64_t *value, struct telemetry_reply *reply)
+{
+	struct nl_msg *msg;
+	int ret;
+
+	ret = request_alloc(ctx, cmd, 0, &msg);
+	if (ret)
+		return ret;
+
+	if (nla_put_u32(msg, DRM_RAS_A_TELEMETRY_ATTRS_NODE_ID, node_id))
+		goto err;
+
+	if (nla_put_u64(msg, DRM_RAS_A_TELEMETRY_ATTRS_FIELD, field))
+		goto err;
+
+	if (value && nla_put_u64(msg, DRM_RAS_A_TELEMETRY_ATTRS_VALUE, *value))
+		goto err;
+
+	return request_send(ctx, msg, telemetry_reply_cb, reply);
+
+err:
+	nlmsg_free(msg);
+	return -ENOMEM;
+}
+
+/**
+ * igt_drm_ras_nl_telemetry_get - Read a telemetry field
+ * @ctx: initialized DRM RAS netlink context
+ * @node_id: telemetry node ID
+ * @field: telemetry field to read
+ * @value: set to the value read, only meaningful when @status is 0
+ * @status: set to the status reported by the device
+ *
+ * Returns: 0 if the read was performed, negative errno otherwise.
+ */
+int igt_drm_ras_nl_telemetry_get(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				 uint64_t field, int64_t *value, int64_t *status)
+{
+	struct telemetry_reply reply = { value, status };
+
+	return telemetry_request(ctx, DRM_RAS_CMD_TELEMETRY_GET, node_id, field, NULL, &reply);
+}
+
+/**
+ * igt_drm_ras_nl_telemetry_set - Write a telemetry field
+ * @ctx: initialized DRM RAS netlink context
+ * @node_id: telemetry node ID
+ * @field: telemetry field to write
+ * @value: value to write
+ * @status: set to the status reported by the device
+ *
+ * Returns: 0 if the write was performed, negative errno otherwise.
+ */
+int igt_drm_ras_nl_telemetry_set(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				 uint64_t field, int64_t value, int64_t *status)
+{
+	struct telemetry_reply reply = { NULL, status };
+
+	return telemetry_request(ctx, DRM_RAS_CMD_TELEMETRY_SET, node_id, field, &value, &reply);
+}
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
index 4980904f8..1b2a8f164 100644
--- a/lib/igt_drm_ras_nl.h
+++ b/lib/igt_drm_ras_nl.h
@@ -95,9 +95,23 @@ struct igt_drm_ras_error_counter {
 	uint32_t value;
 };
 
+/**
+ * struct igt_drm_ras_telemetry_field - DRM RAS telemetry field
+ */
+struct igt_drm_ras_telemetry_field {
+	/** @field: Field ID, as defined by the device uAPI */
+	uint64_t field;
+	/** @name: Field name */
+	char name[IGT_DRM_RAS_NAME_LEN];
+	/** @mode: Supported access modes (enum drm_ras_telemetry_field_mode bits) */
+	uint64_t mode;
+};
+
 typedef void (*igt_drm_ras_node_fn)(const struct igt_drm_ras_node *node, void *data);
 typedef void (*igt_drm_ras_error_counter_fn)(const struct igt_drm_ras_error_counter *counter,
 					     void *data);
+typedef void (*igt_drm_ras_telemetry_field_fn)(const struct igt_drm_ras_telemetry_field *field,
+					       void *data);
 
 void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
 int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
@@ -112,4 +126,11 @@ int igt_drm_ras_nl_list_nodes(struct igt_drm_ras_nl_context *ctx,
 int igt_drm_ras_nl_list_error_counters(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
 				       igt_drm_ras_error_counter_fn fn, void *data);
 
+int igt_drm_ras_nl_list_telemetry_fields(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+					 igt_drm_ras_telemetry_field_fn fn, void *data);
+int igt_drm_ras_nl_telemetry_get(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				 uint64_t field, int64_t *value, int64_t *status);
+int igt_drm_ras_nl_telemetry_set(struct igt_drm_ras_nl_context *ctx, uint32_t node_id,
+				 uint64_t field, int64_t value, int64_t *status);
+
 #endif /* IGT_DRM_RAS_NL_H */
-- 
2.56.0

