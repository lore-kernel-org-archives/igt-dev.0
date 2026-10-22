Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F660606A319
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 05:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OIwx/nHl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EC3112365;
	Thu, 22 Oct 2026 05:53:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DD710E0B0
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 05:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792648370; x=1824184370;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q2NACGs7y/5oM9ZDI/1uYe/dz0kPfcDxIrLPRwNaF68=;
 b=OIwx/nHlTqELLg0tm1Z7q1XNpU/vpOZkIzWI6g1Mo6aLJzfMzZUwd3if
 B87vrLr8w/BRLGOHt1lvrtRxXguP7hqaMd+lEbp8y8BpyV/lXEZedWrq1
 PPA+VPrO2HSo8YE56a4Y/PrrST4cVBzlruiYuC3te7wxaie3cXWhjwLeQ
 r/H9cVjKuNVEUQ1e8c/lV7aBjYq53yQdZokKQA1WjBWHKN7/dqEZfSgJe
 FCsJfYDiP8kBu4CBwXDmAdetgVVWpsQeKvh+7D0t1Z7MnLD6kqkr5xGhX
 nQVprT0jWXDIIf9lfA5oSBQUpkVmlQJIIgX5dkoRGxyybMERHFSLAYyxq g==;
X-CSE-ConnectionGUID: MmhNhIRfRJ6J2bomCHJnTQ==
X-CSE-MsgGUID: XtL9jtAMRIqKoIPgDEzNfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1263190"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1263190"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:52:50 -0700
X-CSE-ConnectionGUID: LAVu60R9TuCPOcB4YftMAA==
X-CSE-MsgGUID: /DrvXpz4QqaHklhOEznLQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3220589"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:52:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 22:52:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 22:52:50 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 22:52:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X16kuHCsbCK9Hg/UOFKZpTMxuZcLBxzWZ4NdO+D1N1Q3bbG5E10XX3ZULLY6KiBuH1BLHNZaa16Im4ZQPfF/aUDuQLJcbKNeIrAofM3Z8QdBvyHZcSPWO+liER/rv+//Ro8X5xx8rfOL0SwnAiO92k+bLVEUBGyrYQJakR9WxuR3ffap9kowCSaePNSbcZ+gl0j9Xk/ziW1xRhaTFTyOnCvx2hi2jb6W1Mr/ascXcZ08nJQGRtuj2CpBcZJ5yl6b+j7Cg8LaYT8b/X6zpxgTctlZtHgVw+9ylN00JJfIVMqpCurtGKI0MmqP5Mg5+mRu1m0AQ9c/acCQxgVm/Qmfjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rt1elnmZ5fPuPp/wDa5MA7guWFv2iAhY4hPg47OiUNM=;
 b=nsrO1MWVCmEZ1skpcMR4yzh7NzeQQOlk7xcc+1G7SPialj9trvRSNTM9egrEP7KI6+zwxAxfRKI9uGsBMJIogo44Ciwr57T5eSlMUd9JLTYX164PUXHXp6LmzWdivXFnitms4IXIqmt00hKvbDwHEs5uOYu3RyOj12SMBNkcgESInphwz6YD/nduG8Ws5mYBt4EHvcxkdlOR5t0Ov50jLP5IK8WySr8rhkLtNDA8B4U/dgffSIwgAc68Oa04D5oNaB+09IHCkRoNVGOWMhxnpPyxgPskvqRv5SGa3AP2u8JK/US5XHN8zAhnUmixHA7hJTnjBWLEjJTiR7rz1cP4Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN7PR11MB2595.namprd11.prod.outlook.com (2603:10b6:406:b1::24)
 by DS4PPF3FCD980E2.namprd11.prod.outlook.com (2603:10b6:f:fc02::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 05:52:42 +0000
Received: from BN7PR11MB2595.namprd11.prod.outlook.com
 ([fe80::b0e:2ba5:7120:cdd9]) by BN7PR11MB2595.namprd11.prod.outlook.com
 ([fe80::b0e:2ba5:7120:cdd9%5]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 05:52:42 +0000
From: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>, "Balasubramanyam, Smitha"
 <smitha.balasubramanyam@intel.com>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Dandamudi,
 Priyanka" <priyanka.dandamudi@intel.com>
Subject: RE: [PATCH v2 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs
Thread-Topic: [PATCH v2 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs
Thread-Index: AQHdVuViQZw/bIhW5USWr2uFIsNYn7cJJLIg
Date: Thu, 22 Oct 2026 05:52:41 +0000
Message-ID: <BN7PR11MB259593B8D2D531B087E84C91CD652@BN7PR11MB2595.namprd11.prod.outlook.com>
References: <20261008052450.42805-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261008052450.42805-1-shivtej.eknath.patil@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2595:EE_|DS4PPF3FCD980E2:EE_
x-ms-office365-filtering-correlation-id: 143d4508-4c78-47d9-14fa-08df3000aff0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|38070700021|261009223027099003|11063799006|10067099003|18002099003|6133799003|22082099003|261021121427099003;
x-microsoft-antispam-message-info: 6TxU1Zc11vR5KQGtP7f6xNT1Q5t0le6+fYEPPHe71Eov1enkG78c6e6jW9J1EanKgJp4GOR8hwPRkWAKfm2Ba1llguEnlwQYk3ObOR9NwZ/sfsFNLZ/Fd9bzg708Kh22pCR4l+xcKaqASskvEu7PmtKVYETq3mTXtC8BvsZj7UmvAReW/tWWiaqBVNfJZyvDV7Br7A29X1KrYlGwQ3uLdVp3+FS+YHl7RnZei3ha+7dJjnsxeNyEFfSWlVq8QTV5l0qzTWgZwH7lig6o9Ak3mnyaP+CQI6WfzIAPZouoOzW+f2/lBjLOevltFugD22/Qua0wIn+WNK8YJbMWjPLPNkypPDnj9KIYJftchdBOmNpXFqbpgU70gA073iHBFFsPWxv5XJIGIYG4yrwwLa59vHWwTSL8xipSbLLKBGU17MYKrfo9ZTwHONmsTK0xHlWNC4ytemOhJ42dCgPuj6j7FRHYW3ZPtXs4moSTTJ+oKEpSLE/H2sK+88Bc2Jijs5AKxMukDr9MPys1OhJRq/LsXfPri2LU4AnVdXpWcGtV1RZBE/i2npmgTBI7z7JHjAKpvQZxZZXzQGyl/t0X4RqpBP9McperCTRRs4ORThUPi6xrjZCHU0f5takw/HFIp889Afu21MUIx/afOpWiSK1MhziAETSePmYgDmpPVXxsCWlN6XZxHJdzvDeeHEY9cBurgPzYLV4PADm+vKu/3pNErLMXKf7SLUhohQg4TB5KuFM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2595.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(38070700021)(261009223027099003)(11063799006)(10067099003)(18002099003)(6133799003)(22082099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N8nbMNMfFJWoSoixBAL912HJ3W1F0wwHPCiTC+YmjaTSTSLIuvWwiCZnz7zC?=
 =?us-ascii?Q?jJfZMauJhbMQkSDqZxNzM2dtifYL81AO7CMbDV7zJWRaNj0n48gaGn2hmoiI?=
 =?us-ascii?Q?D5Qkf9lMoprRcYPTVEMBsDkdcBfV9EajFz99ZfnE1CUfFR04ClSM0JgrX403?=
 =?us-ascii?Q?FPJzNVFVztKwsTUY41jWnntq5ngQoo1C981Ygk4rkT+DsHB7AOH7LKT7Q/Sy?=
 =?us-ascii?Q?AacV7jHO/FNLW9uD7sSw+Eq3jzzSgUwNhh1W14UC/WO5SYMSDBaQTFU9ELGz?=
 =?us-ascii?Q?yFqJWK+BgX4Xieeo+mFeqqq/96rDsFg9GKVKQHcMnzBPpJ77AGCA/UZbgImt?=
 =?us-ascii?Q?wZW3WsWQE2Y1TC1GQ+l25zFrGSL//iuWDIBL5hCKQqKuni/LOqHbQZFEIqaX?=
 =?us-ascii?Q?ShdLw2fXOXyk0OghS4+pc9psPRbRXp9LFJ1Je4llEHPtETUT2LDejiZ2vJQH?=
 =?us-ascii?Q?vIJlx8J1LJYk5/zNTxV2ACjxadkRAW+o6ahIqLpMcSpxL/4WW5MB1pX4MCq1?=
 =?us-ascii?Q?n306bviSukcK653lTUlmxHtUdQndjZ4WDo9Y8WwuxTuOZyGL7Lxqkz/EIV/Y?=
 =?us-ascii?Q?tg9VGe1M/jR1fiIqncO5QCnONF7a7+RPkwiB0gF3fJYb/aqCst8/KeiHrm8V?=
 =?us-ascii?Q?Qcy8Rx4stpXUgORy+SF3kJzhd5TJX2W1ygcbPmvsAHYakKarm0Fy+KeHIGeg?=
 =?us-ascii?Q?tXmMehBQE4I1MeHmwWCDE5E0onsynshZO65PgUOMn2k90cVP3U7NmITarPxH?=
 =?us-ascii?Q?qsnybx/flJU3ZTA59G1vjbz7852fTMBVccA5LrFzNl9dK/oNflGBhxI3V9J4?=
 =?us-ascii?Q?wToiNyxr/mq7jekpCRhhVzEB9uhIYnxpuWONmYO5aXDI3FikL9YRi4rMy0EY?=
 =?us-ascii?Q?CH67SikdYJkq33z/pqdXNCzlI/CyhVJ+muG5ynITbz8ciZgoEZutwCa03zrx?=
 =?us-ascii?Q?lozzolTfRumjgm/rdNQA6+CH+a6V9yBP+Iw36wrh2vySdD6Fpy5fch/siDnw?=
 =?us-ascii?Q?yrWy262SYdSVMFpRk4YGYhr3KRKdMfrmZ4t3m/u86Ts36VVIum+xJ9uECiuK?=
 =?us-ascii?Q?cPOvIq94HBJVTb5NM/VHvnzCJID4XpppkfnJcvw24EHDD2sDvqfEfJE92H41?=
 =?us-ascii?Q?X0OcOwJmpskkLWWJe/zdA0TzS2uRzlx+7KWS4aUirPTi/UtL8wgvdq/EetIm?=
 =?us-ascii?Q?ngRF4aVSGOrO9373Fz1H0jcZEt9jQSPjN5RJpqlAsNV9lsNFdjA0Q0IUj3dY?=
 =?us-ascii?Q?BGGo5w15R8efs37m9EyoMvd9pdkzwS6cBKvPynmAaxPVsVwWr6dAJKI+iBJx?=
 =?us-ascii?Q?Vw0yLgWv1eOo+o31s5bpjNUGQg+FUwULR0tZUmIyKLmhEr/OX0eQvSeH5GpG?=
 =?us-ascii?Q?qyBuOEFh/F8uaQiDnyZBqD7N18AyilRLKwZz4Lo+45reDTvF2gHGOutW51cq?=
 =?us-ascii?Q?u4rURwk1nFbjc2xp3seZQdDZG+umDWyXfAvGZS3M9lhVg7kWDdzrUTbs6maP?=
 =?us-ascii?Q?aySRIxNCSfEjAl/boFk0GoXEHMP+Zu3R6/LVhQYIS0OsD4TVrbe5P/iV5R0u?=
 =?us-ascii?Q?N5f/VDYaHSpl8c46tArkVB9Xw7wcseSOCZxPYtZZtDmR5u8hVxP8uvqZy5UD?=
 =?us-ascii?Q?uslq+FmyCxmx8ju1ZYhyAwCmLnLUX/8AiafdtEQfSVXhS4yZsKPs5pnLogkD?=
 =?us-ascii?Q?68bZ/npSq3C2i4RGYRBbCdhifcamQj2yVsK5bDZa0IM6Ahtiy6VxSlYLOYNa?=
 =?us-ascii?Q?8jOLuk9lD0ygKQ+GIs6AqQI44CCjZGo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nC5clYUm5iWJVpjcYWfYGhvQ3uwozGvIz2ZzIehID4Zj7n1RN4iB3JfuuAZHeVdnGutKQ4Jxcl8Q91/jALqQn8yDcqnPlDT+dzMWW79BGmx/pLkfEDj/D5Cba6Xk+RlHz20+ZAXdczvmcgB3BZv6e3x2Bja7wfBi3f/BS6QOGvZzqWYMlyJ0wpvD6NA7owr4UIyaQ0U09QRn3qTmvxBHlwYlVOIwAfclcSncEt5Fv52YUYAPemTZ9TPxWJKtlMj6XF1mwVBYjhMvJUJ3AVFwC3LqCROpSjOcy4dRjmP+XJmRnhyTiCaP5vMG71/9a0UmWQrNf+tpTojHE4kr5ra3qA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2595.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143d4508-4c78-47d9-14fa-08df3000aff0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 05:52:41.9562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UpG198QghVjh/JI5GZvqeKz+8HHlbgwiECM38E3bVXfghiWfmAu3fZ5Q+b+MvorfV4UmNYyecVIfUhVAdwGSaKE4oZFPQbinJycsI6p/JXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF3FCD980E2
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Please ignore this patch.

Thanks,
Shivtej

-----Original Message-----
From: Patil, Shivtej Eknath <shivtej.eknath.patil@intel.com>=20
Sent: 08 October 2026 10:55
To: igt-dev@lists.freedesktop.org; Konieczny, Kamil <kamil.konieczny@intel.=
com>; Sharma, Nishit <nishit.sharma@intel.com>; Balasubramanyam, Smitha <sm=
itha.balasubramanyam@intel.com>
Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Dandamudi, P=
riyanka <priyanka.dandamudi@intel.com>; Patil, Shivtej Eknath <shivtej.ekna=
th.patil@intel.com>
Subject: [PATCH v2 1/2] tests/xe_pxp:add coverage for xe_pxp_debugfs

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

Add a new test to exercise the following functions in
xe_pxp_debugfs.c:

- pxp_status_to_str()
- pxp_info()

The subtest verifies that the pxp/info debugfs entry can be read successful=
ly and improves code coverage.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel/xe_pxp.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c index 5460bf6db..7=
6a3939c0 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -506,6 +506,28 @@ static void trigger_pxp_debugfs_forced_teardown(int xe=
_fd)
 	sleep(1);
 }
=20
+/**
+ * SUBTEST: pxp-debugfs-info
+ * Description: Verify reading of the PXP debugfs info entry.
+ */
+
+static void read_pxp_debugfs_info(int xe_fd) {
+	char str[256];
+	int ret;
+	int fd;
+
+	fd =3D igt_debugfs_dir(xe_fd);
+	igt_assert(fd >=3D 0);
+
+	ret =3D igt_debugfs_simple_read(fd, "pxp/info", str, sizeof(str));
+	igt_assert_f(ret > 0, "Can't read pxp info debugfs\n");
+
+	igt_info("pxp info:\n%s\n", str);
+
+	close(fd);
+}
+
 enum termination_type {
 	PXP_TERMINATION_IRQ,
 	PXP_TERMINATION_RPM,
@@ -762,6 +784,7 @@ static void test_pxp_stale_queue_execution(int fd, enum=
 termination_type type)
  * Description: verify that submssions with stale objects/queues are not b=
locked
  *              if the user does not opt-in to the PXP checks.
  */
+
 static void test_pxp_optout(int fd)
 {
 	__test_pxp_stale_bo_exec(fd, PXP_TERMINATION_IRQ, false); @@ -1157,6 +118=
0,11 @@ int igt_main()
 			require_pxp(pxp_supported);
 			test_pxp_optout(xe_fd);
 		}
+
+		igt_subtest("pxp-debugfs-info") {
+			require_pxp(pxp_supported);
+			read_pxp_debugfs_info(xe_fd);
+		}
 	}
=20
 	igt_subtest_group() {
--
2.43.0

