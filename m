Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25ACECCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 10:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E8E10E06B;
	Thu,  6 Nov 2025 10:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y++sxKAA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2271110E06B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762424803; x=1793960803;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TKGn4tESsdrWKxe4pvKWRpzvlBEnLqDq1fDzQlM04BQ=;
 b=Y++sxKAA8ZZW/hlQWcN3DSKPED65ajWA4nOCWNT0FHv+FZAIOCW8REnO
 wFVt903K9cmZaQNTYExnY9z4urR38/KjTTIGDuNBL8Rb8RR3Qg/YPMAF9
 myTKCH6PkbCQwlhVR9dPrOsh3qRVkSFjs2tiyJTAKfcnNXWkCfW2ujxv9
 plNJa3Q4YIfvW7zYv7nk9D5/3fE/KGgRQ2PgAVP5ziOVgm/x78WWV/0/L
 zemUG2UMgYBtjGmMNjCZk86QYqdLubiuTL1iGMjvzrWKpFeQYhXYTKMz0
 qhExq3STSft54HS2+99Fq4fNXttfuaG7UkwFqJ3vIei2hLpUwAY/yFhlf A==;
X-CSE-ConnectionGUID: 620zntMTScy1lvBTvuFdBA==
X-CSE-MsgGUID: PfEIscyDRRyCZCDFbZDYBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="67170335"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="67170335"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:26:42 -0800
X-CSE-ConnectionGUID: GuUGRkxVSDWrVgGKLU9rVQ==
X-CSE-MsgGUID: 3kbVV/vxTUCn6gCFHqU2Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="211184959"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:26:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 02:26:42 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 02:26:42 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 02:26:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPR+5e5+sPr/u4gdKoK8GDH+QWJcEFnsDbcHKgbDtYdWzgx+hyCQ9bB7fKxndbZ6atwF6ekdZ6UDKbOutb8C0saskJnUC3mc5ZTcvYGqG9IMBsUHdFTda/NB+lcxFNwnLCNmQ63wg1wp3Tb93q6pZadLvpjU9gD0Kzcehsazj0wmm0EyviINMrQUAxLqlfQV9kVUWswmkjz5LSWwdurJQy6/e0u3PxqcVqxN2igojKig8N6K0b0fZAeqSFd55vkVqM+HEQWkoufE7FINCybCsoEqifXVpTGgL3t6wBo3TIXsN6wYnGRs301dIiq30Z12dlmo9CQGmP6XvM2Mb3XxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E46QGF/tJSnxxRcH5eKjMntpqE0AZb0RqL5HsoyTvPk=;
 b=LrPniPapCoiSpjtOX93XYq27tj6EwDdaUSubrPtlbVKy3xtvDyBgZeZaXH/eW2f/5/dBKEPcnIocNA1ZDSugigy3cTVHhNwMnxwrAbm/AGR5egfq5UwJiwUFHjgPVBcKQumJnfyQxWJ3V3B+KkQ66PFQ8kSh6c3i2Ftrbf2hV7Uk5kNwSsMY9CJ/JLdy0utywum2ak2GN4Tmk5G76lFtg43xIYoCxi2uG/2i6xJaR9iL0TAQQYdBFUyx036J6oIgxT1i4U7D4jPldxM/SmfioADSC1zGN+dog37pMxoeEOaFMWXJvHT4a+548mAGp85ANBaQ6ZHxaMPuCO+12B6DdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 10:26:35 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 10:26:35 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "B, Jeevan" <jeevan.b@intel.com>, 
 "Kandpal, Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t v4] tests/kms_content_protection: Add a test for
 HDCP-MST with suspend resume
Thread-Topic: [PATCH i-g-t v4] tests/kms_content_protection: Add a test for
 HDCP-MST with suspend resume
