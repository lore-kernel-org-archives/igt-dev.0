Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DF7C83F17
	for <igt-dev@archiver.kernel.org>; Thu, 31 Jul 2025 08:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813ED10E257;
	Thu, 31 Jul 2025 08:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+XPIAQb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514B110E257
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jul 2025 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753951447; x=1785487447;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+A5bcKSraJT8/pYkvXdIZI3B4RwfeTbsYkYH1imHbzU=;
 b=J+XPIAQbRtHeb8wn6hI/oz1FuNXzVsgBLb4yRDo627s73i8D3uVD2Snz
 CY9l6a3DvgXnBhOwawnVjLpm8nxv07z+q3yUyRwKYtnAzLyvHAHty7HrF
 fUty+4PnaCBIRf/Dzz30tIqjcXJ04lx3eoEFKySswCYCmG0nkP4K/Czp/
 S/UZYTYR4Iada4qRR45jouAy3MRkdWYeY82buQB2uzyanIDamaZulyA49
 4EqPC+IZWGDmQeTCpgLqeZgZ1d43rC3eS8M4C7qiz2z+Sx0LPmOOobdz7
 xtZLyJkbaL+9cSNY2+/jBG4BnZYNUuC9l2driMNXJMOSc9APXXoiypmU8 g==;
X-CSE-ConnectionGUID: AIV6o2WQSGy632iK8hlKzQ==
X-CSE-MsgGUID: RWZpOSQyQ1WK5YZKAKr+hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="73724131"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="73724131"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 01:44:06 -0700
X-CSE-ConnectionGUID: qfzcudplT2+W8LPFAz032Q==
X-CSE-MsgGUID: jxOiW9FFQxeCgiOjem36Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="168604371"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 01:44:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 01:44:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 01:44:05 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 01:44:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBGqpRP/7AloR7DjMuplecREsXkn1UPWzGcYs5n0WL+AiZxnZSxkk1UlwZRLszlvf1sqhQnyoDvmtPY4MZdMyzz4GwXfkgbZ1sIJM4kKJJSk6GFqZt8zxC9Q6KvFm+rwjwW2E1e6YBA52XRdNbm3x4ujAO7rWSbb/1WI7gbgB/hC11TWWN6KoYiqYrMTltw0gU+95rsWxFeE/ranfQO+5WfMlAMdztU63umm/Py0miZ/8uJeuQBtz3ChlLmj9zAcaxfCt+At9VArmPQ/4ZUHzQNebR3NhKFmByk93HY63Moq6bP4V9UDgTBVVfbVBL+AxlG5GTnnfmkUOrM8zz0RmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKKD1hwjWzKpWbOsxfD8Y3q8kIIXpWgqtxPiXW6+YzM=;
 b=VVIpB39VLdUaapLL/IbvBMxquyR+lxDTZHrcEJRBAVScITauFkJXCbo5TWesp3wAmgYsGtcYl0Tl/2ascJJiiUKS7W7eMzmEVP/DXvSrni+4LjnGXVtfta3d3bxxESgeBCIbV4FPZOFT7zuabxmbg0bItoW6x5Pkxf1KxXtxBPKaB9yK6D7MBFjZ9jCbEG5RMam3HVKfP5c281VG07Qm7ckjabJGzjkUCLLl7PKC15TwoM6PoPXGvNchxOqFSeNKs9bker8CNRiQjL8cQfDxvumm887cSNjjxOcistTs5J1zekFk3m/lRliPskVXWZ2EgsGHoHXS3abOoXjwxwC2pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by PH0PR11MB7563.namprd11.prod.outlook.com (2603:10b6:510:286::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 08:44:02 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52%6]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 08:44:02 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v1 1/2] tests/kms_vrr: Improve VRR test robustness
 with cleanup before assertions
Thread-Topic: [PATCH i-g-t v1 1/2] tests/kms_vrr: Improve VRR test robustness
 with cleanup before assertions
Thread-Index: AQHb8FRa68pi+rnk1U+SYYG+V5fF7LRMDUbg
Date: Thu, 31 Jul 2025 08:44:02 +0000
Message-ID: <IA1PR11MB634806E58CE9BEC96924F3A4B227A@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20250708220502.803610-1-ramanaidu.naladala@intel.com>
 <20250708220502.803610-2-ramanaidu.naladala@intel.com>
