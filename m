Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCAACFA762
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 09:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB2010E803;
	Fri, 21 Nov 2025 09:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGGoPuSX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B466C10E803
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763717218; x=1795253218;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=INKiGKDQK59vz/dIF20jE0EePJtBk3ZYSUVokEvnS6s=;
 b=jGGoPuSXRc2Coy8DqhMb9JplxUhqigYXwaJ7gsmLKx1z0KqRsrmzEGN8
 JvOj1UYUBLSDv+5y7DirBiVG/27cC9HtfMKyJQDVn4D7t2wdAamB1jRyW
 5ww0V9GBP6SpuSfmk7hpMpbJ76eS0wbv4LVuXZJdxYoBHSq36Z0XHXLeI
 FvewSljkAo4oKVjKVGtXUzZ9bhQHWAbJ+8EirvGlt6r+NsNeynp+WgEJo
 ENhpSISXntC/PT3s52Q+rGS9inJZTLkA5j3DUWQndMtLwPcWgn/EQojPQ
 EK8td2XrrCeOnd4/b2JRBiCza4O1S65W9Y1m3tRz6adFeFxSiI9w97pk2 A==;
X-CSE-ConnectionGUID: TgPNJXt5REaRDBbG7bu9SQ==
X-CSE-MsgGUID: FxEYE7+wSCa+ThF5Vo8qGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83196558"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="83196558"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:26:58 -0800
X-CSE-ConnectionGUID: zym+gKC0QVeNfWPcH7h0SA==
X-CSE-MsgGUID: JI/cunuJTfaO36UAm/rRKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191436843"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 01:26:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 01:26:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 01:26:56 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 01:26:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXjSUlzfEH6ox0P7t4FQpktj597jezZ4RPBsHnDNBgKOhe/QtJvLrwJ/U1UBk4AfxE0aNJJXFWQ5fSziZIBGCC85W8FQ9PqyiCNkEB1mIE3Ztz5ZdVhxyhTy991JyhuaGaNSzbS93b1h4r6oac14jBjviqz3X0jBk5hFboTU1zrkLMqxsG9Jh1faTFoEG7+0ynEIZT/4qoTEFCfsQgX3xifMKV5VLL3TRxCZuTFoYJixpsQQGPvddWwCq/aO4mfa38wC9tMegdqDO+NUv5vGS+ZVzq4LcymiaD4jSzHRbHDdfghgTClyG7d2AxKAS00+klzISDrm/xaTs6kCNXaZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LmuxR9JHBCkT3NjIGSyMHtbi2fqAPFmog4MWQP+gBI=;
 b=B7znDaIp+3NeWALcoNhuVYTfh4l3ZL2W/JZL0iPAs3bDd9/Qbnw6KqAjpe9/1dG1OwwTIU7YjpHRx5XQMnfIkVyG4b2Qi3illvFGAAEww/R4yJS8rv31GIcVBP7uwVL8FvOgcen3aPl3oqfBpCOAeDXb+o3T9rl27rJ4wc0hbK+2c2YIjrtvcFYaKhz300HPe5P/I3rXenVb3mUyPETx+GA64o9KEiWjIMLly48pB2hTBoZQX0wTJz2JZ3oSrIcD9if009JDMeWJtrg5RdlR0ToncAXU5x2Lc4G5qzeCmO5Z4WMafE6cE2aPJAHbvCKnjIyjzf4mrmsict+72AERMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ2PR11MB7476.namprd11.prod.outlook.com
 (2603:10b6:a03:4c4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 09:26:49 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 09:26:49 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v3 10/12] tests/kms_writeback: Add negative test
 case for invalid-format
Thread-Topic: [PATCH i-g-t v3 10/12] tests/kms_writeback: Add negative test
 case for invalid-format
Thread-Index: AQHcWql0m1wUjXFGEEC4ownD2Ooo+7T83EKg
Date: Fri, 21 Nov 2025 09:26:49 +0000
Message-ID: <DM3PPF208195D8DB3882F346A7A6F398959E3D5A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251121055839.3116906-1-sowmiya.s@intel.com>
 <20251121055839.3116906-11-sowmiya.s@intel.com>
