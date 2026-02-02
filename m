Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480F9E7314C
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 09:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD0910E3CB;
	Mon,  2 Feb 2026 09:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzB/uuqw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73ADB10E3CB
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770024127; x=1801560127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TZEzpdyQk4OcPcV8njsvxubSt9Mq74RXrBxGvsMmajg=;
 b=GzB/uuqwNQLXYD248J23aRa4XEXjh3KREiMEDOaqzu+Lx+dV5CxiWhJt
 XCh3b92g6W4RyV6ER/88uU8ZtsI3BTJH6Kf8EaRh9fUm2OuYHrpuqgZXz
 zdqFoS+3/gtJbzBVZpLVe+azbQFKUfrLECPYtjaDh4Q4khxikZajO7R3P
 GBBEyYLFTioN4wVzFGx6BI+7/1+uM+4qtWL9e+kqj+O0//+e+4vDE9HX/
 ZN9PJz6BoDZWC97Q1LdI1h47SUUGwKF/9CfC8g8PZkMUh57+G/YRmgO7V
 ZWbNoQf7s9Dwar27OoDQkYJ0QtXMGJSMO9FEfgZg3LMFyfV4hG0f5U2df w==;
X-CSE-ConnectionGUID: 1TeG4RNESDWnuWq/osDaCQ==
X-CSE-MsgGUID: 8jSvssbBSxK5iDr15hWAhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71233170"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71233170"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:22:07 -0800
X-CSE-ConnectionGUID: FYhEoYNXQAyjfAS3golpxQ==
X-CSE-MsgGUID: 1fRSjroDSMaK0DVJwN2M0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="208732135"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:22:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 01:22:06 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 01:22:06 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 01:22:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPG0Py1eLb2hxSPkYMtiHk9GOAhaYGzrI3ZMdSqeaCuf5f9AwytQAYxuSQufpGtdENSwq1HJIv6iQ9VVWQmRIF0UzLCR0dpr78GMuZWrfkYukVKq72BapWRxCawvnylCL4w85wcjP7lTxAzQLraYfO+nXeIJiXgpKzfn2rdJ1lhXmcoXyBKCPOkKqiw569RTzQfCgyLCxcaAVe9zWQ/C/jDo02/CucPkKfv2iYRsdmF7L2gmdw5fT3h2Ze3H+lGsLj9qJfa3f+gHqVyVGWYmLDjWoZSn9x7ssX2YHeRbo8sefIqqPZ8zY8p4IQF70hgjaQKBS38EzgojdmSmgIyA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+vFSYv+QSqEY5yLZwHgQr1KxV8LBCA6GjE+lDZmjlQ=;
 b=K/FjHDEvhtAsbbJ35ANlSQFEXdpp8Ol0+eZ0vXIB8U7WMojvmtbVYW4khVfMeHIoe0oIx1KQu0d0iH+a2xXq6ADniKtkCRFU/RXVZIgXB73SmrLNdVUggxszOb+5l1P7w7TNLSvmD+HUZpmmT+LGUSiNRyvpiW7wVpWBoFqA57i2TB6er+i9vZnlDd9HijQvS3qvP5HNBDdIZKfFuLtY1fdWjTevMwLIHIe9c4B8Bv+tVvXZpsl/9Fez/GVTjLYpYdY5Y7lToBfIvx0pEObaDvoAF2h6b9rZRYIA1bJb3eQTPumEygp2ZbqgOTGxfiqTGfE3GqzhAaqADxemkaKJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 09:22:04 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:22:04 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 1/2] intel-ci: Add valid skips on kms_plane to
 display blocklist
Thread-Topic: [PATCH i-g-t 1/2] intel-ci: Add valid skips on kms_plane to
 display blocklist