In-Reply-To: <20250708220502.803610-2-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|PH0PR11MB7563:EE_
x-ms-office365-filtering-correlation-id: c059f554-d6d9-491b-c9d7-08ddd00e6661
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?upbfnbIcPClR5XH9Bc3BUIPGlVyoh8oXWmh76+QOLpGiUdZAGtHZeFNegBAw?=
 =?us-ascii?Q?YYuijwBNIpFk6PFqkofgOmN1/qFIufkglbBXgi2bUzysoH6PjtZ1EXm321k4?=
 =?us-ascii?Q?23zWYq3+PboGA2AWyL0buyxIK/XuLSfOl4mhrQw062f/a46KqSgP+pFeW1zr?=
 =?us-ascii?Q?B0U+F0TPTJqqY10tDA9Te+H9RXNVH3Oh4aylw285WCgMsaGQileNvnvenxa6?=
 =?us-ascii?Q?mWUuQON8/XQ2hSRm80cMqD0mXYCr++jPD3Vp8Xw5z/sprVPD7pstzr7hXTJ2?=
 =?us-ascii?Q?9lJlqCsRr79VIlhBOGfChu7aK34URYIkEtl5b+3tC+i+a4l1l47AAd5UOlEC?=
 =?us-ascii?Q?f8KXOCKiHJHjobb9VEqo/4AD3/rrzToKuLCLRvU38GoyZC1L4DUbD4kuv02h?=
 =?us-ascii?Q?/3gDYFPLNod5VkDQt0bFrCJ0DFG1/w/sXVv6YkeNpwOKfgPRgqVhRLtQxBdW?=
 =?us-ascii?Q?EQVNy3Hcgxb6zZJ+3hALFpkI9PxjMZz+tXrwBwZtWo2WD+ra15/ePvQH3M1W?=
 =?us-ascii?Q?EiaTjY024EYQfeVueCd/whjaqjWczPaznPRXk4FsVH64JZQgQi/bSPmGPQ8x?=
 =?us-ascii?Q?L6UKj0G+UTmu3mIcx2gvxw/OXtAR3FeN2HA31Vgnc8jSCh4yTaO3phERoxcU?=
 =?us-ascii?Q?t6EY+Cv8fwoOXJCvHKnlBVSeX3gGzN7FiTjYpbP/i1OWvxfWjA0uiiFoaumi?=
 =?us-ascii?Q?/Qxic5sq8yHBYE34scOOBebyJmDIVCvyUs7AtKGNubtt8TiJP0qvDDOg3EsQ?=
 =?us-ascii?Q?OB44gdNFxCahpTcxkezaNEwV6oNCkxLJz87yRauALmAFpvVSkhG4d4/RSrUU?=
 =?us-ascii?Q?8CEQZ15oswUvsmfvWDANndEcyDun4N69NAu7AHobpqIQ43fATttoMSjyRfZn?=
 =?us-ascii?Q?K8tRS4HbGn8husc9Cc1YGNW0jiOIi63ATWh2Afy4xeIHShdWlGDrVKuR/8g4?=
 =?us-ascii?Q?9NwygR99aYvT+G2RHBw6BVmqyEDhUfrrYLp2x0m/PGiZbisaeOsAT0+8eXo5?=
 =?us-ascii?Q?zI2XnIb21GFLuvMFJRtPX1qrpoe3WNx91ZHmMyJCX+waH6UAxfu9LXs4ksAh?=
 =?us-ascii?Q?89P4rvLqBWUccK/5e/HRvtT74rf7IWIkzi3zoDUwHGHEijYtOb5ToYPtBvd9?=
 =?us-ascii?Q?LrJfGw0hOxytw8M+eTM0GOkFKqqc7Z8v4FWD6FyN4rYtXwue4HSXOUSU0gWW?=
 =?us-ascii?Q?Cbj8QyaAepQBpXJQel5SErKVoxf7EprM5UZRBEQo0i1STUmM6rvfoPJO6BGe?=
 =?us-ascii?Q?D4gXq+NYmnOuxFpHIufX2EKI1XoWhLVRM5lKz30xkUUPx8t7THydVtjEedUP?=
 =?us-ascii?Q?VUktc7PuniMSAuPIXZ9OR5WfrNDqizzTr3FuUYCILZyp4XOdkMXH5Lz6d3xF?=
 =?us-ascii?Q?dfwMX/OAV1jWxFPTsDgmDqjx/QLcATC4wf+FcS9xoEcuYyzNK99hod3pD62k?=
 =?us-ascii?Q?pE2lzVRqbK/ajlR9TZsC0DkprT1dpuguP3E0kQ+UwTQDWAeD6s7GPw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DoM4h64bkY2uGm3VLAKkVUE7n8CzkajRepEnfhobhsGAF6VME82Zq79ASxhZ?=
 =?us-ascii?Q?D/P7Um7PLgtZIH1jsjreLlvyk5K+rCZe0C0q0WX/7w8uyCketv6j0GzBkINh?=
 =?us-ascii?Q?mH1GBoMy7pV8JXpEc/4yg/kmlMysaG5tSWjqItCGXz2NGKpu+8xKGDG3BP5/?=
 =?us-ascii?Q?Dy8RVQftpD2YXU1g6WA/2jTwdLyULIU5TKuy4pQMmVZ1aBbYmNBctjfhTsmT?=
 =?us-ascii?Q?hhOoscmxelyVGjoDtWORFR7tjNJ1RRGRJpnLDwkLThQjJPi5LnVVid5W4glZ?=
 =?us-ascii?Q?r/wShG1BOo+hFXkr3birIe2PxyoOv1UfWler6S3/YPe2vCaLE2+2g22XXPOZ?=
 =?us-ascii?Q?QmUEs3aam3XLlhqg0X3gR6vnE5nzSTqLr8aZ1L9yJGYXis+hhFavM9LAks5w?=
 =?us-ascii?Q?zAdC49Sb+/efBNpWt+ysnt/qA0oMcfY9EaQv4a91XfBMTCJCOQNmRdCucbRM?=
 =?us-ascii?Q?WDJwICzL3YmjWO040bFexR8thV7AkrnV+XxdftKMneWrhc5WKyyChFW5LaO5?=
 =?us-ascii?Q?jrBGfOJU5azfHqafyPXuPuWGXyZGsn6i1sqd/PedIP17VHcPU3NMZIsiyDHh?=
 =?us-ascii?Q?uhACiDxw9bTLyPYdHaVueHLnlE9lNezKkev3GZpdQ1mlTXVLF31teJ2GG4WJ?=
 =?us-ascii?Q?yczyxZAqcBczrkWhFXZ+uKFi0vzMXDrSEyWWPQkmq1LvBI2+BPHxNG0V25Ch?=
 =?us-ascii?Q?Etl25/WFu6WrqUK04l+px1eMkoeIT6+q7JatuOdSCRzKHVidXGqyRuRKAwM/?=
 =?us-ascii?Q?tltP0Qc2XRdhdOEW2FKUPgG1ZHU+/3cKm97xiVaUerqYWkSq6I9k5Xm/3e3K?=
 =?us-ascii?Q?AsUn7bgzT5CJ3nhZiwxsOmzRxBCbn0xMoUweyqGvWvcL2kxHZ4IyoZeS+/La?=
 =?us-ascii?Q?w6TqFdUfOC751zjHhzMM03yptJkyPFNtvCSgo93DxyH/vLj0zjv7Rz0OcKRy?=
 =?us-ascii?Q?yyGvpW05H05Snig84pRo3RvDjQ4yxrpq5j0r4CqjfwaWbLf6vv+kf3yBoOKy?=
 =?us-ascii?Q?xRURhqKcgI2PjKEGHGDpXBzyEkp8iLhzvx2l93/H/lQJ9MGMIw2AjajeIRsJ?=
 =?us-ascii?Q?SmzjK+XTsOGF3LRsdkVALEPDFWTKmFkwix4Y1DhO7GIVwvMkGu+Uv0b7/ssZ?=
 =?us-ascii?Q?EiEINwqBvblcbIOEJxrNS8r593DM6sdxQ/BsScQjpaHSdiIl1xMENaFG5K0A?=
 =?us-ascii?Q?KvzoXMqHLnWioGGlUU6Q2/FOBqrpefJEsqNl8HSA4CF1NAm5eR0cC3LGokCJ?=
 =?us-ascii?Q?iUgz3kJLe/pmmlU2wq+Kh8QCWfvYBJsGLg4o6KTK6cLWEtjgQNSiBUJOaO4D?=
 =?us-ascii?Q?rAU2lnMUwRFHLPWk0Gh3ROtm5qE3kMysqt/ON48gsbueCA7m81px37BxPomS?=
 =?us-ascii?Q?a48OAccKrIhlHIEk1vN6tWjrhwO7S76uKMjqTCfQdpe9BYzt5SfRi379xXuU?=
 =?us-ascii?Q?4wO9y3EZOGgg9sUVrjxlnCpCWFL6BAkHnHa/SAuroG7XTVRHxFFRCFYNW+Lz?=
 =?us-ascii?Q?sGrYxg01tsXEPHXMt9Blip2rBcCSQoT7Uqz28hFNGtMZNThCnMX5KCcFQXkh?=
 =?us-ascii?Q?SZuf8uZlq86kCGz9CvW4SV2Sc8Xm29CXXfkZnZm1eMmNAmd7kUCRw2wBNNAE?=
 =?us-ascii?Q?ktiFCv27QqTNeVD51uRmD6g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c059f554-d6d9-491b-c9d7-08ddd00e6661
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 08:44:02.1818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnYqEKsF9oWkDgc0W7MuOBJN80Ze+zenG/5SBTXEZbr3oc/ql5S1D9k6LbmCpR16v44YZZa8vh9Do9p7mnoeJzjFiKHcvvdyCgfovQFE2U7IhixTM4MWBQu3pvay2YCz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7563
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: 09 July 2025 03:35
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Golani, Mitulkumar
> Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v1 1/2] tests/kms_vrr: Improve VRR test robustness =
with
> cleanup before assertions
>=20
> The robustness and maintainability of the VRR (Variable Refresh Rate) by
> ensuring proper cleanup is performed before any assertion failure is trig=
gered.
>=20
> Previously, when a test failed due to not meeting the expected VRR thresh=
old,
> the test environment was not always cleaned up properly.
> This could lead to resource leaks or inconsistent states that might affec=
t
> subsequent tests, making debugging more difficult.
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/kms_vrr.c | 161 +++++++++++++++++++++++++++++++-----------------
>  1 file changed, 105 insertions(+), 56 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 9c2c4ac92..a24f413de
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -241,6 +241,18 @@ low_rr_mode_with_same_res(igt_output_t *output,
> unsigned int vrr_min)
>  	return mode;
>  }
>=20
> +static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t
> +*output) {
> +	igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED,
> +false);
> +
> +	igt_plane_set_fb(data->primary, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_override_mode(output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_remove_fb(data->drm_fd, &data->fb[1]);
> +	igt_remove_fb(data->drm_fd, &data->fb[0]); }
> +
>  static void
>  virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float
> virtual_refresh_rate)  { @@ -701,25 +713,34 @@ test_basic(data_t *data,
> enum pipe pipe, igt_output_t *output, uint32_t flags)
>  	if (flags & TEST_FLIPLINE) {
>  		rate[0] =3D igt_kms_frame_time_from_vrefresh(range.max + 5);
>  		result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> -			     (range.max + 5), rate[0], result);
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target
> VRR on threshold not reached, result was %u%%\n",
> +				     (range.max + 5), rate[0], result);
> +		}
>  	}
>=20
>  	if (flags & ~(TEST_NEGATIVE | TEST_MAXMIN)) {
>  		rate[0] =3D vtest_ns.rate_ns;
>  		result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> -			     ((range.max + range.min) / 2), rate[0], result);
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target
> VRR on threshold not reached, result was %u%%\n",
> +				     ((range.max + range.min) / 2), rate[0],
> result);
> +		}
>  	}
>=20
>  	if (flags & TEST_FLIPLINE) {
>  		rate[0] =3D igt_kms_frame_time_from_vrefresh(range.min - 10);
>  		result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -		igt_assert_f(result < 50,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold exceeded, result was %u%%\n",
> -			     (range.min - 10), rate[0], result);
> +		if (result > 50) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result < 50,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target
> VRR on threshold exceeded, result was %u%%\n",
> +				     (range.min - 10), rate[0], result);
> +		}
>  	}
>=20
>  	if (flags & TEST_MAXMIN) {
> @@ -732,10 +753,12 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>  		};
>=20
>  		result =3D flip_and_measure(data, output, pipe, maxmin_rates, 2,
> data->duration_ns);
> -		igt_assert_f(result > 75,
> -			     "Refresh rates (%u/%u Hz)
> %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was
> %u%%\n",
> -			     range.max, range_min, maxmin_rates[0],
> maxmin_rates[1], result);
> -		return;
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rates (%u/%u Hz)
> %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was
> %u%%\n",
> +				     range.max, range_min, maxmin_rates[0],
> maxmin_rates[1], result);
> +		}
>  	}
>=20
>  	/*
> @@ -746,9 +769,12 @@ test_basic(data_t *data, enum pipe pipe, igt_output_=
t
> *output, uint32_t flags)
>  	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags &
> TEST_NEGATIVE) ? true : false);
>  	rate[0] =3D vtest_ns.rate_ns;
>  	result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -	igt_assert_f(result < 10,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold
> exceeded, result was %u%%\n",
> -		     ((range.max + range.min) / 2), rate[0], (flags &
> TEST_NEGATIVE)? "on" : "off", result);
> +	if (result > 10) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(result < 10,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold exceeded, result was %u%%\n",
> +			     ((range.max + range.min) / 2), rate[0], (flags &
> TEST_NEGATIVE) ? "on" : "off", result);
> +	}
>  }
>=20
>  static void
> @@ -758,6 +784,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint3
>  	vtest_ns_t vtest_ns;
>  	uint64_t rate[] =3D {0};
>  	bool vrr =3D !!(flags & TEST_SEAMLESS_VRR);
> +	uint32_t ret;
>=20
>  	igt_info("Use HIGH_RR Mode as default (VRR: %s): ", vrr ? "ON" :
> "OFF");
>  	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> @@ -773,14 +800,21 @@ test_seamless_rr_basic(data_t *data, enum pipe
> pipe, igt_output_t *output, uint3
>  		 * so switch to High clock mode as test preparation
>  		 */
>  		igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
> -		igt_assert(igt_display_try_commit_atomic(&data->display,
> DRM_MODE_PAGE_FLIP_EVENT, NULL) =3D=3D 0);
> +		ret =3D igt_display_try_commit_atomic(&data->display,
> DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +		if (ret !=3D 0) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert(!ret);
> +		}
>  	}
>=20
>  	rate[0] =3D vtest_ns.max;
>  	result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold
> not reached, result was %u%%\n",
> -		     data->range.max, rate[0], vrr ? "on" : "off", result);
> +	if (result < 75) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold not reached, result was %u%%\n",
> +			     data->range.max, rate[0], vrr ? "on" : "off", result);
> +	}
>=20
>  	/* Switch to low rr mode without modeset. */
>  	igt_info("Switch to LOW_RR Mode (VRR: %s): ", vrr ? "ON" : "OFF"); @@
> -790,22 +824,32 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint3
>=20
>  	rate[0] =3D vtest_ns.min;
>  	result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold
> not reached, result was %u%%\n",
> -		     data->range.min, rate[0], vrr ? "on" : "off", result);
> +	if (result < 75) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold not reached, result was %u%%\n",
> +			     data->range.min, rate[0], vrr ? "on" : "off", result);
> +	}
>=20
>  	/* Switch back to high rr mode without modeset. */
>  	igt_info("Switch back to HIGH_RR Mode (VRR: %s): ", vrr ? "ON" :
> "OFF");
>  	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
> -	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) =3D=
=3D
> 0);
> +	ret =3D igt_display_try_commit_atomic(&data->display, 0, NULL);
> +	if (ret !=3D 0) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert(!ret);
> +	}
>=20
>  	rate[0] =3D vtest_ns.rate_ns;
>  	result =3D flip_and_measure(data, output, pipe, rate, 1, data-
> >duration_ns);
> -	igt_assert_f(vrr ? (result > 75) : (result < 10),
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold
> %s, result was %u%%\n",
> -		     ((data->range.max + data->range.min) / 2), rate[0],
> -		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
> +	if (vrr ? (result < 75) : (result > 10)) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(vrr ? (result > 75) : (result < 10),
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s
> threshold %s, result was %u%%\n",
> +			     ((data->range.max + data->range.min) / 2), rate[0],
> +			     vrr ? "on" : "off", vrr ? "not reached" : "exceeded",
> result);
> +	}
>  }
>=20
>  static void
> @@ -815,6 +859,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum
> pipe pipe, igt_output_t *outpu
>  	unsigned int vrefresh;
>  	uint64_t rate[] =3D {0};
>  	uint32_t step_size;
> +	uint32_t ret;
>  	drmModeModeInfo virtual_mode;
>=20
>  	igt_info("Use HIGH_RR Mode as default\n"); @@ -828,12 +873,19 @@
> test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t
> *outpu
>  	 * switch to highest refresh rate mode.
>  	 */
>  	igt_output_override_mode(output, &data-
> >switch_modes[HIGH_RR_MODE]);
> -	igt_assert(igt_display_try_commit_atomic(&data->display,
> DRM_MODE_PAGE_FLIP_EVENT, NULL) =3D=3D 0);
> +	ret =3D igt_display_try_commit_atomic(&data->display,
> DRM_MODE_PAGE_FLIP_EVENT, NULL);
> +	if (ret !=3D 0) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert(!ret);
> +	}
>=20
>  	result =3D flip_and_measure(data, output, pipe, rate, 1,
> TEST_DURATION_NS);
> -	igt_assert_f(result > 75,
> -		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not
> reached, result was %u%%\n",
> -		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0],
> result);
> +	if (result < 75) {
> +		test_cleanup(data, pipe, output);
> +		igt_assert_f(result > 75,
> +			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold
> not reached, result was %u%%\n",
> +			     data->switch_modes[HIGH_RR_MODE].vrefresh,
> rate[0], result);
> +	}
>=20
>  	/*
>  	 * Calculate step size by considering the no. of steps required to @@ -
> 851,13 +903,21 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe
> pipe, igt_output_t *outpu
>  		kmstest_dump_mode(&virtual_mode);
>=20
>  		igt_output_override_mode(output, &virtual_mode);
> -		igt_assert(igt_display_try_commit_atomic(&data->display, 0,
> NULL) =3D=3D 0);
> +
> +		ret =3D igt_display_try_commit_atomic(&data->display, 0, NULL);
> +		if (ret !=3D 0) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert(!ret);
> +		}
>=20
>  		rate[0] =3D igt_kms_frame_time_from_vrefresh(vrefresh);
>  		result =3D flip_and_measure(data, output, pipe, rate, 1,
> TEST_DURATION_NS);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold
> not reached, result was %u%%\n",
> -			     vrefresh, rate[0], result);
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target
> threshold not reached, result was %u%%\n",
> +				     vrefresh, rate[0], result);
> +		}
>  	}
>  }
>=20
> @@ -924,26 +984,16 @@ test_cmrr(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>  	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
>  		prepare_test(data, output, pipe);
>  		result =3D flip_and_measure_cmrr(data, output, pipe,
> TEST_DURATION_NS * 2);
> -		igt_assert_f(result > 75,
> -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on
> threshold not reached, result was %u%%\n",
> -			     mode.vrefresh,
> igt_kms_frame_time_from_vrefresh(mode.vrefresh),
> -			     result);
> +		if (result < 75) {
> +			test_cleanup(data, pipe, output);
> +			igt_assert_f(result > 75,
> +				     "Refresh rate (%u Hz) %"PRIu64"ns: Target
> CMRR on threshold not reached, result was %u%%\n",
> +				     mode.vrefresh,
> igt_kms_frame_time_from_vrefresh(mode.vrefresh),
> +				     result);
> +		}
>  	}
>  }
>=20
> -static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *out=
put) -{
> -	igt_pipe_set_prop_value(&data->display, pipe,
> IGT_CRTC_VRR_ENABLED, false);
> -
> -	igt_plane_set_fb(data->primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_output_override_mode(output, NULL);
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -
> -	igt_remove_fb(data->drm_fd, &data->fb[1]);
> -	igt_remove_fb(data->drm_fd, &data->fb[0]);
> -}
> -
>  static bool output_constraint(data_t *data, igt_output_t *output, uint32=
_t flags)
> {
>  	data->debugfs_fd =3D igt_debugfs_dir(data->drm_fd); @@ -1060,10
> +1110,9 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
>  				      kmstest_pipe_name(pipe), output->name)
>  				test(data, pipe, output, flags);
>=20
> -			test_cleanup(data, pipe, output);
> -
> -			break;
>  		}
> +		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_output_override_mode(output, NULL);
>  	}
>  }

Please break your changes to separate modules as a step by step incremental=
 changes, adding all changes to a single patch makes it difficult to read a=
nd review.=20

Also add a comment why you need separate cleanups when it was already prese=
nt before.

Regards,
Mitul=20

>=20
> --
> 2.43.0

