Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B914D232C5
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 03:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E738D10E7E3;
	Fri,  9 Jan 2026 03:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="joKxaGUl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A62D10E7E3
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 03:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767929556; x=1799465556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CDlToTOf8f8Gz9mDNMeJ1zD9gQwnTToLPplaT8jtrUg=;
 b=joKxaGUlFDL3Bp4Z7S0+iPiJnAyl9ELPlMLw+PukJ53yIhJDUzN3cwaM
 XjO9KQIMnrZmk8sxT49lsDxNRYrIVPplpXr2DDqkPDqzfz4RT3MoRD8+9
 zetjmttzF0dpS2eYjJyw/eqkpHw72fAYZW2kUvCfRWzDFJk4eH9vurHbQ
 I92dA3CTkv37tyUtwZMQIW7uLSnjDquFbICU/gIapHNU08iiHMh2cJKNo
 P5qFqvnIKVwCSK2rdQkBwmZqljELMvjlM2aJphDo/Hu2JpjyTFSGTV6Og
 viXjMhYJg/b5c/GSEpLZh6EiaHaFuUOJloWxHDLPAT3wtzR1BIKu/do1M w==;
X-CSE-ConnectionGUID: 8yD/Yp5bRDC2Z3GYrDZWNw==
X-CSE-MsgGUID: Pcz6nneNR/aEBZBmGX2JrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73170328"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="73170328"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 19:32:36 -0800
X-CSE-ConnectionGUID: Pmx/IOI4RXyLaAoOXyV2ig==
X-CSE-MsgGUID: 2k6XXNHiQu+Zmfe5PE+iwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="204202666"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 19:32:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 19:32:35 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 19:32:35 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 19:32:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiceKykNofULlpRR7rtLbgDInvrO7Hk/pQmWUOLwyPv2j/sG+eYBdg2U3rE00B3zRKmWzED2Y8Jm1KvwXQznPIhYjugPGubyvB1/BFtBAivlP+yiBo4S+KZtX7kmgdmq323f9dUP6UHqDoRMhuunEweBisLQEKN6mtxTzI7EGeiCCQ3soT1HPgoS824kwv1b1uVt84rCXxY9mWCsbE7GG1bLkbJePBWjVS2q+hbyxK7KarvBC4JwzxwftiXNj5IQx1mqKzb0fA5LsN0mTVPq0TTVQKaUJb3Ypog4RVreoqxDGPE9/i9R9FYY2cFYr5WO1N5/l9F2BwvfWtWX0RuCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35oaamFWkYXddDuZMDrQYC7AJVqLSTjeMvEFwIjTKng=;
 b=l94yIwen19bybYDlAGpsLoZx9cmEzYgV7X0aqPz7n1zwmBXjKbhfmSRYAAdRwrpGO0s9OXQVFH64QraxoGaVmMPxrbE6PxBG245ZMqNAI2JqZCErXSd9Iq5+hI95y6PgKQYvlkbtFJUE5ji8s248c5dDCfTeWALmKoSXI1uwiR8dpADj6NtICqFk4zZph+atF+oOAM90Ci5ClVyybUOeoKBEqYIMVqjJ7JsWLvChDbsjYTwVLGPe9ZbC5ITbHOi7HyTb7vlTqWIylHKJrJGBtSxxmimg1ktdSnp+VJ4GrUe5gW45R+rMU20h/zqmyiUHxqT6076TmK8rYpuy6XcAJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB8544.namprd11.prod.outlook.com
 (2603:10b6:806:3a3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 03:32:28 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 03:32:28 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v5 3/6] tests/kms_writeback: Add intel check for
 vendor-specific restriction
Thread-Topic: [PATCH i-g-t v5 3/6] tests/kms_writeback: Add intel check for
 vendor-specific restriction
Thread-Index: AQHcgLNzmMAi7SYZbkicRpEgRay507VJLrfw
Date: Fri, 9 Jan 2026 03:32:28 +0000
Message-ID: <DM3PPF208195D8DF561F631730EA001DFCDE382A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260108154817.48665-1-sowmiya.s@intel.com>
 <20260108154817.48665-4-sowmiya.s@intel.com>