Thread-Index: AQHcTXPeKFr75qhgKEmJOYr7scfVVLTldJ5w
Date: Thu, 6 Nov 2025 10:26:35 +0000
Message-ID: <PH0PR11MB4806FDE4C9F909F6B8B4A029E4C2A@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20251104100908.795507-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251104100908.795507-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|SN7PR11MB7996:EE_
x-ms-office365-filtering-correlation-id: d0affe57-4113-43ab-5357-08de1d1ef662
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?osc9A8/Ptw08E4zfoxv6BV1BlavBmBsNbiXaQFczNJ91eat2BJJHeK1p7TCp?=
 =?us-ascii?Q?eJeFjJGkrU3NS4lCAB9oi0mHwmd2wRa1ETp/u/Z//lCje+QaYs/jAlpCtiQf?=
 =?us-ascii?Q?AR5xZ2Bul6xuxZc/MD+VwTWIgwE29OKuALmh6nrE7SRf0u5y8usWRCdj/v/4?=
 =?us-ascii?Q?fYKGxiswVMFCKB6eWmki6r/uKnpcGVbsgxf4NgSPKRb2Pf78iUvtURJd2W3E?=
 =?us-ascii?Q?8wki8L/DvFio2nO5n/3SAR+yAYfUrRrwm7lcbP+uJ6rltO0v0RZcmygH3gn2?=
 =?us-ascii?Q?OwD3P81HrQ66JtGNEjGnBg8upaInfNgPyIrjmDNFImnb1ta8mASklfMb20e1?=
 =?us-ascii?Q?qdbe8WAlFfDCJcxS0PDWMnoQgXsR9MD9aGBZnU//50BSu0K68+t5ITOJQQJL?=
 =?us-ascii?Q?MMeDxwhqzGyD0zJxGzSDhqOUX5Y8WsXw9PWtLDZU09NHs5ejuRhxL1Cuf5wg?=
 =?us-ascii?Q?DSlVeLZV2c4mlutC1gB6ctZGaNvYvJ4k9vFiRGXprjusCz4g4adHqeya/Hsy?=
 =?us-ascii?Q?wtu75A2wVWca/JKsT/Duwd2pQeP0u+FgimRAdVQ2oNQMnW+A4CK4HrTmjGMG?=
 =?us-ascii?Q?WdOmyhbphTx/iPna7qF7oyaIJWpm8NubMDbjCrWaat8udfy8X2Dk5vUP53wc?=
 =?us-ascii?Q?6eIcD4Q9IBYswJrLOEly2CDVZ1+ET936vzxKd6dAocQXUT16c1Gzz8urV7Re?=
 =?us-ascii?Q?3N/JeAoNBKjScLmJAy34G4mO+2sNQCzTuF/5kTOtqEg7Xc6rO5AmHKVwvLqn?=
 =?us-ascii?Q?4wxvyQjYRB0bM1Dhv9SgZ0ui/cL6glUyaDW80WeQgK2Ri0mYhp6zV1kAozVI?=
 =?us-ascii?Q?bVw9b5JAruPSgumDY0sj6LT0cuMCY9nNL2RL1aJHrlY/beMqTZK4dsu66YJ/?=
 =?us-ascii?Q?Oke3D5Kp3xzZQh2mBHdn5icFrmvX0TZXAp6qpErFk/Ohbta3pE+NImNq4kgq?=
 =?us-ascii?Q?DiFg4UaEI++QA/dOZEs0C0hEswUZOOlqC6SBHzW0637qwk5XgaMnIyg1+sb8?=
 =?us-ascii?Q?e0hhvjbUPsm9W98JjXf+FpiuK97EqZwibFEYPOGgs/yHQin3fwYLQsOfBxPk?=
 =?us-ascii?Q?JdMFeeq8StG/lreP2PbMxsUblrvhcGsb+3KPamkWEQWo0XxMLiNZu4GU0Wgk?=
 =?us-ascii?Q?zyvQjUNpbHE0BCQ8o9DkET9R6EXHwHQTNMEKbY+czlUjNiIp+XbsvdwI/XeU?=
 =?us-ascii?Q?uvOLUMHI5uAXegirLdq1PemAszhFxmX8VFcYa536ouDNBDN3g172pMeEiYI2?=
 =?us-ascii?Q?5hyGC1e0THLVFGbQon6be9Z5SVP1LVGuq3xdzBS1pGFJn8qSdRxgFep8QVuo?=
 =?us-ascii?Q?vhsuA3uwrg/pI22ZajlzL0ZJuJhiLRawCHECUwe4fW2NqP60Ypq1r/r+DSMN?=
 =?us-ascii?Q?8fHqmG+zP+jhQVY9XXip9PNQiu1T1RK0yA+fpaNytqdjvm9/u25w4BuGGJ8p?=
 =?us-ascii?Q?sspySGkx0AunbVH4fYsuVBogu36jbJwU0VLAILlqo2gNyvLnneYOQ3R4n3UE?=
 =?us-ascii?Q?C05LizYUu4t3i2j6Y3SAFf9JzNrDs+sjvjmr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cR9jEgS2uYk86WE0w/aKoJ9rjHCwF7ZTest9tM1cHB3dzfjvvr0QTpXFTYAM?=
 =?us-ascii?Q?JVDvZ7UoMpL4rFNTEIcup0tR66zfPKPiqZauqfE7bqM0Q4enIFtuk6qUHlXJ?=
 =?us-ascii?Q?0aLPB6RR4nU1fCMjb2ulc5eQqRzKgYWPeYYv5t3LiBJEEsG5oBLANDJ+Bj53?=
 =?us-ascii?Q?lXlupTG9bTZh4uP0YgLjVdnV4nmvJhMq152vGgzQvHfK95PH2obWlDVf0Fch?=
 =?us-ascii?Q?p1CHsklcLMY3dLRx+iMQ4a9CQX/J2UnPTQmp5YIyKm3W90VfZNRNiLMFYSIo?=
 =?us-ascii?Q?lc7hUujEyDrAWFWsv97ymtfIouxViJUTjxy4+wu4eo2cO1yxCDiGNgaBa7He?=
 =?us-ascii?Q?kjmxZ+gQKBmJ1wNTAQ/Tof9+dzdr6PFj9/xoucmnG1xe54VCkjT9racnn25U?=
 =?us-ascii?Q?E8uX7FPpuNgxkBitHX0VjiMSyBXxWtw7zEZ0tB0vieGwiVeaQ+P1Rhrejwzq?=
 =?us-ascii?Q?qf3ykvilY/Mu3VR99zDYGYQS05oKfHNQpDEf/x5/ueXmOU8/0Zw32sZH0IE/?=
 =?us-ascii?Q?0RARSylOrsgAOpfnACWFtxmfb0UQu/JNcMGdCxSLJ2ol3QGXSN5PuWowFdc5?=
 =?us-ascii?Q?i13jLq+IA65sKghHZyI0xNqX4VS3+tHWOb8W8ZKbQEe+z1SpW6xgdjMUtBap?=
 =?us-ascii?Q?WJDWS7otgAiGaQZKwUmuP62zORaUqVnRN2AkNPHJXOp9OboRdFSHXo3ArEim?=
 =?us-ascii?Q?oQ51Amb7SrjjAb/MIyQVbXiKcWrRFtviStji6tE9dxvoRa8p8upf5XJx1W73?=
 =?us-ascii?Q?se50n+OOPMIo73GZSgScPSByOnFSTiKOeBqZyzmZ7q8Drse4wFmFf89EENGU?=
 =?us-ascii?Q?UOfWqYQQrVGO7GEy8if01NHsTlHI2sUZhE6RPCkQRKgzGKMaQAKmKiO+DSAi?=
 =?us-ascii?Q?+8unD8Q2V518Bgflr/rpovAdGVpa4zitKxaSqRpBrgxH9uZB3ziomh17SHrU?=
 =?us-ascii?Q?Qoqp6KkaqMVMCfhBeZBY5ORxk9Z5oPCLxNfdD9UZdUy7aWWoxNRR9QBMiOoP?=
 =?us-ascii?Q?l7aEZArF34Of3ZcBWFpdqV1NuRolrhGqFtZoJXGawVkL7QGdun36c78+NzJZ?=
 =?us-ascii?Q?dVzfwfikgfgi2049lky6ACG97DngIhJuP1IP7dOper5Iu9LQOmZsZIFOcyPP?=
 =?us-ascii?Q?s2PL/V43c14/9vUsj9BV03ac/ddlNDr+oL9xCJps+e9HY4FXqhTnTntA3oYh?=
 =?us-ascii?Q?QbGfUalfFsl4G1iPocbDZ9loiUvNtxdXLP6YU2Yn8/Gf9n1QTLQ/fdWDVPlG?=
 =?us-ascii?Q?0zWg+R2KUCksOfC0sFcPw+k5STUC/lM7P1vNXLYQ8vv5IZxEghrw95dSWQ/z?=
 =?us-ascii?Q?jX3ge4FCqhF8VdUwzfNQSTrrRd+zP322FK3IqoOLJgZrSFYovSM1AM7Zogg4?=
 =?us-ascii?Q?EHdBnC3Drjin7JTbPZaUR5GHs3qXDLERFx4anTLwJ4ESydRymT5KVOSOzK23?=
 =?us-ascii?Q?ohp3dD7uqJe2Eg3v6yAp2CDdEvpx8I0BzfjSCa36WIREDnRkuKRHikzd4FL2?=
 =?us-ascii?Q?mQLCk6gG5BkKa2t0ciHbhYOSesD5+np+8z/VvxlHb8opX+71eDgJoXUQtMjo?=
 =?us-ascii?Q?j2w4arcxlq4IiTWPJuLMm84DJRRnHq/CMa1Fjizs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0affe57-4113-43ab-5357-08de1d1ef662
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 10:26:35.2487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2tV+uVdPc2/HpQBdKCkEZlfIeMR4Nud8zjNOFrcA5RSiY6xhdSmwOztyL2YlQRA+7bThuGXHBmf9jq0UmHJfOYwx+VRCZPT4lPDLyBBAcKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
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



