Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125FDD4A5EB
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 05:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E6510E261;
	Mon, 19 Jan 2026 05:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfHcz+I8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B28410E261
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 05:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768799227; x=1800335227;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YxcCRPlwzLVXP+z/ZLgvLsHG4O3PxDGvWGf/kpfvM3Q=;
 b=kfHcz+I8X0NfrzMx3I04HJycxQpyxevQL1TGStaCWS9hz1sk8JzDDiZh
 VZcmsqkgWnX4Rye8a05RXOXwU6f24a6ypz8b6Sp7LFaC/Ngv6h0gcZJm/
 sIzMwlCPnpRgfu8X1XLhbdI8sE8COA2fv+y10LVvuGvIgbqFIhDwVflYx
 mRY8MFRHJMISjuibC/LN5MnD0KOkEY3lsfr0QjxAaMyA21Eri3Grv+m1Q
 zgEjZbOSEVOsnnT7Tt80LSwhCAg2WBzJ353anyL7/JOpBDbgZ3D+8y8fB
 jHSKY0tPwHpixPdKnFyb60lKRXBUAMakm5vkjobdJXdj6eW7nXq3Z4vPM Q==;
X-CSE-ConnectionGUID: sdEwDPd9Q1yFJmKZoAv3MQ==
X-CSE-MsgGUID: 0kpRnD6nSE2GxB7Z/98Y+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70057026"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="70057026"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:07:07 -0800
X-CSE-ConnectionGUID: dlulfO76Q5SYbUbd+Lr+6g==
X-CSE-MsgGUID: koF2M96iQx6WZ3jRSXUIoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="205387447"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 21:07:07 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:07:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 18 Jan 2026 21:07:06 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:07:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFU1wRgSu1D+R2a4xgosqai6MJeJW8KMa2P1VycJ4tQAME6tXgXm9qw8pDet4EII3bdU9GBHiv62aFA028WZ5wSF+Mjm/RFfGGL2s6EGOdXTLelzHx+5aSpyozPRcdi0UHHiguX7oGPUVpP4q6PkWUCJ/czO6ravdoLHDOcniGKgBfHYjdTwgezaAd3fh+ua8Vw/m0xjumln3RtzPkvCDZit7G2N3Dr5xC8oYCkVmn9scYWPyEB+o02poWBYy8nKMppsIMI0EyHuo4TZMdpkQqjUoRGWdBMmK7M7ztKgnTTp7tuNLGn1DHmgPQRBnpaNYU6UNITAjhVNVMTAnJO0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peqqcGSxvcFBjByyKXMk4Or5ImaEu8lrtqdmjuHpPkI=;
 b=BvRKSJ6WAXRx1GHpuO1KNsxHETVjy53UrvKcl8SJG8TLdRZj6aLmhDtZqsbEInV1Zq9VJh1GrP1LelZQPKoE77PpmdpuIO13/zLIPRvFKK2tY8nBb2+9DTzWDc1f0U9AweYF8d8rqU+wD/r4HP2/wsb0EIXJLm9A73BxQ55fsGb0NW/bsTYdcvlhv/WsMzxvm0NdvMwpB6mPBVPSnaBTniqx8fE6FtxRRU/LGFKJpk8htbilGpNPvKRTR93RdIbzFhPY+dSg6LS0o3BLqs469iVsZn+Yu/lM3L6CmIh+629yC+vbjzKk25Ibx4kJP4BzKj8C+EaRxj3O8Di3FXbAOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA0PR11MB7790.namprd11.prod.outlook.com
 (2603:10b6:208:403::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 05:07:04 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 05:07:04 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Topic: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor
 writeback-fb-id subtest
Thread-Index: AQHciP7XkgC+KpYm20eTttXamoODnrVY7ycg
Date: Mon, 19 Jan 2026 05:07:04 +0000
Message-ID: <DM3PPF208195D8DA10DF1B4F032E289199EE388A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260119050732.110985-1-sowmiya.s@intel.com>
 <20260119050732.110985-7-sowmiya.s@intel.com>
In-Reply-To: <20260119050732.110985-7-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA0PR11MB7790:EE_
x-ms-office365-filtering-correlation-id: 43d421ad-dfca-4236-86cf-08de57189616
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?Kl/FitC0WKOb6A5auwstaV/PD1gYo797Ejh1eZXXH8S05ewbBLCjqE0S+sNp?=
 =?us-ascii?Q?DmPQbUJeJ4kO6vJ+N8iham9QZqyM1V/nVI6G2j41z5S719Eu36Po9f+ZWZEg?=
 =?us-ascii?Q?zhYJGMn93dxTwBjydGdi5an6xxHADZHu7XT6mGrCMiBnMnA7W2AdsEGqkPUR?=
 =?us-ascii?Q?dw1juuMNnMf3ffZCb4dPLaJnzqS0vNfJ/WaypdaeFAbm1RvK+CmOUocLsMgB?=
 =?us-ascii?Q?/DaHGOmgSv+ocFKKd4JZn5YDDp/VHpX40WTVoh0xQvA/45WaHgmoWjRvoDpB?=
 =?us-ascii?Q?NmvnxZrCRnQ6FYZwV1iLUv9/dU6wqVkNeRHlMmk2o/nItT+logoOJGtiEbx5?=
 =?us-ascii?Q?iCd8b7NhT6cP0oz0ShBeFhrUXaO5tZY0iiGuk/wp9JveGVFDGxgm0iqtear0?=
 =?us-ascii?Q?7EuNWfFQok3VMTHYcjLbuolQC/Gm4yvq6Ynqz73qcwh7G07etxRw33mO26+Z?=
 =?us-ascii?Q?FIoZukSFwIWH/YgpET4LNnGZMcwiSzExv5dF77MEEMp3O4zeaiDfKi2/goMI?=
 =?us-ascii?Q?vxBIiOobcCOUozZqO+ip7OZoqdsqQxUasO2/1xFJbgL9lbaQefkuvbJKI+Jv?=
 =?us-ascii?Q?XCdb0NJ7YbYGnek/tFnjqzvXy8ReXqCGhsnvXIzhTvwfZG0SRwS8pB84thAo?=
 =?us-ascii?Q?oAR6yEKbTWfGZwSayk3UzAQQiipLnH7LsGfAWUMLXj9DaYS5bGHb28sAYgM3?=
 =?us-ascii?Q?B8GZFsRY6QTYOwn0mmVGhI9JzX5krQhp0J2Np9274pHqKAiajFIpTftrxuci?=
 =?us-ascii?Q?KQu2QfEBOHqimovq2ptNtBEWevzMrvXCSeS8XaqJoy37NDt+EXFCN/g/ZJEB?=
 =?us-ascii?Q?SvPDpMqF1QCc9XEALGZzt3DsyEElZrbLvrnwn3YRKR1xYyWlB4d/TXj/3Ir3?=
 =?us-ascii?Q?8KhIvKK7kwUO0pB9pK5l9C73C5LLVdq2J2Qifb/r7svUd+2PLQaTyKmNqNPb?=
 =?us-ascii?Q?vs3ukaUxnucAx6cB9c/o5utn3Z2DEBSG5wD6F/DUlsIjPBav3WmNxgAS35GJ?=
 =?us-ascii?Q?unKgFSj19MHBY9FzElJywGQh7sOnAuGJn8ib8FU36lu83wcNYp11L7L25vOH?=
 =?us-ascii?Q?uJEvB0+15YAXsWupDUF6vSfbs22XpjOotSLuRvAqE39CH4N6Tp2iIYJO4dsB?=
 =?us-ascii?Q?H5hdLkc9WnBoGxLSOTJKv+jALl+nPDbbJZZKnE31kWxVbeynot0rm5WrSZbA?=
 =?us-ascii?Q?V3xfOh5NwEjTTg7DVIqs/qcwSavfP77kTdMVmjbiYwumRLGxHqwXQimGlXiU?=
 =?us-ascii?Q?eTLKgzL8N/5EIhR2D/kAetFGepa1n3Xg1GimoTkSBqWAunXTOXK1j7018gff?=
 =?us-ascii?Q?Buj/dniAFSokvl//OpXnjbFh17G1nwiqIy1Iy3l+hSPaVB5Ee5gfEYfZmGCU?=
 =?us-ascii?Q?/0cmZPrrBHIbNjsA9Ghi+qblsE33160H5hAQFVOX8N8c5WxfVCadWaYseDRM?=
 =?us-ascii?Q?GBfXKDcPaiY0iV8kQZWKKdIbg7zRIHOGYmoLtA8Pq0fKb4nsnbKzxjo1p+Vn?=
 =?us-ascii?Q?gfBn5RqaSJ4Ig12SB9rl9Sy54Y4Sv+inKS5mKuUqNIIl21EQoV2n9cwWJcGc?=
 =?us-ascii?Q?Vp5wFYQpRuxmhhmzn26n7tV8rJ/Ac7REpI/OajDVZ3N4eXQ6I9ZuD0JWxXFg?=
 =?us-ascii?Q?9V1aLcAvWTV7ouKjjtkX0Bk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JktqLEQjCdRjmje7xqMa4Bm5velVHagfps+q+g61cue+95Dl0Br4jKtEJjMu?=
 =?us-ascii?Q?mjgsWcPoB2x6mJeiPP9RbTR43Y1HTXM+Q7tzTHfpoWB4j6BjqLQbvtSiY4mU?=
 =?us-ascii?Q?X//QoN7Q2slReCHxuVHmcnaw6nn4J0FIIAwb4RSopmrRk3IRp/iH2tTOKtp+?=
 =?us-ascii?Q?LolWfV6bzF1EZPD4UC2V0uNqnKAhSSsujyRyzcrbvhIYx/Syl9uDgdWGx/gs?=
 =?us-ascii?Q?545BM7i0mkToG4gbAVwRVoZX7797k7k6WAbDmjfPf6XOVIXSaKdL2zGcODsO?=
 =?us-ascii?Q?wDrvhu3mHjOeeuHHdi+1Dn9f1vIg3L7evdZVoA58QMcv8Qj7gPR4uIV3PzAm?=
 =?us-ascii?Q?CSuTL24k+U3kVEU1UxFdAZQuhuODdCHGQGhNB5hGgv+3jbfM2dCdHn2us0bb?=
 =?us-ascii?Q?+gg+j9hkTEq96hgCfkbf5JXUq1BivJf+J5BCkKCNecCweQL83eJUbOrW+X+i?=
 =?us-ascii?Q?0YOJ+UNmT8UC7eVBYtU9c1cp3LEsLPWI9jzO+EzO+ZCeKKLA0b0M4D5xWojt?=
 =?us-ascii?Q?wl4YuJpfh+DcUqCCzJ+x9w32JUeN5bj9tsRkc32a/HnUZ5D5StK3KrWuXLeD?=
 =?us-ascii?Q?L293E5gh5/lpXhkdO1MyrP0/qfi/2NZo5/sjM5OkdMUCe5CvvFHgd51MhqNq?=
 =?us-ascii?Q?Bxgm9st5Q1DBWYQz5wmzEUzUWNDfvq0zfbF8Z55u1BUQ3RTsxAcyLBm2VUuL?=
 =?us-ascii?Q?xx/S5dHirvfeEU4zU5+gi+DuJ5wXxlZM9c2sGONhanlWAwzDLNK5q5muqvpv?=
 =?us-ascii?Q?9GOKLH7q3QUFOvS1Z4Ep0HAqX1OVUXfZ0fr7cshifoCOV/rvEQALAB/R0U0S?=
 =?us-ascii?Q?we+ah2u7b7D6FULfdwhFc48HVXA5R4ktsVfBTIigbqEw7bGU0hkoyymw8O13?=
 =?us-ascii?Q?thImqc4qE3DmA7afFu2EtNIsHPc2jYX6WybB+dE+Ah247ffG4Syh3NQ4BmB+?=
 =?us-ascii?Q?i2EcJaGJVZdtMJk6V5rbHsSr/jiSIgrDi+zmRnI+m5cWlF8k46AP79QqJ8BN?=
 =?us-ascii?Q?Cau1/fcSsL87/yAKdZNAVB+/zCBw/UYOJ33bEb4DFnoLbg1QKLMxFDccCpWk?=
 =?us-ascii?Q?flqQaHAR6wlfpuojvx7kTGFhR6xb6ryo6f2PCE8Gk3X2faZ+XRMp6vOiLKYs?=
 =?us-ascii?Q?5fiDMQgrEHUXadWfkrRn9nrZpcGevh6I/8qWXX3BmuiQ34mrsJyoLjubLzt1?=
 =?us-ascii?Q?o+rhYArfduWFWVrh2E3LCmeVIFxfGem0pjTAw7wULqob6vS92nFZuzM/HNDr?=
 =?us-ascii?Q?9FQmT6jiMv9NKR7EcyOrdkUhHru4zPitkh3IZeFX3hqZLHx2OyzvOXfUdkBN?=
 =?us-ascii?Q?LlzxEvQcPSymEbj2fTo7FQ43JXbJeKhBo0WtRAjJ6YZ9crh25VppUxnoULz9?=
 =?us-ascii?Q?KvuaIpWia44D5b79J/wi9gJI8bBNp5bPao6zwXwSxK83WODv93TwH9m5/TIr?=
 =?us-ascii?Q?CoSJrXR4ytlDLyz2bCaEmWB4vvdIhMp5oelutcxVtQu7cPLRY3RZ1CxJLaYP?=
 =?us-ascii?Q?TTVoEXhdLdXHJxWGxe9y+N/sF2/GkgrUD98SvYH/lBnezNO+qB6qRuSP+FFj?=
 =?us-ascii?Q?TkAwqsRMvVYdJTrrPNRxaghBfrU7oQa2t+4RomITLX6dxmsbAmR5aiIhH+Er?=
 =?us-ascii?Q?7xRyvKyovNXmyfBExIjDzmGuFIaSpvu07EgijoEvCLW3f8QZKuO7DbBuIAnU?=
 =?us-ascii?Q?UdpNrBTAmslq62H3LtQHFod+cmFOp+B1E9cUiwlBR9sxvD0fcq+GJxEvKS4k?=
 =?us-ascii?Q?JUrAiXzc5Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d421ad-dfca-4236-86cf-08de57189616
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 05:07:04.1822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MrwYxbwAG1ukPtKhkOXiUleeQoR+jFKhdUiMc8T90CX+RuU8EqL3czW2EePPXaI2hPfdbgDxADDE9iadQG1M+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
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

> Subject: [PATCH i-g-t v6 6/8] tests/kms_writeback: Refactor writeback-fb-=
id
> subtest
>=20
> Remove individual tests for each format for the test writeback-fb-id and
> introduce dynamic subtest generation based on the formats supported.
> Framebuffer creation was now part of the subtest level based on format.
>=20
> v4: squashed the FB creation function with this commit (Suraj)
> v5: -Update dynamic subtest documentation (Suraj)
>     -Rename input_fb to in_fb
>     -Set plane to in_fb and remove unused input_fb as an arg to
>      writeback-fb-id function.
> v6: -Remove in_fb inside subtest and reuse input_fb from
>      fixture (Suraj)
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 60 ++++++++++++++++++-------------------------
>  1 file changed, 25 insertions(+), 35 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 63917bf4f..0ed86c865 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -51,9 +51,6 @@
>   * SUBTEST: writeback-check-output
>   * Description: Check writeback output with CRC validation
>   *
> - * SUBTEST: writeback-fb-id-XRGB2101010
> - * Description: Validate WRITEBACK_FB_ID with valid and invalid options
> - *
>   * SUBTEST: writeback-fb-id
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options
>   *
> @@ -300,7 +297,7 @@ static void test_invalid_parameters(igt_output_t
> *output, igt_fb_t *valid_fb, ig
>  	}
>  }
>=20
> -static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, ig=
t_fb_t
> *invalid_fb)
> +static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb)

