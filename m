Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4633FC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 05:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9194010E2E0;
	Thu, 20 Jun 2024 05:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfRd2dMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FAE10E2D4
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 05:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718862599; x=1750398599;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UTKOaplVJec81ZJtePBcDp5ClHd36ZNCTZESUNHNfKs=;
 b=FfRd2dMXUZ+fpdyKo1AQP1eqRjYhnjPrFvc71ZfH0C4/2GM3ojFeh/YZ
 Mrn7PnKcaox/KgHiDrOR59KQdTBpzOOKHs4tsH795XLjrN1oZa8W4zJG7
 qmUhSGuX8XBt4NSvmTAf6IfV160ejC+/P0KKG4lIIJl9Z6c09oXBepNFa
 82yXjdibp8S2qvyO+OTQUnQ+JVEogSSVRul545XcXJRraWBtzCx4j3eI4
 gq/VtlS1guulH8MIrt6uS4gsa1H2DL08cWTGnyJoUks+P/VUfTFqDb1Zr
 C0XggtZ4Lndk+rBsB60crHYK3cStN+y8KoYY3kNhTD0PVFw8CrV9i9xnG A==;
X-CSE-ConnectionGUID: vMmcOlWOTwmidPeDCFVQug==
X-CSE-MsgGUID: KHns3YTRT4eGjKsVYDWLSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15584494"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15584494"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 22:49:58 -0700
X-CSE-ConnectionGUID: yYQG/OvASVefavtByh6udA==
X-CSE-MsgGUID: 0AL6F7mOSXWnaQB4rMHIHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42791804"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 22:49:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 22:49:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 22:49:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 22:49:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsxBYaZ4NPrZjVQe4VMPKWP+pjNOytatVlLoZ0IdLb6FKmW5hJAlirDYd+RyGPMKY6nqaoFOYLBNeERBJTB9JbA4Soe/VeY6b+lERzAhoGOvvvkyP8PjModA9wTmqjWKQjqQ2L3pAbWz/Rvtx8h0wH0fbF6fOFLqkV/iHMtQC+BFjqeZ0Q30lwSqSIzwYYMD+phPhqIbe8FybbWO4kP97nQLS2/XmTn0i1SWSTkuEDZKipHfijgdNsBfRm+gCuntPa5Jar2dcmJnBBAqSD7DC8NL3hIMTdJutlBPO9NmeWoTxfkPpiHw1zWVbUcwwiSftZWShYNDvHGjnUhw0+urqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+oXGXCCRpCHpzO8R7GJAxhUaGrLp2xuE3/NKfNi/WI=;
 b=K0W6CQiznfBvJrzvy2fMbuk8TAFAXIXn1ztmUPwj+gVxHTwPukc+FMHU/ZzOyi2J+lK89SCIKwNjkKzm6aNDdjNiNExvrC5QEvSvE9mtUpdH0FPP4MB+K8Zfk/ojFvCm6GAitJeiAHDwhVLpBIraN1NWjxhGs8gfAB0R/EwVPbfPnK35PSgbDH3l6VHkYwe9pal53Mx2iJ8qbgcvm4wPNOu6BvD/At2/zN6CJSPZHQ52WMPBdbKzCT/lCBKeYctRiHDkkJPJGnGzFrgvZuOcJPHNFm0J8ODjYgBLy4qSH7Kj2kUGqn2Lptd+pajpWI22WK/RO7p63ujospCMQpNRMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 05:49:47 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 05:49:47 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Peter Senna Tschudin <me@petersenna.com>,
 "Gandi, Ramadevi" <ramadevi.gandi@intel.com>, "Girotra, Himanshu"
 <himanshu.girotra@intel.com>
Subject: RE: [PATCH i-g-t 2/4] tests: Unify 'Test category' in Core tests for
 i915 and Xe
Thread-Topic: [PATCH i-g-t 2/4] tests: Unify 'Test category' in Core tests for
 i915 and Xe