-----Original Message-----
From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>=20
Sent: 04 November 2025 03:39 PM
To: igt-dev@lists.freedesktop.org
Cc: B S, Karthik <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>; K=
andpal, Suraj <suraj.kandpal@intel.com>; Thasleem, Mohammed <mohammed.thasl=
eem@intel.com>; Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4] tests/kms_content_protection: Add a test for HDCP=
-MST with suspend resume

From: Jeevan B <jeevan.b@intel.com>

adding new test to validate HDCP-MST with suspend resume test check for val=
id output which supports MST and HDCP then commits and check if the content=
 protection is enabled before and after suspend-resume.

v2: Change type-0 to type-1, try to authenticate hdcp few more times as sug=
gested. (Suraj)

v3: Add a new test for suspend-resume non-mst.
    Added suspend-resume handling to existing mst and non-mst test paths
    Updated test description and documentation.

v4: Remove commit after suspend_resume() (Thasleem)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

LGTM.
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

 tests/kms_content_protection.c | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.=
c index 2422793b1..575426e88 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -74,6 +74,7 @@
  * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
  * @legacy:         legacy style commit
  * @type1:          content type 1 that can be handled only through HDCP2.=
2.
+ * @suspend-resume: Suspend and resume the system
  */
=20
 /**
@@ -86,6 +87,7 @@
  * @lic-type-1:   Type 1 with LIC.
  * @type-0:       Type 0
  * @type-1:       Type 1
+ * @suspend-resume: Suspend and resume the system
  */