In-Reply-To: <20260108154817.48665-4-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB8544:EE_
x-ms-office365-filtering-correlation-id: 2eeb050a-c445-49a9-bbbe-08de4f2fb701
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?smCcIRpYQlQZTCAuWy0bwro4Lc+m5BfvvVsrpihQEs0tTo+imx440qkQTrAp?=
 =?us-ascii?Q?TZmm7O/BemdOZRUNqL1s7hluk+v3Vgf31Qu0L3JEWYcrtMf/n5L6trJm7bmZ?=
 =?us-ascii?Q?0dqXQD9Z1OLVv7bfrTETpGUE4lorfQr3X2dSwhkWGGwGf2IaIv0T0D7C2Ylv?=
 =?us-ascii?Q?qSMf0FONlrzh5gb4nXHAxxPYzwuVQ/xEW0WQMtPu/kPWEnyrvOD0nVenDseI?=
 =?us-ascii?Q?xXMhMBjvdfOqjX8eaMBQdVBAWj2DbscOC5oU0wCSyjGKdpSUrz0lG4yNS6B+?=
 =?us-ascii?Q?Y5teePLqM3kwUvbRNwWc1/MURVrwjc7sY0LBj6T+GK/i+w/xTb1zMDHcdBOG?=
 =?us-ascii?Q?Gd9wfm9ermOlYH2qxiux7SjdZKIeEFp9zZr8Qx+2PA4L/0C5BCcXQ/wr4BjJ?=
 =?us-ascii?Q?azdBXnhbD/hAFWOKBoriDGu6Dtej/JUrxGYzP+1alRWbNNVg2X+Ui/6LFU/s?=
 =?us-ascii?Q?Mt6Gyr3P8PWhayeRkx67DvadZQC/zrIo2cuRLoKoY18x1SQxWxXaTuBSmCHJ?=
 =?us-ascii?Q?lOnZe+O3zYDe8shi2G81cpSLBSekEEYQimzxj0iQJbVNRP9mR+G5ZBpuw/3P?=
 =?us-ascii?Q?GnY5Zi9AeupFm3299NmP0Azgc1ofUBVLHho1MAHapIezDPNljItsSTOKLXl+?=
 =?us-ascii?Q?lyF+QNLpwmV18qFQQ/Mj++ab0rdmYKIxdbJx4M3ow9jDF+HidknEIj1NFffS?=
 =?us-ascii?Q?EWJciPHntFweF83lvgIP8V8PgYMBhIiuU/ZDfp+P5OqboqpX6wGz8kThyxWZ?=
 =?us-ascii?Q?tZmG0dkeGZ/sdKEbo5/CR1x+Fl55I0XDb9kBaowaCDjJu7oUwerf9TXECmhb?=
 =?us-ascii?Q?xiY3LUPtuyvl432pj0AzG4L42bENtrckH9lPwJn6Wbc1cuHaq3qez8AuLBkY?=
 =?us-ascii?Q?uYYDn0VK6ENcdgBCIY+DYcf+WaxnYCM1h3oCoUHB7Nmdv1Is3lPAFKhbPaD5?=
 =?us-ascii?Q?37MAlQWTDWsxWkAklAfjz99y+ZPrFs+U7Xl8DGjbJUBptLX5fG9gPJ7KBFX6?=
 =?us-ascii?Q?OsoIdfz3/gmdXAqZRCIRrzRKR2wlyWJQtYle8wSchfT9u1g5lnzfAyry3ETf?=
 =?us-ascii?Q?EbC4adtBuWVD4FSygkTmODcGjNIXPZJlM/ajyWqLZe5aT/k7RZxWM/wcy+aS?=
 =?us-ascii?Q?qMfKuNFgso8TxWMeIPYWJ8XkUmgvDEyDwnX1tYm6N2MxEAQC1eqNFq4Nrf+H?=
 =?us-ascii?Q?Jr6YJsSmPKFia8fRf95STkyC/XKTO8gbYxvnRbAVEmXHcbk0TZa2pBUlUh9i?=
 =?us-ascii?Q?JVwHFqYbcBPU7IHXxv5TzXKdXuOM5v6ocXjBprM+riXZ/ue0wbfXod2bXI/y?=
 =?us-ascii?Q?7DVr3bs+0ZXCgCe6jYdsEpR2wwiA2T6RfYYGu/7vz4xcAwu7Pj14hj3MbYkO?=
 =?us-ascii?Q?mjeyqA91RrcT5Lqm+pJi1KgD6sSjC/6n7ZXlRw2EFpre/ggodTJ24+h0qMUL?=
 =?us-ascii?Q?Ur6q6p74lLUFwOMgAh3k3PZ8aKV45sS4z9Jh+fmuzJadyXYLd8+VYw/67dWB?=
 =?us-ascii?Q?RZn6I+z0eYICjQIqOLtauQ2q2jtpPVQ/6kco?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bAHWDc8jIrZ+cn2mk30MNPMyJFDxnFpsO9lwai8O1GAeKJQ12lmeLK8dONyU?=
 =?us-ascii?Q?G6CqK6P2WP5kUCchJu33sKRGlokJ3qpHKtKPSASJG3TosbZsjn74X1XPaSXg?=
 =?us-ascii?Q?fYPmbwLPxOCNmwTliMuN5w2F99A/kq7M8Xm+ZFjYAntYHVxyJ3kj1Vh88x3R?=
 =?us-ascii?Q?zhWcQODkVC7wg37wLBWdTG/fcGoSfZRnuPRBsQdN6c2aO4wYskSmrKOiOMmW?=
 =?us-ascii?Q?XpWu2zsat3WuReL8cdaO3fyJvkZHdrFBR2FCwzk/zPqAsF6teHzdtqiXGCxC?=
 =?us-ascii?Q?etN3jcXWJJF5e2e+d/kqhVK6IFBVKTyuG8A+5PPUZ2IEroTWy/SZCNoFQcLw?=
 =?us-ascii?Q?V3Tm6jkjqBZrmVtNtRmlAk93SXdeiGPwmpm8wL10gDgbIyL9+X9bFcU778jL?=
 =?us-ascii?Q?+cWiwEUoSTFAUTCzPIMR2NF1s8nBhl7CmF/F1h6xl/fkDHNrHuAv5GS/32/i?=
 =?us-ascii?Q?jWn4Rvz27kNpwXPqgG8WyHjF4XZHVPOu1HP45oy2Y0UOOYeTKUwRqkpp8aSI?=
 =?us-ascii?Q?nhYgwuZMB2bO4l+YbIg7kUgVnWMdBpgPdpGrQMnfc17shyXjfci9DtwYormr?=
 =?us-ascii?Q?BdJC8GE0ZhkCjR4zHCqez+GLRm+BkdPZ65LDLpwhZEWiwgOrcEEhjJS5wTRG?=
 =?us-ascii?Q?YbTlMMUsVx8kboyWa5ca9d9hWm3RTafOJtlqsbhf55ROZL20xJualPF5up61?=
 =?us-ascii?Q?IYxkZs9RP0CmQpO88aMqpbdCBCeHOj+33H5Ld/Lx06apiBbOVUlh5oWvPS3/?=
 =?us-ascii?Q?Dc02i339fDVI4kqylM3rFoQAWcS6Zbo1OLws8dXevWeU/qPn9y2n/YYGP+Z3?=
 =?us-ascii?Q?PvUg/zTK9IL/0K2YE2mlUMj3Ote6exOnhYacBcgD5hQFi24yfQS98UJCPc5o?=
 =?us-ascii?Q?zJKiWPdqICpq/0iN5Ax5oC/fxkmkHJ6sAtDR9QftPG/0fABQeCEidNzGXuXD?=
 =?us-ascii?Q?h6l/aVWlmMS1l4kNOc+wJP8kMuohxYWkPcBCAbnqnqw26tW6oF323kPgMwJ1?=
 =?us-ascii?Q?4s07AzNWlKuW3vO8c71SFVcN3xhOxRbe6lbfqrYxHQAwQO0kk42zB0BkFpgR?=
 =?us-ascii?Q?EYeFS7hRlRCYVV/mYNSNCQmH0jNyUcIusXuZPzNGN0Qu5YNNLuHiBWbcA+RU?=
 =?us-ascii?Q?pynKiy3eR5Dm6Qgcdw/6Xk14PqZOV5uOFujSg/YjIJ4SFVGzQxAkDwiLK6b+?=
 =?us-ascii?Q?+UUnoV/Yno4wLlVOOjc0d+s8fSx/sulLe7D6T0UavfjOpa70rlAEqACpcxoe?=
 =?us-ascii?Q?ZvhQLhXH28DfBnkOJ1qsPXwVl/T3DcKx21U7yRKqG3aplqydRzvaMFxs9A4V?=
 =?us-ascii?Q?NMISY0DdrPf74HEm6elZI/Kk8X74aSx3vqG1UZ0fwtakU/xST4MqtBEHV+BF?=
 =?us-ascii?Q?0vHYGDR3nYNhT7AkMrfRGNsfkLlMUdGv9yUr+afZSJw5h7r/H8yO64B/hbdt?=
 =?us-ascii?Q?fkiiA0vDvlAtuHy8FESs4tDwboTDQ1a4yms3QTgFyJblf1/8stECx/VPX0JT?=
 =?us-ascii?Q?ntJmgUZDY5Mqm41Fab9SCKml8k7D1eTGhdVHDddZeP7dnf07lIXGACwIGeQx?=
 =?us-ascii?Q?OwrJHUuoX/vBCjSZLu9RnAFF7y4DJ6EJXjz70vScV/sPoAutoqMVt/KdPsft?=
 =?us-ascii?Q?ljfY7/lieALwwSqGn4DDrRP+Vw6YDdlaLsYA0tAoz+b1nJAMxWLx8kIChsVb?=
 =?us-ascii?Q?4IDAfG5u26sQrlcnFVcAUg0gBAD9hiRtH3fmrDHUEGPl0xSX3S7Qif8QHqva?=
 =?us-ascii?Q?QGjFgy25jw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eeb050a-c445-49a9-bbbe-08de4f2fb701
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 03:32:28.5488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3UP+ZgHSa9mnCldEXeO7tDoeXPw20EV/lA3Bj01bUQe99PRPjGgPCC7Vf31qZhC4emAgOzoUICJjyKbi0oFHQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
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