Also you changing the argument should be its separate patch with a fixes ta=
g mentioning
You are removing the argument because it is not used.

>  {
>=20
>  	int ret;
> @@ -700,37 +697,30 @@ int igt_main_args("b:c:f:dl", long_options, help_st=
r,
> opt_handler, NULL)
>  	}
>=20
>  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> options");
> -	igt_subtest("writeback-fb-id") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> -
> -	igt_describe("Validate XRGB2101010 WRITEBACK_FB_ID with valid
> and invalid options");
> -	igt_subtest("writeback-fb-id-XRGB2101010") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_fb_id(output, &input_fb_10bit, &output_fb);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +	igt_subtest_with_dynamic_f("writeback-fb-id") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
> +			int bpc =3D igt_drm_format_get_bpc(test_format);
> +
> +			if (is_intel_device(display.drm_fd))
> +				if (!strstr(igt_format_str(test_format), "BGR"))

You don't need to  nest these conditions and can be joined with &&

Regards,
Suraj Kandpal

> +					continue;
> +			igt_dynamic_f("writeback-fb-id-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t output_fb;
> +
> +				fb_id =3D igt_create_fb(display.drm_fd,
> mode.hdisplay, mode.vdisplay,
> +
> get_default_fb_format(&display, bpc),
> +						      igt_fb_mod_to_tiling(0),
> +						      &output_fb);
> +
> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
> +				writeback_fb_id(output, &output_fb);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> --
> 2.43.0