Thread-Index: AQHawYuu2bZxpJMe20yGjE/2hCYGNLHQJ21A
Date: Thu, 20 Jun 2024 05:49:46 +0000
Message-ID: <CH3PR11MB8434D36E2C41A58FD26850FC8DC82@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240618142650.1991834-1-katarzyna.piecielska@intel.com>
 <20240618142650.1991834-3-katarzyna.piecielska@intel.com>
In-Reply-To: <20240618142650.1991834-3-katarzyna.piecielska@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CO1PR11MB5009:EE_
x-ms-office365-filtering-correlation-id: 9fa052c4-b271-4a41-740a-08dc90eccacd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|1800799021|376011|366013|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?iRGClpIHiCP42vjigAr3C2OTzGvgItXQJyVA0F+w20HwAxGgG5Wm7lBXI+5r?=
 =?us-ascii?Q?40aI0T0z5IamCus1NRvVUBtmgAxC2vIYHfzV1zB1zkcqIKf9b1jv8SEHB83j?=
 =?us-ascii?Q?SwRC03HtJSsQOMj8yypE+7vxipLcvmJGqxegTvAU5g4ZYq1dUFgsahj6/bcm?=
 =?us-ascii?Q?Y6lnWveYcNKLXq/FpD/BW6vDRc5zFsJsNJxOCM5Slp4bz3cOtDbcSki0PxnK?=
 =?us-ascii?Q?bmW4kDoVwvVBNmw4DRVn1jeGId8OHA1GM8433wLUptp3QcT9lgYbCXaoNySu?=
 =?us-ascii?Q?oltan3J1jwQ2IkrdMEegI7F5Rgh7fNTMImaYjD0SmBa6/FriPYisxGIDWZ+A?=
 =?us-ascii?Q?kVvv6kVSSIHibGBKZ3PszET8fehY69RmSNDnY9XzoIE12phpzkU3KswZpyyl?=
 =?us-ascii?Q?EYKfJgpB/pINUlr3eC710sbJGjr9/7naXa5M3jLhJF0qrkQaVPyhEfi4ckAa?=
 =?us-ascii?Q?PGvgDpsSLKbbw4p5dis9OGu8ND5/HwUX9VXMObrC6bjcPuSv+HJarQZ96AeJ?=
 =?us-ascii?Q?EFFVJfRfMpXB6ZzsWLBAmEAA1loiIQRaKQY9qijuZ4HRLZSr98LNtSgHejia?=
 =?us-ascii?Q?Z3auIaZq1TdJwCnsXC0ovugTPPAu4+WLqsELqYoH7qB00dmn86hL/MI7bSl4?=
 =?us-ascii?Q?p+V/+0WjFarb2t5jlyNB+QBpkgVZP2j7TWOW4S2N/ukjJAS7Joq8bwebT0iK?=
 =?us-ascii?Q?84VILje/ItZNFup5eUbjBFzcwm5uk8ew5sP87NfTcbsd7coedVMT7osJfubx?=
 =?us-ascii?Q?RE6fApjYluWaIBp1NSwc/pZchD0IF3Mk5qyFvPuYkIUxtJ2OQ7WemW5YfLce?=
 =?us-ascii?Q?iayXTHReIx1CxpEnjIK+ZkQA7PMaU0Hin4fpOC8Nx+w7S2i27NFbtkvVasKq?=
 =?us-ascii?Q?Pg5g8Ye/ItprXIzJCiW3Dm8OE7HZVIq4naRJcmk4gNTw1n++46LTmT+bb1ZE?=
 =?us-ascii?Q?3zwrQVUEvSERlSo2TjpEoi9KGWNIjscHbV1DvHRwDy5kSHtLtkfjjfwmyaL2?=
 =?us-ascii?Q?ZjHe++zN3Gtn999Wi4zyAvOkmZjk6E7LDqyHCa6Zel14VWE6/J6cAKoYP1X9?=
 =?us-ascii?Q?3mYXitv/7ozhLGC9bgT4pS2wHTWnvTx9s9ue9bFk42jf6GyAafL7caITKuE0?=
 =?us-ascii?Q?17gOfR0fPUBL5IGb/NVTp/V0UaM+1yXMuAtird94BFECHxRjsIV9Ui2GW+eU?=
 =?us-ascii?Q?qjZn2lZtmTW/KSAop0heve72GOx2m4uDle6axdhRHdID83VS4SUSXw00iZc/?=
 =?us-ascii?Q?zzvevPpQY5vO6i9vfd+oI527C+0xxTfz0TF2ugbc1l5VYavpJkCwoKITkU6d?=
 =?us-ascii?Q?6joqRg4IYeeW2LQcBd1flpSTbGLU57LQoFSEtMdzaedtOHxruRVxLkjeXq/f?=
 =?us-ascii?Q?/hN6EaQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q3eicPPzYfAHa6h3FMTWAAwCAUSXkMDZOmuk9mgoyFxldbX79EceCQcyf6dW?=
 =?us-ascii?Q?TfQnSrLV0L3Uj46aMZfD//l7W97l/DoT/6hJz/DYTm831S8xinyhqT5x6fkv?=
 =?us-ascii?Q?i+hIcOwMKlXiB7V2ekAWVRLutuBr80wWhazwiUJvUqnbBZI0BqByQ+JtbiXJ?=
 =?us-ascii?Q?8k6wfAr/bl4Ligshw7ApXMyQNoqOIFgu4dYl4Q2bTlb7WSGTfc5nfGnVcGCQ?=
 =?us-ascii?Q?6JcWbxTdvq3udc6wBDp1aHg05fSmv2azSoXJqtRwX31+eTInXgRum4mYN4v5?=
 =?us-ascii?Q?j+/OQYv2Ii7ASVAyHVlVY/iwjQjOKuDrqs+k9UhCY0RPDMO7faXKaavzi5SS?=
 =?us-ascii?Q?4+fvZfIsJQny/SN6BsWyGbI+PCS9eUsOLkXLu0AoEEkLl8095QV0MryJ1G38?=
 =?us-ascii?Q?BvqlInB3ooaAEXABOPpvANoux88o3v7N06yi2DXYq3MnKrnOVssTO+YUrTU7?=
 =?us-ascii?Q?p2qqIedGk1PKI7iAcjdnYP+CwkVgVCVWuRsqWCDQ5s1gD+f3KKB63HReHKw+?=
 =?us-ascii?Q?S2ewHkoycbnYQ0X2agEyY2NPveFd6u/+NXsN9+6owe6g3+/XeBF/zbgH49oe?=
 =?us-ascii?Q?v9l7sgZxWxhMiyQ7fDmTk153yeuiK1uO7J7uYiZo8TomAoQGMBLFuRQbu9ZX?=
 =?us-ascii?Q?P9SKdoTqadLsoJwzDC5DMciIsWw6cMISSmBFy3PFazXHYgwlE2AlhiJOQBSV?=
 =?us-ascii?Q?/qTbuj0fmiQ9oSqsmH5wfwWX3QMUuJC/rpJ25TCvsOqtr+0HWvravUwjmTtY?=
 =?us-ascii?Q?/hJTgYdpuuNoGQUjv3Kua/18wqI5QFplw1C4Sy8TcdUENuBOK621h1U+F1sl?=
 =?us-ascii?Q?rpLK2k/JPEcmckcKXSB7cwZjH98d4N1vmNll6hS85Wsr6s/FEifHzSGI2LNb?=
 =?us-ascii?Q?QLoBNdUMWNvlYDZqW6gmpsJcjtBNHqnyBQJ1J/wITWrpOGFsWjffCwfQ2dfi?=
 =?us-ascii?Q?/KnqMf0gAr8XW6WgrDoCOGJnYeq2txBLJxe8b0hu/OlNSu4yCsoMOU+izI9I?=
 =?us-ascii?Q?cIgYoyUX9/jxb7P2fTMTQk5iOxb4Pl/hQxCxF9neFNSH064SV1vtA4dQXUHZ?=
 =?us-ascii?Q?VL6AvP1Bvnm+C5bJjsMyAxTX+TpIBdeOKzumYKKKH0GcpwS3I6poO2VepbU/?=
 =?us-ascii?Q?EgazwyJQwxAe5v7KupCSgpZT+xgsWKAJzXJt8f1ZmKjsXMTqvfTmyER90Qu2?=
 =?us-ascii?Q?MfQRBghxfwsXAJwJKMxEyEkCOEXZPRJXDSVSX7HeuFTRaJVMvOtmsCvnFPYz?=
 =?us-ascii?Q?Cy8Wtme+SIZ9Tc6EFrl3lJCrVdmZW3QdJYR37yhmIN5jn1Ne1S/MWft31t20?=
 =?us-ascii?Q?6y3kKcibk0oQ4pN7pfr8b6CLuEiDRVGY9XzrXwU9UEPLwSRlrl7+aLRZB8po?=
 =?us-ascii?Q?btP3JpGrwrCQSge5ThvM/Kzq9wkZH6q+pz3mgvNmYQ7tEfRBEORGQo/VBrGv?=
 =?us-ascii?Q?uA+r+cQEq677qQ0+s1Fh+T7Z94Mu89O+k4VPdvcCcYLWXqgRMM7CkQji5ouB?=
 =?us-ascii?Q?ktDUSAr8WyQArqcbD1ewSVtQL/8EkJ5U1eN1FEpZ6BlIYUJjdLjHu6s82Nqx?=
 =?us-ascii?Q?YzWGcIjSWakGp0ci+iSFhHYnAkV21bnb1l1XvETGPG420NDniJqU9jJwJU7+?=
 =?us-ascii?Q?A9gqFKplJCiI/OZ9JDUdEksOv4zGL1ZiLxNRV18WUDYqwIphiW1NnPLxeFpl?=
 =?us-ascii?Q?NTrRiQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa052c4-b271-4a41-740a-08dc90eccacd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 05:49:46.8443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iMYBm6aq+NOd4P1Ok+l7RnelF25LbWRRt1fSJLxPEb4GNi9KrU6ENAXLxVIXCZKs2NUIF/uVCzLf60F4dyQ5RZEjv4SfFOZ93DVdnStL6uA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
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

