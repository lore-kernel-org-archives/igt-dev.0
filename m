Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BF4E77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 07:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E5810E25F;
	Wed,  8 Jan 2025 07:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bxj23lry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32F510E25F
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 07:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736319608; x=1767855608;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+k8zDkXntDQUOw4XMTefzzD8JX6RbchQ4f8/kpdwvTM=;
 b=Bxj23lrySR+r7JPrE7D/tYoJaG24RiCLePGXvEzgW4eKkDRIMpxzj2Ut
 IdCXXQF1UwMT9qUJxmlzmJvnlJcwYWVTYAS89Lj/XRhgVjIUjRtQs8JQQ
 4Ur6cTW7zgvLsm22v7GMc6c29nrE/RiCJtS/26xIEKHEhIKAeUFV+MGdK
 laP56QPaFJ40TRqxchk7bypGkxRgXyA3g1s9Lm4JtOCJ4r+UC1cSH8s5n
 8XuU8ackI04ZoMSjl/SjLK8npMdZ8dYLepqYwriDN6K6mDOvHUPFNA3mK
 6bxFwIWnRKGCEGIMcQQJiw2D8ksRQdQuZAIUYVFqHfnbEUrGa29uwkiQI Q==;
X-CSE-ConnectionGUID: p//Vlk+WRQOCMptyl1I7iw==
X-CSE-MsgGUID: y9jYpSs+SvGmqTHl9aS4hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="24136696"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="24136696"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 23:00:07 -0800
X-CSE-ConnectionGUID: D0t9gn6KRyS/e4hV0OoiIw==
X-CSE-MsgGUID: X7E77IGsSaaReRuC+KTqRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="102821849"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 23:00:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 23:00:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 23:00:06 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 23:00:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+eWC7F+y+Ltezi8svSyDEwMlCm5y0x+K/YBtACj+RVAXJNxX7mQRQad8KXLmKTNXLLF+PjJMsdeLzpm7Oe6+3Hi9cxxm1twluOUlIcKbLesAlAhrbR8qOaGyohnIVIkyy7LWI+QFVgcNXtUMGu2yfNvzwKP7jOAzqtKY6qWi8miPa3bjZhlxxe4cDePpeEME6gUDryfOVa3OIqlJWNRkkZCfb2vh1FFrDzO04IDgAfaa8yE4WVtpYSechfY18haTSaCF9QduWszQ0i55vz1JRAa1fPxEC4l8JCYfWrwehzU/rX7qbqj6CncgAOE3bzBd5i//4JhljT0dcFvjVLu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAMFby4Xl18CL4ddhse67YRx8djr9SW+iZ7pnl+KTpQ=;
 b=lzVVva7eUszl773N0tMtFC3aosV8TN9BD7GBkY6PIB9HcM2YlqJ4/yYKhOxcQ+5KUj3U2LXvSqqeFc4IZgHDsX72gg2/SePRxphGxGBP66EBua1lnYF2Vn5llQu3sEid9CO/P+ShfgDjWkYNcJFmYbHAkbYHyPGU8OUQ9ku36o2xdnVcokQK+o4ekil99h607zvjsWn7iLMwLz0S1apBu5qYcC3nNIiB9YBvRSd2ibdTgAqFFOwxVBGOGherFlXeLnqggPSrc2An7+817Ja1WAZe/m7yx38UENomo+IDdgxJLKNSMF8TqwJTksrTtS1Yko4G66Pjgy1wGoWxnuPv6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CY8PR11MB6890.namprd11.prod.outlook.com (2603:10b6:930:5d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 06:59:58 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 06:59:58 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t v3] tests/intel/kms_fbcon_fbt: Add skip condition
 for bmg platform
Thread-Topic: [PATCH i-g-t v3] tests/intel/kms_fbcon_fbt: Add skip condition
 for bmg platform
Thread-Index: AQHbXdaqihfv73ms2UyGN7eb57diO7MMeebA
Date: Wed, 8 Jan 2025 06:59:58 +0000
Message-ID: <PH7PR11MB605329FD7E17821BF0C46597E7122@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20230328023811.46847-1-mohammed.thasleem@intel.com>
 <20250103115710.84108-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250103115710.84108-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CY8PR11MB6890:EE_