In-Reply-To: <20251121055839.3116906-11-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ2PR11MB7476:EE_
x-ms-office365-filtering-correlation-id: 7666f6c6-b67b-432c-99e2-08de28e01974
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?s2E75aefsv0+ZCvuGnsxHlb/abpJrcaxc7zTR0i0N85f2pdruX7hJE6a/vK3?=
 =?us-ascii?Q?/QIYNSbOvelfK1ami0d2DelWEPWOWjeMmPHNo7/3ByKxTXP52q/5/78ika7o?=
 =?us-ascii?Q?B1bFyf+npfTih5IkrJ1ypdjgGx9ZiOM6i05orZ6qtw1gcMK+JlptT3q9UHDj?=
 =?us-ascii?Q?Q3J/wA/OIOfE6JY3JPTssqGc9yt2U2u8EgnE6ThtgFz7XSgASNBB0BXgFE7H?=
 =?us-ascii?Q?lpL8/0JaNmmckRSU8/y1KXX2AyqmdHyj5e6KqPhzTFFqkQ0v3Hzawa1clgjS?=
 =?us-ascii?Q?C6Siwv7k8uGM+7Bz9Pc1v4O1TSoKC+vDodxPIearFWrxonwuafX7e7hsUU4G?=
 =?us-ascii?Q?AJ3H1TL3QSbbQ43X2SConEFYn+MCjFtARLze5xmryxiCvl4NIouHQA8rD/kf?=
 =?us-ascii?Q?cZDAURF18ShRjPCNl2A+uuBYveo8Y8dNKoXTjTSEbToiSdUTYFgBTVgTdPvj?=
 =?us-ascii?Q?XOdeyACXfy/ZUqAJDy6H7m9g4t4QlT4hR6xel40WyFrivBjiuQtJE7TN6/3S?=
 =?us-ascii?Q?N6GQLahunu1YNWT8E0Q/fpzt7WKRfUccytcbiQQLDYXnDhRfkHdkVBRZVuB4?=
 =?us-ascii?Q?WT4hdU4GprwHDOR/dy/6/Oqq+DodpgUaO60rbIlcB9kl8NW0pt8gYJ57eezK?=
 =?us-ascii?Q?OnLGEUVwGL510n1Hsu7Z/bWIj/9UlglUiXkxyHl2RGdenW+nHmkq0yW5Him9?=
 =?us-ascii?Q?2/mfzx0bMeQ7HlcgbsxX2FMrY/JlznShdJ9wKUPLJ6LaMXlcf5aPP/qjTbRn?=
 =?us-ascii?Q?zlm4N6WD4zx0d/HsKPnzEsJUPECnvCSm4d0B8B4VApJ5XGZQdH0abtH0L7kQ?=
 =?us-ascii?Q?2Z3K7RaVmBqDYYEtvQ0lE7HMlxqchmdrSI1HRoYgCijmFgopIihG5Pcjv0WU?=
 =?us-ascii?Q?ixLankbwtGEbK3H5ijyfMVFkqIEQoMsOSk8pM6vb0cCr6Mayp3gIGgQE6WRZ?=
 =?us-ascii?Q?jsa7jR9xta8cDWzCHmgUkkeRuWJoEzeFGPql0bm3bAPu9FaQUDjoJWenLeTn?=
 =?us-ascii?Q?zLg/oitlFPoXXBOj0xkmgqg2A08mASxNGME3d8okoxMJfIdiMl3h2Lvh4jQP?=
 =?us-ascii?Q?c/7B9ni1rz9QFFPR/dSbusEg8/NMNzvA5Noe/5SdiyTZxcWTopwipIOCWxhI?=
 =?us-ascii?Q?dpouydLt/8gAwlN48P0CSnGbLcUVXiAc8CjzRJoFkB2Ul6HaJh2OCxyJ735k?=
 =?us-ascii?Q?We//3aglk1OQHG5BoHCEcFnuox1+T5nIFe/1YWiCb4lhAB9uYJMDH+NA7Poq?=
 =?us-ascii?Q?Snx/lKB2ZZvMdwJEKNObqeJgSjhEn77U+YPimfCGuKBRjWnefmgk+966GAE5?=
 =?us-ascii?Q?pSBc3dce1XjNMco5V5PTALQQ9R5KH04krGrKm7ztb9BvumtSKstsz5cifgAb?=
 =?us-ascii?Q?spBZVz3lHEtHfEzejfeK9hALnLB59X4R1Htf68/vpPJt/aivvNeAdbusH6eo?=
 =?us-ascii?Q?wPrdGdGW2PSWdrlobpapzKynPZB2aKgZ2MJsHFuOGXXvLciFeZL37Va6EDkg?=
 =?us-ascii?Q?DBlCBgLD+kPUhBRfYikH7ADgiKTspCFXGCQ6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B/Ys3crp5Mb7mccguS7JrBEKvnoIJ2w+t6TEsya4/LVQhkH2/w0DkraqoXeS?=
 =?us-ascii?Q?+K6s/ROOVvpJTsOU8YcsqaG7Cg9i9v0cgGLqKJafJQl0UDNKPb7MLvIy/nFq?=
 =?us-ascii?Q?tqkrqRZJewL3+hV6wU7wMURUg26AyV+ppyDnInw4cM4b9tJarb7cu0SXM2vr?=
 =?us-ascii?Q?/XynE3E0e4714OGfybRMUDFgPFuUAuTacUrDdiLh4t1lYC7Pp95i5dAg65Nq?=
 =?us-ascii?Q?YndVvdojdD40X/M2V0OSdU31iA2l/3zKk0lkEjihv8Somq78RdenaJRG7sFC?=
 =?us-ascii?Q?lOFn5lHRuQwn890l5cHHCbryHNWsolQuAtQALajemoxJMyIkCNkY7m9lxFX4?=
 =?us-ascii?Q?t8Iu3kXBNKhZaZw81K5Mfj5UmrkFsAldLuMEePqYRG1yUxnej/Js4VawPhN6?=
 =?us-ascii?Q?MgUF6NuzDz/Uy2g9E6DAEaFnPHIUIKXAy9WTG+VjIxOe+dY1xPMA+/yCFdHh?=
 =?us-ascii?Q?T47kvrlrlMMzykgZ3cQtWCU4t6DUj7yD9epfYiCPMhVOVaK75JKI//Oclenw?=
 =?us-ascii?Q?9pS/n+rKyxNLoI2tQ7k+wAVm6ZeO4bVgX8FtFUI4tyscde8GaP/a/Ac+5R/D?=
 =?us-ascii?Q?0Uv/qViy+P3PmAW+KwbwYn/jq/XZle1DaQaSZ9iTsJF3vNULy6NnVGY3SZtV?=
 =?us-ascii?Q?HZBScM9MTy9cLpRf+bXq2pHMQuz1JYjY/lTZrlZ4iOFJ85FsHfCzbub5HUV+?=
 =?us-ascii?Q?ha4ymDk/N7BZ8gZEKFCV3mn8Sx6GEwgg/u3UHqOOHMc7szA9a/6bFCXfoaZ5?=
 =?us-ascii?Q?7BI0G/8hlKP2Ch2wj4W1QGOmRY0Uyx/ZSTS3B3Oz+ZGocdSOwGQUjCKfAUCa?=
 =?us-ascii?Q?9y/oUVetiWKcfzAJEpatuDftYPNN1YPmSyBmIOxyTi8n3SCpmj8DYFk9qJDm?=
 =?us-ascii?Q?NiYmpE3GRt8NoW6kT1FBUG+XdSgFTVKAtFm8082ZAghygn3N7+HoAiUsJIWc?=
 =?us-ascii?Q?LRdUub92Ti72+d7tvnhXh3Mbz0ErDrRr4W91i6yllEqX482mJWPrQmxDig8N?=
 =?us-ascii?Q?1NLVogakCBKl5iWu42/1kbCtgtRNW320mhocD+frb/YlTrj64u8jOsNb63vd?=
 =?us-ascii?Q?d103gjvFuW9sdf5MHCA/3otrtdVKbIdqAqW8ZTH3GC5zX5Ho055R5txyimOn?=
 =?us-ascii?Q?SNdstIrWbE3Z+Z6V3MkEoYw6fkGHjqvKjaXBBF7iGCuvcciHEpxZFCEErUwJ?=
 =?us-ascii?Q?4LsM38BMi03fdPpjH1iWhKi8aXQgvzRjZzNYO0N9yOHmbK9S2kcrYPyh2nUZ?=
 =?us-ascii?Q?CJiVNfK41hKF9TUEzgQmK5nivXfXXbTQH0aXEIqU8qaQLRXRqng/GKK8fBgW?=
 =?us-ascii?Q?LN0DT6kNJLx4WXBHUi9uFI6512n0lap4bYGlto1vCB902dhDFlBh1pGMa2gg?=
 =?us-ascii?Q?OlSaCBg2YZCNVVOpaMlibyuDzoQVPNA5wV7hXFDL0gQJpdVA/4ipvxbpk+hQ?=
 =?us-ascii?Q?vMmdr9t738YQiHisFOH0YKCUlFHvHyDdf0e34ZV7AgMr8Pt3wXqRpSVBJizl?=
 =?us-ascii?Q?+phz8eae83lJvYnO47w/HMwvhtnPLIyIB4liIIaMSs15KUqMAH9iJswxwcE2?=
 =?us-ascii?Q?StlQI3rYRn97y4Yi55il3QyruRQhGvjoKCe8LNgz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7666f6c6-b67b-432c-99e2-08de28e01974
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 09:26:49.7974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 24YxxMnyI/NhBHuWIRGC/XuW86+xavd9TlbTY2DhXjyiqFmae368rqVK9gVgsZNWA1Sy6i2BEcGN/ZINqbImPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7476
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