I have a doubt over here for some subtests you are mentioning as negative t=
est and for some tests you are mentioning functionality test for the whole =
test.
Example: sysfs_preempt_timeout you updated entire Test category to function=
ality test but one of the subtest is negative test in this case it also fal=
l under functionality test
As you are generalising for all. Can you please look into it.
--Priyanka

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Katarzyna Piecielska
> Sent: Tuesday, June 18, 2024 7:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; Kamil Koniecz=
ny
> <kamil.konieczny@linux.intel.com>; Peter Senna Tschudin
> <me@petersenna.com>; Gandi, Ramadevi <ramadevi.gandi@intel.com>;
> Girotra, Himanshu <himanshu.girotra@intel.com>
> Subject: [PATCH i-g-t 2/4] tests: Unify 'Test category' in Core tests for=
 i915 and
> Xe
>=20
> Change 'Test category' documentation field from:
>  Compositor, uapi, Media & Compute, Compute, i915, pm_rpm, pm_rps,
> suspend, Perf, SysMan, xe to one of values: functionality test, stress te=
st,
> negative test.
>=20
> Test category should reflect main test purpose:
>  * functionality test - all testing for driver, HW or uapi that are not a=
 stress or
> negative testing
>  * stress test - stress cases to reveal corner cases, e.g. huge memory us=
age,
> many parallel operations, races etc.
>  * negative test - check that invalid behaviors will not break anything
>=20
> In some please there was a need to change s/functionality test/negative t=
est/.
>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Peter Senna Tschudin <me@petersenna.com>
> Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
> Cc: Girotra Himanshu <himanshu.girotra@intel.com>
> ---
>  tests/core_hotunplug.c                 | 2 +-
>  tests/dumb_buffer.c                    | 4 +++-
>  tests/intel/debugfs_test.c             | 2 +-
>  tests/intel/gem_exec_balancer.c        | 2 +-
>  tests/intel/gem_exec_endless.c         | 2 +-
>  tests/intel/i915_pm_freq_mult.c        | 2 +-
>  tests/intel/i915_pm_rpm.c              | 2 +-
>  tests/intel/i915_pm_rps.c              | 2 +-
>  tests/intel/i915_suspend.c             | 2 +-
>  tests/intel/intel_hwmon.c              | 2 +-
>  tests/intel/perf.c                     | 2 +-
>  tests/intel/perf_pmu.c                 | 2 +-
>  tests/intel/sysfs_heartbeat_interval.c | 3 ++-
>  tests/intel/sysfs_preempt_timeout.c    | 2 +-
>  tests/intel/sysfs_timeslice_duration.c | 2 +-
>  tests/intel/xe_drm_fdinfo.c            | 2 +-
>  tests/intel/xe_exec_compute_mode.c     | 2 +-
>  tests/intel/xe_exec_fault_mode.c       | 4 ++--
>  tests/intel/xe_exec_queue_property.c   | 4 ++--
>  tests/intel/xe_peer2peer.c             | 2 +-
>  20 files changed, 25 insertions(+), 22 deletions(-)
>=20
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c index
> db7a5c5e8..b13088976 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -47,7 +47,7 @@
>   * Sub-category: driver
>   * Functionality: device hotplug
>   * Feature: SMI, core
> - * Test category: functionality test
> + * Test category: stress test
>   *
>   * SUBTEST: hotrebind
>   * Description: Check if the driver can be cleanly rebound to a device w=
ith a
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c index
> 1d4bf296c..b3c4882e6 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -57,15 +57,17 @@
>   * Sub-category: uapi
>   * Functionality: ioctl
>   * Feature: prime
> - * Test category: Compositor
> + * Test category: functionality test
>   *
>   * SUBTEST: create-clear
>   *
>   * SUBTEST: create-valid-dumb
>   *
>   * SUBTEST: invalid-bpp
> + * Test category: negative test
>   *
>   * SUBTEST: map-invalid-size
> + * Test category: negative test
>   *
>   * SUBTEST: map-uaf
>   *
> diff --git a/tests/intel/debugfs_test.c b/tests/intel/debugfs_test.c inde=
x
> f2b6fb334..b71ffad7d 100644
> --- a/tests/intel/debugfs_test.c
> +++ b/tests/intel/debugfs_test.c
> @@ -37,7 +37,7 @@
>   * Sub-category: uapi
>   * Functionality: debugfs
>   * Feature: core
> - * Test category: uapi
> + * Test category: functionality test
>   *
>   * SUBTEST: basic-hwmon
>   * Description: Read all entries from hwmon path validating debugfs entr=
ies
> diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balan=
cer.c
> index 20e31baf0..209c54e7a 100644
> --- a/tests/intel/gem_exec_balancer.c
> +++ b/tests/intel/gem_exec_balancer.c
> @@ -46,7 +46,7 @@
>   * Sub-category: CMD submission
>   * Functionality: load balancing
>   * Feature: cmd_submission, media_scalability
> - * Test category: Media & Compute
> + * Test category: functionality test
>   *
>   * SUBTEST: bonded-chain
>   *
> diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endles=
s.c
> index 6b2c56382..9bae9bcc2 100644
> --- a/tests/intel/gem_exec_endless.c
> +++ b/tests/intel/gem_exec_endless.c
> @@ -36,7 +36,7 @@
>   * Mega feature: General Core features
>   * Sub-category: CMD submission
>   * Functionality: compute test
> - * Test category: Compute
> + * Test category: functionality test
>   * Feature: cmd_submission
>   *
>   * SUBTEST: dispatch
> diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_m=
ult.c
> index fa68be220..7e77fd1df 100644
> --- a/tests/intel/i915_pm_freq_mult.c
> +++ b/tests/intel/i915_pm_freq_mult.c
> @@ -18,7 +18,7 @@
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: freg multipliers
> - * Test category: i915
> + * Test category: functionality test
>   *
>   * SUBTEST: media-freq
>   * Description: Tests for media frequency factor sysfs diff --git
> a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c index
> 31758b1a5..709eb1dbc 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -46,7 +46,7 @@
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: D3 state entry-exit
> - * Test category: pm_rpm
> + * Test category: functionality test
>   * Feature: pm_rpm
>   *
>   * SUBTEST: debugfs-forcewake-user
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c index
> 99b83f315..f9788f9a9 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -52,7 +52,7 @@
>   * Sub-category: Power management tests
>   * Functionality: pm_rps
>   * Feature: pm_rps
> - * Test category: pm_rps
> + * Test category: functionality test
>   *
>   * SUBTEST: basic-api
>   *
> diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c inde=
x
> 3398b372b..337f121e1 100644
> --- a/tests/intel/i915_suspend.c
> +++ b/tests/intel/i915_suspend.c
> @@ -50,7 +50,7 @@
>   * Mega feature: Power management
>   * Sub-category: Power management tests
>   * Functionality: s2idle w/o i915
> - * Test category: suspend
> + * Test category: functionality test
>   * Feature: suspend
>   *
>   * SUBTEST: basic-s2idle-without-i915
> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c index
> e4272e0a0..299efcf1c 100644
> --- a/tests/intel/intel_hwmon.c
> +++ b/tests/intel/intel_hwmon.c
> @@ -15,7 +15,7 @@
>   * Mega feature: RAS
>   * Sub-category: RAS tests
>   * Functionality: hwmon
> - * Test category: functionality
> + * Test category: functionality test
>   *
>   * SUBTEST: hwmon-read
>   * Description: Verify we can read all hwmon attributes diff --git
> a/tests/intel/perf.c b/tests/intel/perf.c index 95b17f522..5b579f9b1 1006=
44
> --- a/tests/intel/perf.c
> +++ b/tests/intel/perf.c
> @@ -53,7 +53,7 @@
>   * Sub-category: Performance tests
>   * Functionality: oa
>   * Feature: i915 streaming interface, oa
> - * Test category: Perf
> + * Test category: functionality test
>   *
>   * SUBTEST: blocking
>   * Description: Test blocking read with default hrtimer frequency diff -=
-git
> a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c index
> e3f51d0c7..ebefa3eef 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -57,7 +57,7 @@
>   * Sub-category: Performance tests
>   * Functionality: pmu
>   * Feature: i915 pmu perf interface, pmu
> - * Test category: Perf
> + * Test category: functionality test
>   *
>   * SUBTEST: all-busy-check-all
>   * Description: Test the i915 pmu perf interface diff --git
> a/tests/intel/sysfs_heartbeat_interval.c
> b/tests/intel/sysfs_heartbeat_interval.c
> index 486a1514d..87102a253 100644
> --- a/tests/intel/sysfs_heartbeat_interval.c
> +++ b/tests/intel/sysfs_heartbeat_interval.c
> @@ -48,13 +48,14 @@
>   * Sub-category: SysMan tests
>   * Functionality: sysfs heartbeat
>   * Feature: SMI, cmd_submission
> - * Test category: SysMan
> + * Test category: functionality test
>   *
>   * SUBTEST: idempotent
>   * Description: Test to check whether the heartbeat parameter reports th=
e
> values set.
>   *
>   * SUBTEST: invalid
>   * Description: Test to check if heartbeat parameter rejects any
> unrepresentable intervals.
> + * Test category: negative test
>   *
>   * SUBTEST: long
>   *
> diff --git a/tests/intel/sysfs_preempt_timeout.c
> b/tests/intel/sysfs_preempt_timeout.c
> index 18e000405..51dac116a 100644
> --- a/tests/intel/sysfs_preempt_timeout.c
> +++ b/tests/intel/sysfs_preempt_timeout.c
> @@ -47,7 +47,7 @@
>   * Sub-category: SysMan tests
>   * Functionality: sysfs preempt timeout
>   * Feature: SMI, context
> - * Test category: SysMan
> + * Test category: functionality test
>   *
>   * SUBTEST: idempotent
>   * Description: Test to check whether the preempt_timeout parameter
> reports the diff --git a/tests/intel/sysfs_timeslice_duration.c
> b/tests/intel/sysfs_timeslice_duration.c
> index 026d12b85..dcc231465 100644
> --- a/tests/intel/sysfs_timeslice_duration.c
> +++ b/tests/intel/sysfs_timeslice_duration.c
> @@ -50,7 +50,7 @@
>   * Sub-category: SysMan tests
>   * Functionality: timeslise sysfs
>   * Feature: SMI, cmd_submission
> - * Test category: SysMan
> + * Test category: functionality test
>   *
>   * SUBTEST: duration
>   * Description: Test to measure the timeslice duration by watching the d=
iff --
> git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c index
> 2ceafba24..0d4d37f51 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -20,7 +20,7 @@
>   * Sub-category: driver
>   * Functionality: Per client memory statistics
>   * Feature: SMI, core
> - * Test category: SysMan
> + * Test category: functionality test
>   *
>   * SUBTEST: basic
>   * Description: Check if basic fdinfo content is present diff --git
> a/tests/intel/xe_exec_compute_mode.c
> b/tests/intel/xe_exec_compute_mode.c
> index 389de7ca4..539e2ed8a 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -405,7 +405,7 @@ static void non_block(int fd, int expect)
>  /**
>   * SUBTEST: lr-mode-workload
>   * Description: Stress LR mode workload for 30s.
> - * Test category: functionality test
> + * Test category: stress test
>   */
>  static void lr_mode_workload(int fd)
>  {
> diff --git a/tests/intel/xe_exec_fault_mode.c
> b/tests/intel/xe_exec_fault_mode.c
> index b022f97d3..8f412779f 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -39,11 +39,11 @@
>  /**
>   * SUBTEST: invalid-va
>   * Description: Access invalid va and check for EIO through user fence.
> - * Test category: functionality test
> + * Test category: negative test
>   *
>   * SUBTEST: invalid-va-scratch-nopagefault
>   * Description: Access invalid va without pageafault with scratch page
> enabled.
> - * Test category: functionality test
> + * Test category: negative test
>   *
>   * SUBTEST: once-%s
>   * Description: Run %arg[1] fault mode test only once diff --git
> a/tests/intel/xe_exec_queue_property.c
> b/tests/intel/xe_exec_queue_property.c
> index 3edab0af5..908a4c7fd 100644
> --- a/tests/intel/xe_exec_queue_property.c
> +++ b/tests/intel/xe_exec_queue_property.c
> @@ -94,7 +94,7 @@ static void test_property_min_max(int xe, int engine,
> const char **property)
>  /**
>   * SUBTEST: Invalid-exec-queue
>   * Description: Negative test to check the expected behaviour with inval=
id
> exec_queue_id.
> - * Test category: functionality test
> + * Test category: negative test
>   */
>  static void Invalid_exec_queue_id(int xe)  { @@ -109,7 +109,7 @@ static =
void
> Invalid_exec_queue_id(int xe)
>  /**
>   * SUBTEST: non-zero-reserved
>   * Description: Negative test to check the expected behaviour with non-z=
ero
> reserved.
> - * Test category: functionality test
> + * Test category: negative test
>   */
>  static void non_zero_reserved(int xe)
>  {
> diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c inde=
x
> 6ff4774bb..00aee010b 100644
> --- a/tests/intel/xe_peer2peer.c
> +++ b/tests/intel/xe_peer2peer.c
> @@ -22,7 +22,7 @@
>   * Mega feature: General Core features
>   * Sub-category: MultiGPU
>   * Functionality: dma buf copy
> - * Test category: xe
> + * Test category: functionality test
>   *
>   * SUBTEST: read
>   * Description:
> --
> 2.34.1

