Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12790CCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 12:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93DF10E5A2;
	Tue, 30 Sep 2025 12:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzx7RGEX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806D210E5A2
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759233663; x=1790769663;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ng3VWu4qzfTqp9/qlrSPZKO/0h9TImkHE9+YU6y5blA=;
 b=mzx7RGEXqjZwF5oNN3gZd5ik16rsf2DOzkqLt0jQzvPj+pq/Fb8tX6ML
 c7C+xoxJV/lZ9k6+vKh1dL2UZ9P237vIL6G1UnwJ1z/o+yzpe39RcFA/z
 UPjgAuYoL2C4XEX6ftfAdijMv5tCbThXUCUwvNWKQSRu1cnxKwD2lAS8h
 9xfxIpbGTDaVLAV8R4UEeH/FsAiXFCLFiU9G1/yQjJ+jTGTOm+agXwwn2
 +xH3DAJF+LKrtj5tc3KqyQFHsptzjRt6VEivvI4k1ZisekkNn8XYwR0hH
 DFxzMkXLQ7Im4cZ4B5u5GvAqYDJHu4Bhcaq98Ud0bFTHN2ilem33bFcIW Q==;
X-CSE-ConnectionGUID: zy1l/slMRIWPpoyetHeYNA==
X-CSE-MsgGUID: unwj+RBvQtyQ5sH/RH6d7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71735078"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="71735078"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 05:01:03 -0700
X-CSE-ConnectionGUID: h/K0QZEYSwmpkkU105VRUg==
X-CSE-MsgGUID: bBjWeGDWQZ+/n0cwii09Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="182926261"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 05:01:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 05:01:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 05:01:02 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 05:01:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnE41MUuJfXRNCGkU9e4iA+gTfaGDHyh9jdn4c6ovZuuTh61B+EK9IommudAf3JuSnouNUugeu1VXzluE+O9pcjNwtJuCbYq38u4LUVUppk4WeCFHNcha/3RAt6jOs6CenG1w2gWD/oH0RuKKp18wQiKeELRbkTytrse/oC2gnxyOnM7pUGg+X2G/1ZOZVM7KD0bUrvkS8QpGG7tuDZeFyW9zZB89JvlbiZnc9EF1TgIYzkBtMaJuo5j2mTei+IyHNhZ+gXTowAxTRjWpZ1Hg4Qn9g7N8xGTqY5ZkU+kX8mwYSslenYmXuZuBI8jFzhkfPYo3qYU5W5/um29wpJ5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAQMySyk8Gm3a+6bFmHVWiBSe4dcQAedrEsrI92Yh3w=;
 b=rDhEClVlg9xCNc5b8mge+REnO+FUw334vUzwJFBrw535UheCNoKi5XFCG946Yh4giJncySm7otHYDYynudDWOLrZVeZjHcviTyp3LscMXS9WXnkzwnzA++WfeD1EMsrgi7dZp5bZ0yOmKZUcqEqetVw1rOC8SRAVbe9xNczhlOB8UhqGMtYR3IjtPTZGsCL3bSdEvOmVJxeGM08TmfJWZNbrmyL3bXkjFBhrkJYyJccoWQJ6EBNfBoZ0hVx0gCLopFCNesik934doOKQDLvqlvcHU2ztTnD9tSz/X2jNepwp62YI/1xCkaVm6Vdki12jRiVJ96rBx0+RXlcnE38vDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by CH8PR11MB9484.namprd11.prod.outlook.com (2603:10b6:610:2c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 12:01:00 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 12:01:00 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v1 2/4] tests/intel/xe_noexec_ping_pong: Create
 basic subtest
Thread-Topic: [PATCH i-g-t v1 2/4] tests/intel/xe_noexec_ping_pong: Create
 basic subtest