> Subject: [PATCH i-g-t v3 10/12] tests/kms_writeback: Add negative test ca=
se for
> invalid-format
>=20
> Introduced a negative test case to validate handling of invalid-format
> inputs.Each case is now executed as a dynamic subtest

Don't add tests in a patch series which is aimed at refactor specially if t=
he refactor was not done
For the purpose of these new tests.
Same for patch 11

Regards,
Suraj Kandpal

>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  tests/kms_writeback.c | 38 ++++++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> 581963fe6..c35d1f948 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -234,40 +234,54 @@ static int do_writeback_test(igt_output_t *output,
> uint32_t fb_id,
>  	return ret;
>  }
>=20
> -static void test_invalid_parameters(igt_output_t *output, igt_fb_t *vali=
d_fb,
> igt_fb_t *invalid_fb)
> +static void test_invalid_parameters(igt_output_t *output, igt_fb_t *vali=
d_fb,
> +				    igt_fb_t *invalid_fb, igt_fb_t
> *invalid_format)
>  {
>  	int i, ret;
>  	int32_t out_fence;
>  	struct {
> +		const char *name;
>  		uint32_t fb_id;
>  		bool ptr_valid;
>  		int32_t *out_fence_ptr;
>  	} invalid_tests[] =3D {
>  		{
>  			/* No output buffer, but the
> WRITEBACK_OUT_FENCE_PTR set. */
> +			.name =3D "invalid-missing-framebuffer",
>  			.fb_id =3D 0,
>  			.ptr_valid =3D true,
>  			.out_fence_ptr =3D &out_fence,
>  		},
>  		{
>  			/* Invalid output buffer. */
> +			.name =3D "invalid-output-buffer",
>  			.fb_id =3D invalid_fb->fb_id,
>  			.ptr_valid =3D true,
>  			.out_fence_ptr =3D &out_fence,
>  		},
>  		{
>  			/* Invalid WRITEBACK_OUT_FENCE_PTR. */
> +			.name =3D "invalid-fence-ptr",
>  			.fb_id =3D valid_fb->fb_id,
>  			.ptr_valid =3D false,
>  			.out_fence_ptr =3D (int32_t *)0x8,
>  		},
> +		{
> +			/* Invalid format */
> +			.name =3D "invalid-format",
> +			.fb_id =3D invalid_format->fb_id,
> +			.ptr_valid =3D false,
> +			.out_fence_ptr =3D  &out_fence,
> +		},
>  	};
>=20
>  	for (i =3D 0; i < ARRAY_SIZE(invalid_tests); i++) {
> -		ret =3D do_writeback_test(output, invalid_tests[i].fb_id,
> -					invalid_tests[i].out_fence_ptr,
> -					invalid_tests[i].ptr_valid);
> -		igt_assert_neq(ret, 0);
> +		igt_dynamic_f("%s", invalid_tests[i].name) {
> +			ret =3D do_writeback_test(output, invalid_tests[i].fb_id,
> +						invalid_tests[i].out_fence_ptr,
> +						invalid_tests[i].ptr_valid);
> +			igt_assert_neq(ret, 0);
> +		}
>  	}
>  }
>=20
> @@ -664,10 +678,10 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  	igt_describe("Writeback has a couple of parameters linked together"
>  		     "(output framebuffer and fence); this test goes through"
>  		     "the combination of possible bad options");
> -	igt_subtest("writeback-invalid-parameters") {
> +	igt_subtest_with_dynamic_f("writeback-invalid-parameters") {
>  		uint32_t format;
>  		unsigned int fb_id;
> -		igt_fb_t invalid_output_fb;
> +		igt_fb_t invalid_output_fb, invalid_format_fb;
>=20
>  		igt_skip_on(data.dump_check || data.list_modes);
>  		if (is_intel_device(display.drm_fd))
> @@ -689,9 +703,17 @@ igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  				      &invalid_output_fb);
>  		igt_require(fb_id > 0);
>=20
> -		test_invalid_parameters(output, &input_fb,
> &invalid_output_fb);
> +		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> +				      mode.vdisplay,
> +				      DRM_FORMAT_NV12,
> +				      DRM_FORMAT_MOD_LINEAR,
> +				      &invalid_format_fb);
> +		igt_require(fb_id > 0);
> +
> +		test_invalid_parameters(output, &input_fb,
> &invalid_output_fb,
> +&invalid_format_fb);
>=20
>  		igt_remove_fb(display.drm_fd, &invalid_output_fb);
> +		igt_remove_fb(display.drm_fd, &invalid_format_fb);
>  	}
>=20
>  	igt_describe("Validate WRITEBACK_FB_ID with valid and invalid
> options");
> --
> 2.43.0