> Subject: [PATCH i-g-t v5 3/6] tests/kms_writeback: Add intel check for ve=
ndor-
> specific restriction
>=20
> Add intel checks for vendor specific restriction.
> Disallow empty FB as writeback FB only for Intel.

Correct message description should be "Intel does not allow to commit fb wi=
th 0 fb id or
an empty writeback commit. Update asserts and checks to take that into acco=
unt"

Update the commit subject appropriately too

With that fixed,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> v4: Restore drm_fd added in struct and access it from
>     igt_display_t struct (Suraj)
> v5: Revise commit message and subject with detailed
>     explanation. (Suraj)
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 691774777..defe43686 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -291,7 +291,7 @@ static void writeback_fb_id(igt_output_t *output,
> igt_fb_t *valid_fb, igt_fb_t *
>=20
>  	/* Zero WRITEBACK_FB_ID */
>  	ret =3D do_writeback_test(output, 0, NULL, false);
> -	igt_assert_eq(ret, 0);
> +	igt_assert_eq(ret, is_intel_device(output->display->drm_fd) ? -EINVAL
> +: 0);
>=20
>  	/* Valid output buffer */
>  	ret =3D do_writeback_test(output, valid_fb->fb_id, NULL, false); @@ -
> 406,7 +406,8 @@ static void writeback_check_output(igt_output_t *output,
> igt_plane_t *plane,
>=20
>  	/* Two commits, the second with no writeback */
>  	out_fbs[0] =3D output_fb;
> -	writeback_sequence(output, plane, input_fb, out_fbs, 2,
> fourcc_color);
> +	if (!is_intel_device(output->display->drm_fd))
> +		writeback_sequence(output, plane, input_fb, out_fbs, 2,
> +fourcc_color);
>=20
>  	/* Two commits, both with writeback */
>  	out_fbs[1] =3D output_fb;
> --
> 2.43.0