Thread-Index: AQHcKYemMMw5rn0EFEK4xacFq4h8MLSrsFfQ
Date: Tue, 30 Sep 2025 12:01:00 +0000
Message-ID: <PH0PR11MB4806A55D4EBA8AEDD5409DCDE41AA@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250919170510.154992-1-kamil.konieczny@linux.intel.com>
 <20250919170510.154992-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250919170510.154992-3-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|CH8PR11MB9484:EE_
x-ms-office365-filtering-correlation-id: f2aa054f-8c10-42a0-2378-08de001905f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6VC23ciXO/5EyiwPrljaTjnPvbQe40tekYsDl8bXP7/KAlhIU4STCHiz30dw?=
 =?us-ascii?Q?kpLSamR4C1YR1Eusxq9UIpf9CiqL5smUOACySXxBZVKDFGNmOal05vGB5NC4?=
 =?us-ascii?Q?n1TrbSXxSufxs1Tk5YTl2SSEnTgsoGmc7UFC+jWWPp44ZL8+6V9m5RgCGXsh?=
 =?us-ascii?Q?V9iQULvAh4hQcTDImFPImGmPftzMY0ZR8Yr+Y4YksJcDY2z5rqvC4tcnXmsM?=
 =?us-ascii?Q?xoVMdt9m/yVmBprbX7Hk6P7cmeIckgDvu0VsDFFusqHdM7POosg8YizwF/p9?=
 =?us-ascii?Q?vyJEpEeVr1Fxhdlq/slAmOkJaLfP9uO+aIW41GeR+taGwS6f+z+ScOpEJwq1?=
 =?us-ascii?Q?E/Z33oHMI5qfYI2cAt4dsjm6aK+Srpi3DS7abQYZ8Da6LrEOLQFTN7biaaFs?=
 =?us-ascii?Q?1AYDb5Ai91HGqPnCCw4TD6mlkNIFvt9BCo0BYreGM7cmj28L7sJKn7BkJskg?=
 =?us-ascii?Q?Tr4voL1Z6a2XfR8hDTYE/mIg0kjfoIN7OG/TK1S3Q9Ceul1AMHud79HKOATL?=
 =?us-ascii?Q?MdORYNhCGgr4l/5niQ3I5OV/yHMdOVbYUF19ikX7Igv2M/3TtuF+RNT5Uj+Q?=
 =?us-ascii?Q?qAs/EXm6CTQzT5X+o9Yl5cP+noBuPwVl0BLWQsXTZsxKFMSPnQSDz031367u?=
 =?us-ascii?Q?Z21ntPii1Aubt2FnBMITaqMtxoWin5jfprmTKZ3EZ2rR2pD7/D+JDrphOLu4?=
 =?us-ascii?Q?gpvLlIXgxuhYOZqSaVXU2K2x3lGv0Ly+CL1OGOdgZN9q2sggkPLanNZRI1I+?=
 =?us-ascii?Q?bOV3CyYNjL1bstUZnSIRdJypqK1B3j+O/71wWfT75undrO5oPOX1D1oOqcCN?=
 =?us-ascii?Q?a7BsdKl3DQZul4MeUpMLmU7lFlRyymx6kjKrE3xGB+2K2nCKGcdL5w6inbe0?=
 =?us-ascii?Q?A56BFlHOTkLW+b+4WFjwA9Vnf2kZiXyEdTXmMCCk9FWK7cl8aJ1EgV8q9jFr?=
 =?us-ascii?Q?1M+Bmz2xl689XHhXU44kOBNvsjeidnlOATRi1bs3XKw0s6ikuUS2UDq6reyN?=
 =?us-ascii?Q?3AzAU1Pcc/wS7EWvLfoyUNJXmLKQXzBzSoxJxnNp0/fZ3UGdWYlHrdCxfiNi?=
 =?us-ascii?Q?AzdVY1afdFElZlIzZcjq1XZmkONxQdae474po4AN+dRlrrowLKqCa1BNpVGF?=
 =?us-ascii?Q?K0XEK4uyT1X51XkltjgacWWFzBBmKYNdeJq3TGHCy6QahMgWUsU8b0rvQ2Bp?=
 =?us-ascii?Q?pZBsaFRvKPRd19kLZ0qUZqA4gy4J3WPYlSwAYw0inxbN01uvK20YhLK1zkoF?=
 =?us-ascii?Q?QFzb40IX3Wq03XEBvxWwRrEA0DH2sYPabj76QBPrdD3AFSuqeIBBDJnIa0/u?=
 =?us-ascii?Q?zlvfVw4hA1nol0/+z5xBAj7suQlb2nnj2ICGqOcHjycMLnnItjK2RDtN/n6t?=
 =?us-ascii?Q?IIM+rt3RuuM++aU7vfsz1kpcnI70k84VIDdgEzx/sR3/w8MtlkWV1AU8ettB?=
 =?us-ascii?Q?M9+7J8jTMk30CUUXdVsFCv/3uIQ0MvoCiVAF7Lde/GxuUNnWAgLLaz3GPQ1Z?=
 =?us-ascii?Q?KtjOX+gsE3pkmP/p/k04PZ45jessSkUhgEU5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b221oiSTjkWX7pBVBFk3mocHwNFOFhqTg1FkV4p5XmQ46Bk9o0ef/ZwuU+Mj?=
 =?us-ascii?Q?KPDYVp2+jLB8cWtpQ90RjSGpnirNTXpZCcjRn0lqDERSDbLhGFqTsZHqW19j?=
 =?us-ascii?Q?uuOOmfJQ3LFQcLlINK99b4BjlW1CgrIWpJ9Lp/1psmJfykUqpgz2vM+2YTlo?=
 =?us-ascii?Q?K1N6QokxbYYgWG7L3pFqJ0RRAhiq2GulbGyFSE2vRyoccSPjkG8EZ7dtgdEO?=
 =?us-ascii?Q?ThSvlm4y2D4YSN8EftBhdD6fI9fGBRm3irNgIl2R6WEqQegc0+KG7vxTxUbn?=
 =?us-ascii?Q?7ZhfOkxLQUNDagWv13M9HNT01IGRGwXBhuwdV0aG29Wr61sz2ruaISFPwEYD?=
 =?us-ascii?Q?R8qiozo5QVojBE1Zn/HnSOcqtUAVpxUrZpVn1plLjdgjkTuPo1NEdK0oXyBS?=
 =?us-ascii?Q?Q0h2YrLO7X7tbFam2niVTOT/SRT8rPfTQG8WqC/FshKSi3kLBd3HtMmvjFKt?=
 =?us-ascii?Q?F6pTAiu8JxPuDTwR+rHy/0YvLel78f3VzFSQdUEsam+vj6/KHdIzpNpr1au7?=
 =?us-ascii?Q?j/EiYtkvnJaB50pbdx4ZV8H9ob0OaObWEQAl/D0zWTCh5FkBC7sWnpJ6jFUP?=
 =?us-ascii?Q?ZD550qRfwWeV436qa3YawgNR+7dZu47Rh/3w46Lc3bYXqT/SVdS3Ub+T1TtA?=
 =?us-ascii?Q?JgUb8IwnNSypEEjr7Jr7lLqgN/PV2xWodJF8dZYQ+kCHzje7eMy151lmNoHE?=
 =?us-ascii?Q?cVLvBaB4si3ShaPhUhBfKxSkfePvNz47CKVayOwF+xtwpWnBMCu4nvM7vz/M?=
 =?us-ascii?Q?Dgsc1AomM9s4Vpev73NLFNGqZwh/SKLsjP1SXivYBP9gdXCl22AcPkYv9OfM?=
 =?us-ascii?Q?i+SwqmGtjZQhyDZMj8fjc1zfCwOTCud7C6kD/rSeWwXWmyoD9L8rLkyGkbIm?=
 =?us-ascii?Q?yXSrLfQHD2OKjoTYhLF8cVpcl7kXkCLcpkjudYAa1ge2FLVhd7KSOBib+iLj?=
 =?us-ascii?Q?xYbcb6mUe2broV6ZA1/w9UJzujHsnJnKYsem74Cv/wGnMbQDCQzkBQsTU+Qx?=
 =?us-ascii?Q?vGXaLWU8zJ9jrixXHNsdzOyNlrTBCQqbYvmrW0pzzNJiLext36BlqmwC/IOY?=
 =?us-ascii?Q?//gOqwzvCpm2fc3c6VwoLQ9aPdSwfKDTfrD8QRQ1L3p08CrL/x1BdW/TWfk3?=
 =?us-ascii?Q?O8Df0qlrXVsKc4rZ7YpG42rac4s6wP7y3mW7nW1LnQjnLcG62YcNBTNEagli?=
 =?us-ascii?Q?SS91YMnF9aQMG2Wm29cs3Xj73hKfmB43upR+Zko19kFkjPvwdiG0RhPGP3hX?=
 =?us-ascii?Q?ji0oxDvwE5bBp4p4EgJbK2UipDqGUdtAaRQY+Ogj9XSlR9FMEIp7S7XwcpAl?=
 =?us-ascii?Q?VSa6Nh2j5Cgjbzsn40gBgwKTiNEa8K/ghNVV8NhEUUrd3h/X5ovyivKTI4fH?=
 =?us-ascii?Q?1j/zYywQw5wTnkJH67cwps0ZnXVDBLLxUe4UqnTztrl34HDAhPwO0m9qY/Z4?=
 =?us-ascii?Q?eAHIAst5gpCUHpEIy1nid9CV8e/xfQjLy9r6/e6op+D18Uneg36ekT0NlYzP?=
 =?us-ascii?Q?wyzy/US1F1jSC2uqgDz6BwlloGezdIjwNA2WuBCcGNea62XPipt7d0WmLS78?=
 =?us-ascii?Q?KeHdODfalrlGgS25KgTsbGSrxJsc+TUJz+JAAiQewJvtqSqnmx88/9+zd7KU?=
 =?us-ascii?Q?KCiW892PtnW63D+YaHzhDo8E/wvaXEIa+8Y2/aWQFiFnEmgROkWn5UBFzHUc?=
 =?us-ascii?Q?+L+vzQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2aa054f-8c10-42a0-2378-08de001905f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 12:01:00.6703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KoPW+6pzy0pBPKYynk0ZV8d7i3EnD1TOk9YhQb6qCf4/0lDM69mN7Z3bE3iadTbbTF3bnxohM03GKuj2yV9LRuELamIw3vcFrjbjM9kDo8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9484
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil Ko=
nieczny
Sent: 19 September 2025 10:35 PM
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/4] tests/intel/xe_noexec_ping_pong: Create basic=
 subtest

Convert test to have one basic subtest.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
LGTM.
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/xe_noexec_ping_pong.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping=
_pong.c
index 609e05876..91cd04243 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -23,7 +23,7 @@
  * Functionality: VM rebind
  * Test category: functionality test
  *
- * SUBTEST:
+ * SUBTEST: basic
  * Description:
  *	This test creates compute vms, binds a couple of bos and an exec_queue =
each,
  *	thus redying it for execution.
@@ -95,12 +95,15 @@ static void test_ping_pong(int fd, struct drm_xe_engine=
 *engine)  static int fd;
=20
 IGT_TEST_DESCRIPTION("Expose compute VM's unnecessary rebinds"); -igt_simp=
le_main
+igt_main
 {
+	igt_fixture
+		fd =3D drm_open_driver(DRIVER_XE);
=20
-	fd =3D drm_open_driver(DRIVER_XE);
+	igt_describe("Check for unnnecessary rebinds");
+	igt_subtest("basic")
+		test_ping_pong(fd, xe_engine(fd, 0));
=20
-	test_ping_pong(fd, xe_engine(fd, 0));
-
-	drm_close_driver(fd);
+	igt_fixture
+		drm_close_driver(fd);
 }
--
2.51.0