Thread-Index: AQHclB8jwa9eB9V+YU2AOyPq83zeqrVvInXA
Date: Mon, 2 Feb 2026 09:22:04 +0000
Message-ID: <DM4PR11MB6312133C6A8548C5875E8743909AA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260202083300.647462-1-karthik.b.s@intel.com>
In-Reply-To: <20260202083300.647462-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS0PR11MB7766:EE_
x-ms-office365-filtering-correlation-id: 42e7dbf0-144c-46a0-46a0-08de623c876c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rWY9sjeCaNkqaW6UmO7NMGvgTW6WVfX+crILBoao9GYxv9t0U1/eoeLVnuoC?=
 =?us-ascii?Q?zYYp2oJzhSRyJ7991ltEA2nbM/rXWFsKsj7W1D1QmK9ReOHZa/68/XbuuLx+?=
 =?us-ascii?Q?Qz5yQOBIZgztQd5lwUV3TQw/jvgDI9ZUfP6wQTFhk0SRdbiD33QtV+4NBEHJ?=
 =?us-ascii?Q?AyV7Jd3zs6ZSxnW0lepDvvC+0ywy7XW0+3ZDd1qus2Fv1Perx813NJ5prOWs?=
 =?us-ascii?Q?jdVN41zWr+s9WLhN0Nm1pNU7ubANdwhr3rg4YTFhvQoqy+NzxlYkCVhChWS5?=
 =?us-ascii?Q?No0Ppe6SV+h315+LV3+a/vc6RkbeH9UpyJsj647DpQZNe3jUSE6IcqNRudu0?=
 =?us-ascii?Q?FwDhRGxHMhH+I2qwMm+huUedMDLxfekms0KxMFa3I/2Xg+o2PtQwmNF0gVY+?=
 =?us-ascii?Q?qlEO6IhL1KjGhocwVs4l5qZomy7dxGu0GESFpkz1gMRPIncLTbp/J0s/dWCk?=
 =?us-ascii?Q?jOs7dL0naSHxA2MmIhRD1fEYnrIiBj0puIjByx+avkblKBXB/0oibpL7QEju?=
 =?us-ascii?Q?UzI3A8ue+pfOQLdfYziHFwW9hqSbwiMlbYjDoI4Ng5FKrmheeNRUNSWWlAW1?=
 =?us-ascii?Q?O9LekboM0QVLV30VgionKqMQLP2qZuOE4yZ4gzi8v6oOk3DqPR1JOcwgg7nS?=
 =?us-ascii?Q?7X+PZeQ28AyRXcg7nWLGBk4gbNgtfSrf4eVzZVlaMKPCp9EQOdCISuwGNhiv?=
 =?us-ascii?Q?pNGXWZRLLVdDet1JCcfKA98GtVSTzgawBTcI7yN4GR2J+EprAvYYNsphDaZ5?=
 =?us-ascii?Q?kY3VkGdRAPZG1Yb6G0wtekWioTluyeMRoG5fn8tbrxshcrVVDgMm28VPWuVz?=
 =?us-ascii?Q?OVx/x8hEo3iHtZx8XHdFMNMIh9J/mY43ssZzphs2EBSyVsWYyhCZarP/aEj7?=
 =?us-ascii?Q?yav4kXZdtaQzMIqNdXIZaQLoOKE6p212MkLNKK5fGNETIO+V6YxKsRo1w9tE?=
 =?us-ascii?Q?Alzhot84wH6pl+7wDMq/nuDrEuHrTJD7AboktiIQdpfHdSbBtoMEu1A9kUgm?=
 =?us-ascii?Q?wmuAmgRj1N2SZ7RdtxYt1LZuZ4etqiqb1bFvv06j/Q1pH+LV9hgpj/w2VOlo?=
 =?us-ascii?Q?NlRjGR3GIayk4xjWt08CzEOE1X8gwvHHw/JEu1/cWsxNcV0w1z8/qWg6FRg7?=
 =?us-ascii?Q?XJjPXoOUGW1cA17H31DFrWSvo37Ek/PWIwRqahPYtD9uzh+feww465O1KIW5?=
 =?us-ascii?Q?uFx5wGbrTESE4PW9W9KGwDLWZqMhu3Vh6ygB5diR28pckZh3G7RjnG+tuRGL?=
 =?us-ascii?Q?jX6H+Bpt1kp8wnKvnyeoPYqfh9k+2aRQshDCKb5NtR3fdIED2qT+3pjd6tBQ?=
 =?us-ascii?Q?ostCYVi30jsakcrhOv5N9+PscJAQux+Z8s4FZYKzvzdu4J4G4zbbVZWDMFg+?=
 =?us-ascii?Q?Nkv9k7WqLLZ45OKieYUmcNcurgH2Ai+nhJNXeyx6BczEWwt6pAQy/HTRIt3c?=
 =?us-ascii?Q?9QUhfhomtbpcZEwh0i30kozpJQKUUKIMwRr+OzHtwd1SWITHDZKPNr54jh21?=
 =?us-ascii?Q?XsHUyppjWbTkDvSjZ0aoSiQzdLQn20AK/1iTw8rfNgqUZig2mf5nEwfkX8G+?=
 =?us-ascii?Q?1b5CtwGfa77SXlze03s93dOzKUWXd4sXtGZ1Fvor7n3JkxBFk0MLGbOcHXHo?=
 =?us-ascii?Q?t1xjSrce+IbNgxD6M4XgcU4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eVa6xTjpIqQt1HoMcMZbAs3OUmaCuUrZDTkaKpjW8bGDnBT/r0vZTiln7qnL?=
 =?us-ascii?Q?B5GdXP3Nn0qsFL5l5GsifCYelopO0tq+mWCm/MSkxHE6NJ4vC7/Tit/Qd7r6?=
 =?us-ascii?Q?Ekx8ghIJJu4axv5Ciq7HqYzODtPLVXoaviv2m+db0iYvgu4+xj7lZ3DdpYcA?=
 =?us-ascii?Q?FlIkTRZ40EAQwJIincYMo9DHiWtAYojttvQ6giFlGYt2fd8f4WMEf8fGj+1X?=
 =?us-ascii?Q?LD84shUZag4dyqZOkmDUwvJ/bK2/6ZinaXZa9isqEDTYmIWvcDcNAugZKAG+?=
 =?us-ascii?Q?4J3zXcZ/pA8QN24a4FQ0BEqpUCi56/BPokvYFYvGv1WvjzYq6JmgVBajTrPs?=
 =?us-ascii?Q?xdsHSoPZRa/KyGoUf1SoFTRFy8IXr+9LyMDwvJEUiSRQwRMjJXq2zjM3N80X?=
 =?us-ascii?Q?fS7Uvh/ZHUNfVOA/jXqzLNumY1hBE8bKmsNqE/7FnBNskzUBNj7kEVb4PGy6?=
 =?us-ascii?Q?pmft/ynI0akhhHSooEzVmhshVwr48yb1mwxly7UT9lnAQAqcReE1XOHnWcws?=
 =?us-ascii?Q?PHgnzKQNjvJxi6+T2YWjFFLOfh5L3XaEGpOK5NV2v5ouYHhCqa4hZIXtH+Re?=
 =?us-ascii?Q?7MGipJlQ0vgUGHwDgjWB2US5cD4xt5UxzDP67X+y+Tge/VHmQHwYtEFEBtxf?=
 =?us-ascii?Q?OOpmT8mECTRnL+e1UlAJJGnoMCKBqyfTTL7jKqpemxJ2qbKEZtmM9dGzCvlK?=
 =?us-ascii?Q?f/4oSSFdxYNT0BSmOxMJVj1FP7LIr8qFh2tGmoqxxfeLsoJbhgl90Zqe2BNc?=
 =?us-ascii?Q?lnYilSkZNcbw2T+GNtSvk+wjarvtedp+ZwUGH/zwdETt0pzBcJ+df7A6stD+?=
 =?us-ascii?Q?5vnDT8Ew6CEBZ51ARTtyeTgJKw/kVJ/Luqe7Z9F3EjmuvzSWCI5HqoZVrUFb?=
 =?us-ascii?Q?nfplZhFr9SstUVJf+nu3x01gs9SVyHkB4tD5Vg5X+1tDqL0qI7X36REQOlXV?=
 =?us-ascii?Q?upz2Ft0bHAItOElF8fmXpsf9VKcQggUX+fs9DIlMfTIxgfizFSXk8iBL0uge?=
 =?us-ascii?Q?E5Bt3AxWIdgQve8O5omoZ+SNMnTij3ImMkyddGM8beixJIwh0t8reHNgyvQt?=
 =?us-ascii?Q?Vxmhgik/JNHG+ywoiFjZTWA7C0sgtTcjFB8vg91Z+xEXymP1epBGKRo2/oOx?=
 =?us-ascii?Q?STW9QNm0KHyk9rb9QUA07LkIMy22mKIpCwZwsbwuDp6yRr56fdi6U02Q2d2Q?=
 =?us-ascii?Q?gVLD5PxcXuiDTmxgFzWtvS/bwuB6f8qMp4AuHWRI8XOIjjtpOUHAlrzuLuey?=
 =?us-ascii?Q?gOHhdL/ISs/ybUd016SMRy3nzsNRLM+/QLJk6Njm8HBqsEgRNW8Y8eh9KlXg?=
 =?us-ascii?Q?WeT3crp0ho283N4E5BoUzFJQvNHSruAJc6KZJN0vmrCeKfmzCQJudajcsuYw?=
 =?us-ascii?Q?GDyxJRL97Hxy4VJPYiaLK5p+boS7WcA+e/+lkoZ9aCokvwi2FZeu79iaytUM?=
 =?us-ascii?Q?AFtzJbnAKf3cck4Srtx4YUOBSKvDv8ySC/zsnRiQ6CqQZtA9ozZKU05h/MI6?=
 =?us-ascii?Q?4iBVeOJCzHXabZ/oPXt8A1Ne60wS7xzTgEsfPsaoeF1BFJGSBOGkZRvhU8Dj?=
 =?us-ascii?Q?dykgWuuRFijQ9da7kjzr0hz1b17YGiberwRu6pfdO/kKkj1tGT4sP/F4Ufh4?=
 =?us-ascii?Q?25+gm7Yex4kpBNsHIl7LWliTGLbnUHPRycHEUlQEMhnOLlTUwiIvB1U6YmV4?=
 =?us-ascii?Q?ldhK6GdNCweC0aSaItq27Mlb9O0iE1BCdOfH6/YCpvBLiEEg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e7dbf0-144c-46a0-46a0-08de623c876c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 09:22:04.2251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UNK9arU7EmOr/BARNbsa4uBKaQUbZKkT7SgoCpXcbEYzWBDbkrJKqEUQM8pnK0VQaIciGJKU8uvoAq8Frh4Q+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7766
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

LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Monday, February 2, 2026 2:03 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t 1/2] intel-ci: Add valid skips on kms_plane to disp=
lay
> blocklist
>=20
> Multiple kms_plane@pixel-format-* are skipping as those modifiers are not=
 on
> bmg,lnl and ptl. Add these subtests into relavent blocklists.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel-ci/xe.bmg.display.blocklist.txt | 2 ++  tests/intel-
> ci/xe.lnl.display.blocklist.txt | 3 ++-  tests/intel-ci/xe.ptl.display.bl=
ocklist.txt | 3
> +++
>  3 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-
> ci/xe.bmg.display.blocklist.txt
> index 2c0c4a0e8..86c1bbd72 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -11,6 +11,7 @@ igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>  igt@kms_async_flips@invalid-async-flip
>  igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
>  igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
> +igt@kms_plane@pixel-format-(y|yf)-tiled.*
>  #########################################
>  # Valid skip :- 90/270 rotation is not supported
> ##########################################
> @@ -116,6 +117,7 @@ igt@kms_ccs@.*-dg2-.*
>  igt@kms_ccs@.*-lnl-.*
>  igt@kms_ccs@.*-mtl-.*
>  igt@kms_flip_scaled_crc@.*dg2rcccs.*
> +igt@kms_plane@pixel-format.*(mtl|dg2).*
>  ##########################################
>  # Valid skip :- Simulation specific
>  ##########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-
> ci/xe.lnl.display.blocklist.txt
> index d92e12d64..d280fb16a 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -11,6 +11,7 @@ igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>  igt@kms_async_flips@invalid-async-flip
>  igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
>  igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
> +igt@kms_plane@pixel-format-(y|yf)-tiled.*
>  #########################################
>  # Valid skip :- 90/270 rotations are not supported
> ##########################################
> @@ -85,7 +86,7 @@ igt@kms_ccs@.*-dg2-.*
>  igt@kms_ccs@.*-mtl-.*
>  igt@kms_flip_scaled_crc@.*dg2rcccs.*
>  igt@kms_ccs@.*4-tiled-bmg-ccs
> -
> +igt@kms_plane@pixel-format.*(mtl|dg2).*
>  ##########################################
>  # Valid skip :- Simulation specific
>  ##########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-
> ci/xe.ptl.display.blocklist.txt
> index e9d0775e7..bb5c83f15 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -19,6 +19,7 @@
> igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
>  igt@kms_flip_scaled_crc@.*(yf|y)tile.*
>  igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
>  igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
> +igt@kms_plane@pixel-format-(y|yf)-tiled.*
>=20
> ###################################################################
> ###########
>  # Valid skip: Test skip due to hybrid config requirement
> ###################################################################
> ###########
> @@ -71,6 +72,7 @@ igt@kms_scaling_modes@scaling-mode-none
>  igt@kms_ccs@.*-dg2-.*
>  igt@kms_ccs@.*-mtl-.*
>  igt@kms_flip_scaled_crc@.*dg2rcccs.*
> +igt@kms_plane@pixel-format.*(mtl|dg2).*
>=20
> ###################################################################
> ###########
>  # Valid skip: Valid for display ver < 13
> ###################################################################
> ###########
> @@ -148,6 +150,7 @@ igt@kms_rotation_crc@primary-4-tiled-reflect-x.*
>=20
> ###################################################################
> ###########
>=20
> igt@kms_(plane_lowres|plane_multiple|rotation_crc|big_fb|flip_scaled_crc)
> @.*(x-tile|xtile|tiling-x).*
>  igt@kms_pipe_stress@stress-xrgb8888-xtiled
> +igt@kms_plane@pixel-format-x-tiled.*
>=20
> ###################################################################
> ###########
>  # Not supported by current CI configs
>=20
> ###################################################################
> ###########
> --
> 2.43.0