=20
 IGT_TEST_DESCRIPTION("Test content protection (HDCP)"); @@ -104,6 +106,7 @=
@ struct data {
 #define CP_MEI_RELOAD				(1 << 2)
 #define CP_TYPE_CHANGE				(1 << 3)
 #define CP_UEVENT				(1 << 4)
+#define SUSPEND_RESUME				(1 << 5)
=20
 #define CP_UNDESIRED				0
 #define CP_DESIRED				1
@@ -480,6 +483,17 @@ static void test_content_protection_on_output(igt_outp=
ut_t *output,
 						  content_type, false,
 						  false);
 	}
+
+	if (data.cp_tests & SUSPEND_RESUME) {
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+		ret =3D wait_for_prop_value(output, CP_ENABLED,
+					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
+		if (!ret)
+			test_cp_enable_with_retry(output, commit_style, 2,
+						  content_type, false,
+						  false);
+	}
 }
=20
 static void __debugfs_read(int fd, const char *param, char *buf, int len) =
@@ -822,6 +836,17 @@ test_content_protection_mst(int content_type)
=20
 	test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, content_=
type);
=20
+	if (data.cp_tests & SUSPEND_RESUME) {
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+		ret =3D wait_for_prop_value(hdcp_mst_output[0],
+						 CP_ENABLED,
+						 KERNEL_AUTH_TIME_ALLOWED_MSEC);
+		if (!ret)
+			test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs,
+						      2, content_type);
+	}
+
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
=20
@@ -842,6 +867,7 @@ test_content_protection_mst(int content_type)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);  }
=20
+
 static void test_content_protection_cleanup(void)
 {
 	igt_display_t *display =3D &data.display; @@ -950,6 +976,11 @@ static con=
st struct {
 	  .cp_tests =3D 0,
 	  .content_type =3D HDCP_CONTENT_TYPE_0,
 	},
+	{.desc =3D "Test to verify the behaviour of HDCP after suspend resume cyc=
les.",
+	 .name =3D "suspend-resume",
+	 .cp_tests =3D SUSPEND_RESUME,
+	 .content_type =3D HDCP_CONTENT_TYPE_0,
+	}
 };
=20
 static const struct {
@@ -978,6 +1009,11 @@ static const struct {
 	  .cp_tests =3D CP_LIC,
 	  .content_type =3D HDCP_CONTENT_TYPE_1,
 	},
+	{ .desc =3D "Test Content protection(Type 1) over DP MST with suspend res=
ume.",
+	  .name =3D "dp-mst-suspend-resume",
+	  .cp_tests =3D SUSPEND_RESUME,
+	  .content_type =3D HDCP_CONTENT_TYPE_1,
+	},
 };
=20
 igt_main
--
2.34.1

