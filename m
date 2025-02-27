Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B416CC19F2E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 05:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C8F10EA42;
	Thu, 27 Feb 2025 05:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IynVQRSY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB4B10EA42
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 05:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740634176; x=1772170176;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6eOyeILmteLqPqB400DW+RDNI40uy8bG0r7SOWaCnNw=;
 b=IynVQRSYEciSXYSCa5a1fGDZplg9wsrWkt0yqMa3CSgDdCM5Ccm5vTI5
 /l5S6LxnQRP3IymvW5c2jCy0CbzeF0Q4B+L0ghIz3zogTDlVa8dTJL45r
 RvhrRrl3hrvrRbwu8xvz9Sdedyc7RAe5oOs9IWkH0kTboiHZvmR33kRvG
 MJ0JoIATWX0CvYbG/ju2ImLcqtcbus09GIoUWb45PbpL/3Lsh5ieaj5JD
 INKo3tMw2n6HT9U3+dwlVS9MaYm8l45mBSWEpHgY9eykYyq1OdlCcFP9H
 mxkYY8cbOyQjHxzH7LTUsLUALA0v/tyUErNUQZUDLOkb3pFa7MNLFUC4p w==;
X-CSE-ConnectionGUID: 2iRsKBNHSeapwvFxOM5bOA==
X-CSE-MsgGUID: JZKvnTfcS46B0+S6Av+vDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52906603"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="52906603"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 21:29:36 -0800
X-CSE-ConnectionGUID: e5/JLrLASYKurp6HeS83Bg==
X-CSE-MsgGUID: NJECqrkjRDSnps+gmnEV2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="116947605"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 21:29:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Feb 2025 21:29:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 21:29:28 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 21:29:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6aSfActqRMR8FT8+NzpSih6dbfSyIkq5L/pK5HyuSk6ofd3SkoTsSVjC0eE+s6p0Y9mTS0T3F0iXV13BYIU1o/oHZcf/oqSuZhQBQoGa+4S54OWK4LPiui4NySFSbJ4TmxkV2nOu+hm29I0L4FDfglkvmCg/Tb9pxZZkUjLZhc+MZv9scguFwWINacI6nWFB7NdxelUdazV1+tqQ7QyYW8XrT9CClWOfCUB6tLvJEnde2VwqD/NqyO9n8VJMAcYqRQ5hCjMJNiGYYbSV/XE5Ohu2rL13Hqhp2ctfHiQE5M9teer0n4UKdWfkoGz0+xK8HYAV/JSA8mdB0Qe7KCyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlQwRSoq/zkx+iTs8Q0ZPafqOPvddo1Huk7Z/uMJ2D4=;
 b=XKOgAKsoS2+rMvYKDR3aQygN0n0SapYiVkJTIEcJYWUI9L89bTtrF7D8SgBSyKfqtFVjGg1xdg9KDK5yD1OACLoDmrCFXXa+/G8qt4WtH0zRCW72qrNlovB2Ik1wKeSu3tdVy/hSHyVEmeN4O8gMAs/L4YHXbf4/TDA3qEFyXqjFiE2TNYYxGpw9bKPbxHzQB6rFauUkkCI+rHX7T2Z00I2JT+zwgvLIOyg5lSl2Q7JDnUhTdT261SC8pBVutD92Brv1uRj+fqNB874frIX6TYtcw5zGPBClVn0fFkG+id9h/yN69Nv7Mns8iycFng2YVElEJHo/QlrmhFayHRye8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH7PR11MB7121.namprd11.prod.outlook.com (2603:10b6:510:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Thu, 27 Feb
 2025 05:29:26 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 05:29:19 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dugast,
 Francois" <francois.dugast@intel.com>
CC: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Inject errors during
 exec queue create IOCTL
Thread-Topic: [PATCH v3] tests/intel/xe_fault_injection: Inject errors during
 exec queue create IOCTL
Thread-Index: AQHbh1ZzdfnYtHgGbEGQ3Chy5QUVLbNaoQiQ
Date: Thu, 27 Feb 2025 05:29:19 +0000
Message-ID: <CH3PR11MB8434BAAA2CE8B88FC97235FB8DCD2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250225073404.252344-1-pravalika.gurram@intel.com>
In-Reply-To: <20250225073404.252344-1-pravalika.gurram@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH7PR11MB7121:EE_
x-ms-office365-filtering-correlation-id: bc09382b-e78b-4285-29f5-08dd56efaf65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oDa6MW78SQYjE0wjTXI67HtiK42M81J0T9Rvjh8zOTgnBt+zNy+kQdj+B/NA?=
 =?us-ascii?Q?jOj0vPMX/EF53FcWY1BkWjWDRVJKVjfNOdMapEotZhX76DqecrDyii/LjC8H?=
 =?us-ascii?Q?5VoOr5Ae1KjQMeSAJqE7QW9pyWmW/i90edOlmvXyzA1DKSuy8bZRBXG8ycPZ?=
 =?us-ascii?Q?PPhoOK8h4nP8p9dbXKRSoSbB0JJGaD8GUxKhQ+uSSTSt1/o9JYGGPS1P2g6f?=
 =?us-ascii?Q?Tof/IelfZf+P6sOtu7XJgdT9p2jtzpIGHVyH4kGZMGS67FP0BPaoLmoNFL2K?=
 =?us-ascii?Q?GG4reoCNwaHLEsWeG5uBkWDklOWdv4HebKyn9C2oTfqqjOx+2aBuAHwoPXYz?=
 =?us-ascii?Q?F2S6q6CWTw9FN6/jwstP+ShxfmuY0bVWRmlrHdx4IIyoNmxX+4cdJ1BzMwlW?=
 =?us-ascii?Q?osObfaHEyDPli6bnpq5BXT2J/MxlBYX5RaVmes29+KTGQGtnPV+10cSYs2j+?=
 =?us-ascii?Q?EYrIzv8lO0uUbXyDkv2hMK5Kg15dn21JEikn5LioiyuaCp3v+oxEk8IsnhFM?=
 =?us-ascii?Q?MIBZfs0apqLZHLa/UOI9aPaooH1YFvHTwr6pvpr8PLYvtarf3Z8ZDz4GrUZx?=
 =?us-ascii?Q?k6pAbKQIWgvmwrVghMv/QgnxzYtzZf2+l0DTborSnDNwiO8g4Tw2kvs3Q+WL?=
 =?us-ascii?Q?dPYIsknKjt/7g/JjfmLBnhubObhQ7Zp8X1cBzSAoYYz3EFxh2Ige+9K4uN1k?=
 =?us-ascii?Q?LDvYedXNl9QDmsvypuiv3/NoOvyrUmhDPJI8lZnkS9QgvoBc6Lb21Z8SABi2?=
 =?us-ascii?Q?NEeWyg2cevyDTzOzWDSTnBHdRYzKrY95/COpWSRcViw9SPqBfuwx02Rpo7Vc?=
 =?us-ascii?Q?ew12h9jr//cbAwb3ppVqurJVwZnQt0lepMiDQf2JIItGkmhZ5qjQw9cJbFju?=
 =?us-ascii?Q?rFsSvrAcXeU2FXtkTxSGd1Wc2T21sDt/FsVc1votZ+sXs7a2yLum4/HLo8zW?=
 =?us-ascii?Q?EwiMjLnSIJxiJ7dfkEzLqT+ZVVNXmh3Kx5jIf4K/7v/BXwSzXKO+2lNVGMl2?=
 =?us-ascii?Q?Ckez+92drdaO+nYnRNOHA3/6XitU1vzey8o8h9NqGiNTQkO7aodVvxjXToKA?=
 =?us-ascii?Q?IJBtVCf/cGg3Ztx3AY4CHE8FxTCjDGjszFcHDC65zGvPe4+A9A6/9v34XnEJ?=
 =?us-ascii?Q?4rql356R8rT+RqxtyQoqx8W3MnDL/t0kSsJfQgygs0eo6YD080bdJ9Sq2HAe?=
 =?us-ascii?Q?C8woK6HyYtkxy48RbEa9zcxx930OPGu0YetuwqmAYpqDkUsgvPeUXEPw8aLM?=
 =?us-ascii?Q?KTS+hjUPfx23gDcVTAWX6OI4QBvcASb8fygkcLKeGq6ONf5Mq6HV3TeLc3+w?=
 =?us-ascii?Q?lbKEJG1F0EeGp0sApQ2RsclmWTZQZpVEV9rkO42a3ywoFCCqNCNE05Wx8tuN?=
 =?us-ascii?Q?OSlHvcYu0qbd1AKXLy1rO+cd7etP/dx1NyLFMFdUJzjQqvlwFA/2VfjyQ3Wd?=
 =?us-ascii?Q?ftf9LxOg1QAe91UwfDPqY0GcwWkD0cpQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0AYao8X+SUNa/thJe6iagV+FEBMuH9dWDIVPmlLbGLmkmZv4Md1icWG1KxVu?=
 =?us-ascii?Q?rb8sOktPUTXK0Cv7WFX0u5UxA+TJnTtHzPh1QaspM15+oWYvuajObVqPZWqx?=
 =?us-ascii?Q?CFoCK45/ivWMrmyYclLPhWOjAwywSR/3cb+W2M2ALpsDBoulwAHseBEhmMAR?=
 =?us-ascii?Q?5DDe27/TiTzoMLGqkLxfUVxvJaeDFcxrvharpnfHgi04fEkCg/VXQiDi24fR?=
 =?us-ascii?Q?7AzzjOoRmsGy2vu0EJZPue55Px89gfWdaWNrZ1Y5UCuDH1DqcqKSJAc1H9pg?=
 =?us-ascii?Q?h+3dHdf5I5h8dzltEG+9dnqOtjYqwIS1Zf1HfNpC1gHIfAJwRyfAzx/M6c+/?=
 =?us-ascii?Q?lZQhQD+P+b4t9OZf9oUGuzHmRckxgEa/m8GLLEU1TrSISqiR+0fBXe+ommcv?=
 =?us-ascii?Q?Rls8aLCbvCTMJlbeVfMatp2JUdgT1GQBFoJHY6VvwtoaOXycxzFjDPeN+6wM?=
 =?us-ascii?Q?Sz9lYfj53apP1R/qWykUcqMQHXPaP9726LlJaBOYx0dOECstgxamBYmGNz1z?=
 =?us-ascii?Q?qJjaIz1g5ipyx0JnM2XNGt8sGDquDP5V8nEJ34TijOpEOpp9Gc/WOzkDTklw?=
 =?us-ascii?Q?CkFvXgPRLLcSLiRk8TE+4Pb4+sR3BVjA+bcQ5TJp3xjboZnlQTOG8HyY56i6?=
 =?us-ascii?Q?ggGiy4EVeeJmfgbzwJDv9OG2qM5EDUdlogWX0qCYu4P5I3vEsv3z9I5yf4mx?=
 =?us-ascii?Q?tzr5EMlJMdCqVlTsjSl4bTtCdiSbDmIbsoLhQBcaSS5nfcKEXm8k5nwe+4iX?=
 =?us-ascii?Q?F20voS7SeHTQ3OUoRSTe7zJv1UypWdILaQN6AlgOjD5zH2L4n3XAPYT4656J?=
 =?us-ascii?Q?GrJhIKxYRoLMqCJ2wYb/QCXm7qbksyZn/3TBbWgphZdHQkvMj5Eq9e1ELE29?=
 =?us-ascii?Q?J54fOnFbvC3qoY83TO4GcYsncrn9IvyBbWqTzKYPLYLY+kmnD69YYCRYlIMn?=
 =?us-ascii?Q?NOTUpvdH4Ws2p5zvZKA+YvhZuKZemn+HZXC4GyvMLyCq1Wv0FJKYEjEG1CKz?=
 =?us-ascii?Q?rzCooaDY/PLck4Tv249S3p+a9FLlNpsPfnyNBZlH9S94lNOaG3mL00E/Hurl?=
 =?us-ascii?Q?DMirlxccQ/T3zLjJApMa5flh1aIyYevevSVlBgRQDXZOMiHYb/1T1JMEVlhU?=
 =?us-ascii?Q?idqM8tid4VpDAueST1D7BN7CO8MtvicNS79ZZ+RSxJQOsVleUT/vtp4IDXRB?=
 =?us-ascii?Q?d3SkdR/+A1OoW0xL5UZ3EFcFSt5+WHuwPOh2nMXsfL9gD7dML28ZaH843ZqU?=
 =?us-ascii?Q?rCtURp70nthO2j7yeg0e4iRX4YmexXsyPusTm95BVqVZFDYu8V4NRbIcWmnn?=
 =?us-ascii?Q?HaqPPtjkUS8ilCtdL+PLleoJFmvV7RAnKGSmubfnHTf0zCQLNr3Lwpl1e/yx?=
 =?us-ascii?Q?lbxChWpwESMLD7puAB14MYgp8l9SHqQ9OZW1ns8y1TbQO+VJVXE7sYQvXZ/j?=
 =?us-ascii?Q?8fAowdMOOV7z/HXEUwQkdTDeSNz4LRywsOQlffk9hz4NH2bFcxGGfg1UU9Us?=
 =?us-ascii?Q?CMq9pgcwJfR6j8Nr3jVYjeXsyV+8JCLlsvokSzf1Y07anXSJ1tLSKH08xJNW?=
 =?us-ascii?Q?cq5Ha5FdX99iii9gXKhlpA8cHcMk4dswstuNTfUV/cCuqUbQhLVZsLv/7u/4?=
 =?us-ascii?Q?+Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc09382b-e78b-4285-29f5-08dd56efaf65
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 05:29:19.5700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xW1gNh/BmsKVHsAhwn3+VhEGoYXIzuH1q7xj4YMV/Ec4J1yx58NftYNTeeZEeqi9Ix4iXX6DTPLbRaqnT4Z7Op+CcHEoN1xzr+BxMjDa+J0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7121
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Praval=
ika
> Gurram
> Sent: 25 February 2025 01:04 PM
> To: igt-dev@lists.freedesktop.org; Dugast, Francois
> <francois.dugast@intel.com>
> Cc: Gurram, Pravalika <pravalika.gurram@intel.com>
> Subject: [PATCH v3] tests/intel/xe_fault_injection: Inject errors during =
exec
> queue create IOCTL
>=20
> Use the fault injection infrastructure to make targeted internal KMD func=
tions
> fail when executing xe_exec_queue_create_ioctl() so that more code paths
> are tested, such as error handling and unwinding.
> include xe_exec_queue_create_bind only for VM_BIND engine class.
> xe_exec_queue_destroy_ioctl() and
> xe_exec_queue_get_property_ioctl() are not considered as there is no
> unwinding code to test with fault injection.
>=20
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 50 ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 7ae941367..f25ad9b27 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -185,6 +185,37 @@ inject_fault_probe(int fd, char pci_slot[], const ch=
ar
> function_name[])
>  	injection_list_do(INJECTION_LIST_REMOVE, function_name);  }
>=20
> +/**
> + * SUBTEST: exec-queue-create-fail-%s
> + * Description: inject an error in function %arg[1] used in exec queue
> +create IOCTL to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_exec_queue_create:                 xe_exec_queue_create
> + * @xe_hw_engine_group_add_exec_queue:
> xe_hw_engine_group_add_exec_queue
> + * @xe_vm_add_compute_exec_queue:
> xe_vm_add_compute_exec_queue
> + * @xe_exec_queue_create_bind:            xe_exec_queue_create_bind
> + */
> +static void
> +exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance
> *instance,
> +		const char function_name[], unsigned int flags) {
> +	uint32_t exec_queue_id;
> +	uint32_t vm =3D xe_vm_create(fd, flags, 0);
> +	/* sanity check */
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> &exec_queue_id), 0);
> +	xe_exec_queue_destroy(fd, exec_queue_id);
> +
> +	ignore_faults_in_dmesg(function_name);
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> &exec_queue_id) !=3D 0);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> &exec_queue_id), 0);
> +	xe_exec_queue_destroy(fd, exec_queue_id); }
> +
>  static int
>  simple_vm_create(int fd, unsigned int flags)  { @@ -283,6 +314,7 @@
> vm_bind_fail(int fd, const char function_name[])  igt_main  {
>  	int fd;
> +	struct drm_xe_engine_class_instance *hwe;
>  	char pci_slot[NAME_MAX];
>  	const struct section {
>  		const char *name;
> @@ -318,6 +350,14 @@ igt_main
>  		{ }
>  	};
>=20
> +	const struct section exec_queue_create_fail_functions[] =3D {
> +		{ "xe_exec_queue_create", 0 },
> +		{ "xe_hw_engine_group_add_exec_queue", 0 },
> +		{ "xe_vm_add_compute_exec_queue",
> DRM_XE_VM_CREATE_FLAG_LR_MODE },
> +		{ "xe_exec_queue_create_bind", 0 },
> +		{ }
> +	};
> +
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
>  		fd =3D drm_open_driver(DRIVER_XE);
> @@ -333,6 +373,16 @@ igt_main
>  		igt_subtest_f("vm-bind-fail-%s", s->name)
>  			vm_bind_fail(fd, s->name);
>=20
> +	for (const struct section *s =3D exec_queue_create_fail_functions; s-
> >name; s++)
> +		igt_subtest_f("exec-queue-create-fail-%s", s->name)
> +			xe_for_each_engine(fd, hwe) {
> +				if (hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_VM_BIND &&
> +						strcmp(s->name,
> "xe_exec_queue_create_bind"))
> +					exec_queue_create_fail(fd, hwe,
> s[3].name, s[3].flags);
> +				else if (strcmp(s->name,
> "xe_exec_queue_create_bind"))
> +					exec_queue_create_fail(fd, hwe, s-
> >name, s->flags);
In either if-else case you are trying to validate only for  xe_exec_queue_c=
reate_bind out of all the list, what about the others {"xe_exec_queue_creat=
e", 0 },
+		{ "xe_hw_engine_group_add_exec_queue", 0 },
+		{ "xe_vm_add_compute_exec_queue", DRM_XE_VM_CREATE_FLAG_LR_MODE },
these are not considered at all. Can you check this once.
> +		=09
> +
>  	igt_fixture {
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>  	}
> --
> 2.34.1