x-ms-office365-filtering-correlation-id: fa997091-730c-46ec-f690-08dd2fb2104e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Jyo5CJEYWYnjRLykRCgIxxuN2xN4lEprIaomXkoBtmI0JxPsSk9Oalq3aLDx?=
 =?us-ascii?Q?K/q5CDXBQ+OLuInr8HsJKb3Vp+mLk80TZave+Dt1ZWtbzRXlRclcJfzE0vGN?=
 =?us-ascii?Q?YhMqAJ4WmvCp3eMdOdtf8Jpp9VY411uXoiteq5BPDOqj82TqYa+CKJd+/S5Q?=
 =?us-ascii?Q?BP8lQBblLT7NrKNQlgJP1ZRkFz+TwP7s8Kd4BaTogLyc2LaaPppNPlcR+dSm?=
 =?us-ascii?Q?2eBc5Bp5vJ7twR0QNEodxGBoGxuD6RG65jX5LK9luUtQzYQYROzuUcq3+NS+?=
 =?us-ascii?Q?tKlWt+cqgW9+Ve0rtJj2e4RQtn3/tsA1mnc9iVc3nTDD6iuerlia+B1T9O4t?=
 =?us-ascii?Q?Nz2lUSXzVAGlVsR29xNC7dE5fOkncQcGtVeQZIbuUL4tPeAHmM2iRc0AqeIO?=
 =?us-ascii?Q?XQrWMBXkEzAYw1EIr5xT7b0qQYEUhWF2HbXVi2IFUqpG5Pes/yvPU1u7i0U5?=
 =?us-ascii?Q?rmrOFyiYedOJzhba9NtfN561OwLjJh3IOHRivcmzJgPQ03+EFBEnqnE9QJVc?=
 =?us-ascii?Q?ro0Q3PpboeUZ1XVwiC8FeFanVIBmXYYWe4vcDmO9O4fK1Yfc/LL9mqEcgVWt?=
 =?us-ascii?Q?IDf2YlCZsOR/ijB4dH+Wbz55IpH7bZiWAZJ1CDg+Qj3nSnXPVr7HIN/oDN6q?=
 =?us-ascii?Q?DXvF8WSyFNShvhKdfPImJwcT1hskc3C3CWuPrIQbjSz9ptnaMeaAb/YZG89+?=
 =?us-ascii?Q?luf1KsF6xW2rWRWrHaUzxfh36+GGrxvwuE4Ka9IIfXh8r/giLmYoB8z7I0iD?=
 =?us-ascii?Q?NzR53iiRVOvhRas+SFod7qF4gm+5ViCTw1LwABluG4mFBTQmhpDwucSrTs9J?=
 =?us-ascii?Q?uDI0++Ma/M4nxC5hbJFkqqlqFKDE72j/3n1FFim8ufQHviEr+7RssQ+KP6Gt?=
 =?us-ascii?Q?qnO/IgCwHMQwdWhKThyPG1HxqxAwuSEkzJyAOGARC21RdfRD+8hIlqD19xcj?=
 =?us-ascii?Q?vu+Mst4FTuxsKPiZwNjamLQbEZfMtw//ZULOfSsryUgEt6WylAnfbiRmlcM8?=
 =?us-ascii?Q?HmPdwNp9k626NggKy+xkSQJ/j2F5bgSXgWWVbUY/pj+h70SuXDRBSZygMTlU?=
 =?us-ascii?Q?xsiQZWHsu/Q/kWNn/GCaADSJij7OIT+PkXRLKyDVtBEDp5wxVLm9KuuScIta?=
 =?us-ascii?Q?AbLWA0Tpr+Jg1pTGvTJ/nm7t6D1/2NAnvqYbGI4/WimkDlbfbVnOZvy+5+xg?=
 =?us-ascii?Q?CHswYjyMIx6TX5MxygRIC3EnOGao55q61iSDcL2cLd99mx6/+x73YI6OXRGo?=
 =?us-ascii?Q?cci1iFkUTnuh2/CabIslodZAdu9EHAekJxV+EijmmHOgocxAZjHNXhiX1b0y?=
 =?us-ascii?Q?vKc9bzn4zcjVGM81uKG8f+qUgnQ95pIyDSBPqz5njP/VZhT4V+NguzBFZ7gh?=
 =?us-ascii?Q?kGJVAxNtOgjQpIa1XmBKjKysgbOCxE4HNf4iffyb1ROO8D+bW10teLlJuvvl?=
 =?us-ascii?Q?t6GiJw8QFOqk6fEe74u/6+9zVYR7VRl1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jCPuuc4c365aAHK0zArbGvtHGDObkboikngiqBAAsG6rsnED1wsToDxbb5Zj?=
 =?us-ascii?Q?dIfEt9KVqZ+WYA+GyFZzo7oXRBUuM8iEdgDYuvXXRhM98jgVslH2OfCTRAse?=
 =?us-ascii?Q?3q25Z+loU1WpQO/wWUCCo+D50wOZKjFQ5vnIAqkIT2Dmu65hPNtRK2lz5eoH?=
 =?us-ascii?Q?Cw+6GbkumS9K8tNElITW1lx//OzmR/E2RjQ8teS1jScpARRkkvYDDOmZ7TCs?=
 =?us-ascii?Q?ky5YT9R9vni1dTxd7D0/9uuh/o4ENaMbt325WTwQSX2w9PxLAUkCV9y3EAxT?=
 =?us-ascii?Q?cF/ICm9lPh/LS1+tGLqOQKHOyrXNKCz4FXi3OreRfYWJ7s19SIJUpP+kX2+L?=
 =?us-ascii?Q?At0+pLzIedP5l8GFt5+UC0/y5+o99YAyqN2yKioD1QZKAe8S9DhKZxCqdvhh?=
 =?us-ascii?Q?xVP6qwsBufWwygnyz/P6aEP2f9zBh62DJ9t550DDXGaC+4j7kLnGEjvWHOFb?=
 =?us-ascii?Q?IJct2zX+k2bMJHHaf/OIrRrLcS/zmGqfuwIJJkllmi3qGY8L6eWvr6SgYvmp?=
 =?us-ascii?Q?y2zSP2jFs/xoTKs4t8C2FxxB9PhoTLcCjSiHQiYlf//JEuigJjcY+ggIp3px?=
 =?us-ascii?Q?O8grOXS6lWrlNmMA3TDvKZnC4XxvmKdp+6Ie3E8mYaCLX8ytUiwLv0jr3ptY?=
 =?us-ascii?Q?Ly26Bkk9m0qz/LwlWKmAX1MezcSrZ3WFgmTlH52Lj6bkBGpOv5Mx7y6fSirW?=
 =?us-ascii?Q?uFlaPTXem4WiEQ704yeomqioHmHmr38mjDjzAWGdJ7/VaTJXjrK1lbLNGZZS?=
 =?us-ascii?Q?SBAzCt2lD0oRdVZpp/726NuS2Qd3ZdNaygc5pSiDuR8ZAyCFq+1mJR1PBRjG?=
 =?us-ascii?Q?8ARqubwzVwqzZJMPDpDRoTpHUyYWwC5cGdIZhL4EExZlFEZ9vjdN3pfrPDtq?=
 =?us-ascii?Q?KFtCvkLBQEeuJpWXHMGUIQkiU/q9ndQiGJMbMfpyhG8YSO0asPHOXfWHvtBN?=
 =?us-ascii?Q?hLhkJiaSLb2Pwa7vtFSubT1/KmA43RJjLGeBtV1TtafqbLXGs1hTrfFv/SiU?=
 =?us-ascii?Q?A6YnmkzP7KdlfVPq8iF2GRmSYfdg/HoBP4/uvK4Qjqvro0xcVg7CjynoTdZW?=
 =?us-ascii?Q?SPxKl8u6b9yNeQgBJ9PZ9/XighW55NK09L3oG7agVAboMoeL3m+sqMEuPLKV?=
 =?us-ascii?Q?ph7QQjjf3i9s5j/PgVOVTo7sU7QTYsZQb1ahpIinVdrAgMHLEDUBH+zxZ73x?=
 =?us-ascii?Q?cptEgrjOPJIC7uAgjjjB7yGabkIGBstd15IjJrr7lQLRvCKjIfSvA0S54Qzo?=
 =?us-ascii?Q?bG+6GakMTmjTPxtehBVswoqGpT4EPEmAWkTtGJTvZQhGys+kkYxU+93uRlT5?=
 =?us-ascii?Q?mj44BOJLnvtyM94kcV+cic7B+eeqaeLxQt1h25jNjFvuOsLPZatc2QMNl5Y5?=
 =?us-ascii?Q?ut+awvYHtB0U25RY8otU53PkEMb/ggC8wgh0Vakjb9KM5jIUasU+iv4w+ElR?=
 =?us-ascii?Q?If3qMzI1ZvO1Jak4vI+Gdvfg1htSw9Mr8JPWSTfcYSSGNhxNiQqjqm6YsciA?=
 =?us-ascii?Q?V081zM9TJ5YAc3DPqOsaK8QN3mQTomICdL9G/5pZrU2j1mVIEsJ9M4o618Mo?=
 =?us-ascii?Q?/C6GyJNO77I0lwKkqLQSXobGQFTfdzHMEoPe0tRP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa997091-730c-46ec-f690-08dd2fb2104e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 06:59:58.0246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VTFG+akFpVvmhxSZan5jklltpL/SsNHMtnewUzcIQ7REpnqpuCFHFj/eWMcmnmxj52rRW6hnhcUoCWM8z9Rl3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6890
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



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Mohamm=
ed
> Thasleem
> Sent: Friday, January 3, 2025 5:27 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t v3] tests/intel/kms_fbcon_fbt: Add skip condition f=
or bmg
> platform
>=20
> FBC test isn't supported on bmg, skip the test on this platform.
>=20
> v2: Add workaround id: Wa_16023588340. (Pranay)
>     Use IS_BATTLEMAGE check instead using devid.
> v3: Add workaround id in code.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_fbcon_fbt.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c in=
dex
> ab4819d23..9c3ff7a21 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -73,7 +73,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between
> fbcon and the frontbuffer "
>  #define MAX_CONNECTORS 32
>=20
>  struct drm_info {
> -	int fd, debugfs_fd, crtc_id;
> +	int fd, debugfs_fd, crtc_id, devid;
>  	struct igt_fb fb;
>  	drmModeResPtr res;
>  	drmModeConnectorPtr connectors[MAX_CONNECTORS]; @@ -418,6
> +418,8 @@ static void setup_environment(struct drm_info *drm)
>  	igt_require(drm->fd >=3D 0);
>  	drm->debugfs_fd =3D igt_debugfs_dir(drm->fd);
>  	igt_require(drm->debugfs_fd >=3D 0);
> +	drm->devid =3D intel_get_drm_devid(drm->fd);
> +	igt_require(drm->devid >=3D 0);
>=20
>  	drm->res =3D drmModeGetResources(drm->fd);
>  	igt_require(drm->res);
> @@ -457,16 +459,25 @@ igt_main
>=20
>  	igt_describe("Test the relationship between fbcon and the frontbuffer "
>  		     "tracking infrastructure with fbc enabled.");
> -	igt_subtest("fbc")
> +	igt_subtest("fbc") {
> +		/* FBC disabled: Wa_16023588340 */
> +		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported
> on
> +BMG\n");
>  		subtest(&drm, &fbc, false);
> +	}
> +
>  	igt_describe("Test the relationship between fbcon and the frontbuffer "
>  		     "tracking infrastructure with psr enabled.");
>  	igt_subtest("psr")
>  		subtest(&drm, &psr, false);
> +
>  	igt_describe("Suspend test to validate  the relationship between fbcon
> and the frontbuffer "
>  		     "tracking infrastructure with fbc enabled.");
> -	igt_subtest("fbc-suspend")
> +	igt_subtest("fbc-suspend") {
> +		/* FBC disabled: Wa_16023588340 */
> +		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported
> on
> +BMG\n");
>  		subtest(&drm, &fbc, true);
> +	}
> +
>  	igt_describe("Suspend test to validate the relationship between fbcon
> and the frontbuffer "
>  		     "tracking infrastructure with psr enabled.");
>  	igt_subtest("psr-suspend")
> --
> 2.34.1

