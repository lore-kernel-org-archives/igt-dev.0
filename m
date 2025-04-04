Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B67C3601B
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 07:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF81F10E309;
	Fri,  4 Apr 2025 07:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iuu54tMt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5237410E309
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 07:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743752416; x=1775288416;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VLX9zeGu9Bsh/Io/1ZLN2sW7CMnjzl0M4YbpJOjH99E=;
 b=Iuu54tMtvOXRrbhkIM/lf4qCwCVVt0DIJgNBbweiMCkMG8KQYFh6wK41
 fj/qneHqAbrQ2OHet1Bl4RE8V1/94oL/9LaEXwEeGQW0S5BfgGScyNZlU
 oAAAEhsGACGC9eyFp8Z+e9hAGjXxlwRKlIfQwxN9gBcgHHT+8VxBLh76m
 YTBAy1nA7JbgVV59BnxXwDl4MrX0SEGCMFLFJa5XU6J+gOJ7DcjCiZAiv
 pFlgLsKAMxdwhvuTzI/sVHz3/8MRC9a9cNxIuq83Po2Vs9o8kMclIspUP
 fPLBueOjSQQF9EHbs/QCptrGGRtdbrc8Qy69GsUb/BsuiS4uQWp+6ASXf w==;
X-CSE-ConnectionGUID: qPmQZ7NpQ46cMzymNV0ITQ==
X-CSE-MsgGUID: hMCdKBGDR2ip+NZdB8UWyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="32789987"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="32789987"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 00:40:15 -0700
X-CSE-ConnectionGUID: 2ndBudnIQMKC9ybcOGoaqQ==
X-CSE-MsgGUID: 2YRaNs0dSzWKJm5iZSvpcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="131376708"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2025 00:40:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Apr 2025 00:40:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 4 Apr 2025 00:40:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 00:40:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mm0HUJdrckL2nLcdFbHGqw1n8E3WzNr38No7ziwu5oRmpnqZW8IPAJMpnyu+JjCdjeCSFidW+tNWLQrMBaBDUWmkCGK6PRHH6x/2Qj6wv65Q0WfBIitFCwGXHKmVWBSzZ8E4/WtT+1/VE5X/RkX+pfZNBOjowBarLxVe/dENEwHOhIGkxWVnuIchJTJEAEYc8Fu/3R8NDBxz1mDoOBuQDpdrdyPh2yZ2kkD+umRG1ns+0saWXDKSYvHdIQRAwaTFaeDbqcMmtSQjWWGyvp8sfskgJ3vFVCRSPEm5bpfbQQshKruwm32jrD8NrzRl3n3slYrxtX7svVGC5ICSAzdlsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPKnfmh2wYj8j3s0mE5kt6+rdtpfdqPjMRiYX47uFgU=;
 b=As6InrwKNaR8U1OQc7zCXbwTWeYRHffhVDAS2/dygMLE5HuHUFRdDK8HogDoASMdw2GHt+U4Mnp77EC4SzgWo3FCayF2CWTp4Fr3eW3XEyqfZSM7cspKYVtIteLnzPJwK6SCTobzuMULc6OaDrB/eP88wpNwlVTm9Oesw34O7lU7XQVNQJUJWhnX9oVAfeWOmhjWbfLXcRhNdvTKK0RR10qTHg5mu/IK1/ECutfvSQ9e1afL72p38KaBOL5TOzTHE43KmvBaPStBbWTSm0Pejc2YD5msSLJ2N6HExrzfrp8BvfEs1R24ORwtubzkNYEoj3W0J6RJ+h7WfTVP0FB/lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MN2PR11MB4630.namprd11.prod.outlook.com (2603:10b6:208:24e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 07:40:12 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 07:40:12 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Thomas, Sobin"
 <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t 1/1] tests/intel/xe_fault_injection: Inject errors
 for xe_hw_engine_class_to_str
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/xe_fault_injection: Inject errors
 for xe_hw_engine_class_to_str
Thread-Index: AQHbpRFgdshjqJIKvUGrtdInpQZrt7OS68oQgAAzeyA=
Date: Fri, 4 Apr 2025 07:40:12 +0000
Message-ID: <CH3PR11MB84345E974F430C94E800AC3E8DA92@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250404031052.1848936-1-sobin.thomas@intel.com>
 <20250404031052.1848936-2-sobin.thomas@intel.com>
 <CH3PR11MB84342B9335758ADA4A128E9C8DA92@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB84342B9335758ADA4A128E9C8DA92@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MN2PR11MB4630:EE_
x-ms-office365-filtering-correlation-id: e06d2f65-b794-4cbc-115c-08dd734beeb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xSC8Ngfsy6y3HLBA9V3kiBte1pkvz3jSRcLB0zNIZWCbP3FeXQAcvgXr24kd?=
 =?us-ascii?Q?bmi4S57MrncE1pzCL7BSlQTZ89xn2pAqIAJ6mBlOnkt6cc79FYWh6RsbOGOj?=
 =?us-ascii?Q?oDUlYPWCXqbCgEZnIlnrKq+xR4LsOoak4RW1Rni2pA+ouXRGBvlpsppnwDn4?=
 =?us-ascii?Q?lT3D284K3HEiCUBkN0NqG973ZAg5e0GoEcFyScvFZGof6myGwZFvUwJRJGAr?=
 =?us-ascii?Q?b8gM10vCiFoss0BVwzq5yda2M+Kjfrg3B2aisLaL1hxw1maqe2H5Q7/VYZ8Q?=
 =?us-ascii?Q?PbO4Row6JKpLll1PjZD7n/pe7L/fJ6AEo5qbch6l+17PxZvS585QfF3gqNbJ?=
 =?us-ascii?Q?/58ItPrAKl8hpSN1NyKQ6bc+kcoRG80NqsmwAjbvr4vUEhLOrr1pAKskH10W?=
 =?us-ascii?Q?PrGAV1ojTdWfILob73vtPrFcdX5Fu6gQviYGkuK5zbDMqCsSaMuO9ueVKLN+?=
 =?us-ascii?Q?DEzb0Ml0NhBsrjSYFwklJfvus8w/V9yP5Y+tV+ib9nLMw8PNApryiaI9ItLp?=
 =?us-ascii?Q?WFxkRgjgI6TuMmI/1CKsDRBNVtqCxmckynwXEEidwMUsKcWQ2VdJs9GKg80q?=
 =?us-ascii?Q?nQWLViGWIROzzD6zLBvyO+RMAxp1AUk0dTtDMDHPXAIZVjgVcqSbqMSu2bVR?=
 =?us-ascii?Q?l5HTFSohwET+/8HqfDq+Jo/5rzkTXqYAiX38+vd+9Nvwj4QUqOTpO3yXFZk7?=
 =?us-ascii?Q?crduZzSkDDJsIztsQeAR0sV2w3BxBexqWCeLRXn1mBJ10ggogOEjU53IzTYG?=
 =?us-ascii?Q?20EPQKGrjwRii6QevVx3FpT+WEnh4pn0Vo3MFI9FnTNgZKdbqSBSA7tL81up?=
 =?us-ascii?Q?yblIkVtPzhk4jDb9GboTRsR6sjD1zETCMWOlC8ASWOzZkk8ZiuIp1gd8CXUw?=
 =?us-ascii?Q?zt/jZDdEVl7cyHdbfvO6TYtdkJPZ31D0tP6YYghWXUJkkjbWCPoHIWqNVOKx?=
 =?us-ascii?Q?kR7D+j3654SIjM78qjuBiaqkZeL/NyhuX9CBGJG6bR4wUO9PXq5XAvUZFBR0?=
 =?us-ascii?Q?HINRJKsdf9deUTOUEAtcJGKSCqYQYOYg/rCbsNqOH3Y57AzTE3LNm0jKn5OQ?=
 =?us-ascii?Q?iwhfMgkLbJ6JW7NiLn2GSEksQvdM7b50AkUnOFUSjxnCdAOOpdPJqJjM2stn?=
 =?us-ascii?Q?6JEcX+F7n+Kzqk9kWJuQyUOvjFYDJD4QhoJjzWy2yqISAoGOYDKW8rUSc60P?=
 =?us-ascii?Q?+jlY7UEznSs1iE76VnyiHsPzW27oQ68ZJK3FUJb5e0frJSl1mtk3gFn7/xV1?=
 =?us-ascii?Q?MKWZ6wUzEuvxJ3KzeceOU0vtMOec60XyOZvc26LYEqWUPihF3NX/KfMPyqed?=
 =?us-ascii?Q?gtyiMWIa/AYGKgOUIZKr0ntlo76U+42noeZpo2XSypzpl9KLMH8asy+On3tj?=
 =?us-ascii?Q?EwZ0i22jpdltUwxOyKgdEgyOw4YEZHr0MvWHgCQvoJngX8rYKFNpCzF1fXar?=
 =?us-ascii?Q?fNoTG4OzU8F0X+aGOOLfXUvRjRlGa7GM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WTkMrUhaqPQ3IUb6gN1XnO/Bv6bu4Rq4Zm6jn5lW99utqwlbVNXwR/Qcx6bg?=
 =?us-ascii?Q?muil2FpJ0DkwSovN2gegNidnsxvoZeVE4X+8adST/rI1jIGKjA7VNoCzoNnt?=
 =?us-ascii?Q?QLVlST/dtx4P8B5ykXbtEOV5Q0PPSbVGUhMEOqDD6Zeq/u2Kiv3SvvgqDJD2?=
 =?us-ascii?Q?9V0iShAaK+p0ZH9EoICVuqTsPWW+8WMk2oI3iIC8ht/VxNs7QJ7/PqWJhYk4?=
 =?us-ascii?Q?aQ4nbS+plp3M+FADrwxpHeeQPoUJOUJjStPVOr93GzRtPkqOJiTBF+EcLohK?=
 =?us-ascii?Q?XvP5Rq4QraKj5M9lhaBsoHwVS0RKKRAMbcmeZ/Ev85dedWVTFrCbnAHH30wu?=
 =?us-ascii?Q?9xQVWvQvFPG+6lcLo1cc46VjqxOacqgi4CgtuFDZwgmWhorUEWQoQd7RBEob?=
 =?us-ascii?Q?qoXER16+jDbxSXWiAg0A5uRkNpAXkwA/T6MhK54l1G4/srxSE7btZOPJzVEj?=
 =?us-ascii?Q?1uZxzTAzE4roUHZ+uPdjM4Ejq36j/Ax21cKrnnF0kqtZopeLQc9qWFDvm4oz?=
 =?us-ascii?Q?Jd9RVEmv0zN5SRbyZsdw1f9guiXEHXExJvuOdcTOQNS7YloTzIHa40Xr4YSk?=
 =?us-ascii?Q?JOG3+hNTnKWnnMHcUGu7nqUYCvLdmbPF0f6k5Iwc5Ko8HPZqAOtdujJ8271M?=
 =?us-ascii?Q?c9m/uMoeC8bjhs6CXFyaoq6HEEMCRIW+JmLArrrgBLmK5pF4wQ0mrIUEj/72?=
 =?us-ascii?Q?tcz+9t1OgDnkk18fdSmY2pMzypk2M93Y23zn+8cH18gPTABEVyBL7xfJZYxD?=
 =?us-ascii?Q?RW+Jg3+yvrfQig7fKvaXkoUTZcD1Ih2gAyAM4auPRKTPl0yY+1+Tbk8lPo03?=
 =?us-ascii?Q?vUq2eICnvL2/wFFr4VYj67KDc+iyXCh5re/vpsZwX4bEF+yXNAl+N4RnclR8?=
 =?us-ascii?Q?Dx3LbOX9iSIj1ozsl2TaJ3cZzYskYx6gpOvWmwRqk74NlTMjZ8VnKenNAFqp?=
 =?us-ascii?Q?6V95B1JtNgjpTgDNludzwQE+L867OTUV5N8ZrsJkiV2JLhxewk1bD+CbRD6b?=
 =?us-ascii?Q?i9q7Zk5dMFmVmimggX1LJyA38/76BmLIym6AAnTEbOaG5xglBdp99dBXaLjS?=
 =?us-ascii?Q?AUSjziHiIpLoQpeKMyF/Zlss4RB5fJ/dQnQqpBv8PyA2WgiLUQPo2gqW7SxZ?=
 =?us-ascii?Q?iqizO6/wGxNJ/S4zG25mMUnI0gpmAM7cF6eAIrVSJBEQvdB/6ev5MF6OM1sA?=
 =?us-ascii?Q?6KQK0axmGFQ9EEJ+CH2PTTU+m1UI6JoMQTTPbCWAbirxNeCpYBaglM7KqhD7?=
 =?us-ascii?Q?zUY8moKgxRiJGES76l1RYRt3QLCfDuBEbVQn1fcxdauwaBAeC1rDTVZgNfhV?=
 =?us-ascii?Q?ZPdGXUW6ko1j87f0xEV7h/XpJxcuEUfMo3HDM/Vg53izGKjhsuAr8K+1kKGl?=
 =?us-ascii?Q?5cFjGdHsDQPIDMDZ3pPGZNwde2yK6dHwVUlMQ+EeB58eFKM89uWX3nbP5Xac?=
 =?us-ascii?Q?F//gP3vc8J800kZSZwYn/jOuzOzKgyJR+DCNRztjAXc5ZKtc9B094Hq444BT?=
 =?us-ascii?Q?u6y7OVw73CsaKGpX0sehF+zSFlPIRpgXtiesU3LIROG9v4QPq4KeMSIfBw3l?=
 =?us-ascii?Q?URP/TfpLQCrDlYNnYlE63L99R4y5obT80Hv/1x02duNnt2GyeuFOisFX5cpA?=
 =?us-ascii?Q?4w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e06d2f65-b794-4cbc-115c-08dd734beeb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 07:40:12.1021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eAI1Mkg+lLtWK6YjkSojc4Cv6Q/inR2yIYPcjtsOZgI05R2oChcyJBAg9k5GlwRZ2W2as5hcsn++bTlg+zP4RS1/XgUNIpUCL+Skr5qQBZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4630
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

As discussed, this can go.
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Dandamudi, Priyanka
> Sent: 04 April 2025 10:36 AM
> To: Thomas, Sobin <sobin.thomas@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>;
> Konieczny, Kamil <kamil.konieczny@intel.com>
> Subject: RE: [PATCH i-g-t 1/1] tests/intel/xe_fault_injection: Inject err=
ors for
> xe_hw_engine_class_to_str
>=20
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Sobin Thomas
> > Sent: 04 April 2025 08:41 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Piatkowski, Dominik Karol <dominik.karol.piatkowski@intel.com>;
> > Konieczny, Kamil <kamil.konieczny@intel.com>
> > Subject: [PATCH i-g-t 1/1] tests/intel/xe_fault_injection: Inject
> > errors for xe_hw_engine_class_to_str
> >
> > Use the fault injection infrastructure to make targeted fault
> > injection in functions xe_hw_engine_class_to_str and check the error
> > handling in the
> > xe_hw_engine_class_sysfs_init() so that more code paths involving
> > error handling is tested.
> This is already handled in the kernel, that is the code path is covered, =
no need
> to add this here.
> name =3D xe_hw_engine_class_to_str(hwe->class);
>                 if (!name) {
>                         err =3D -EINVAL;
>                         goto err_object;
>                 }
> >
> > Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> > ---
> >  tests/intel/xe_fault_injection.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/tests/intel/xe_fault_injection.c
> > b/tests/intel/xe_fault_injection.c
> > index 24c114ba7..94c1bbf38 100644
> > --- a/tests/intel/xe_fault_injection.c
> > +++ b/tests/intel/xe_fault_injection.c
> > @@ -173,6 +173,7 @@ static void set_retval(const char function_name[],
> > long long retval)
> >   * @xe_guc_ct_init:		xe_guc_ct_init
> >   * @xe_guc_log_init:		xe_guc_log_init
> >   * @xe_guc_relay_init:		xe_guc_relay_init
> > + * @xe_hw_engine_class_to_str:	xe_hw_engine_class_to_str
> >   * @xe_mmio_probe_early:	xe_mmio_probe_early
> >   * @xe_pcode_probe_early:	xe_pcode_probe_early
> >   * @xe_pm_init_early:		xe_pm_init_early
> > @@ -388,6 +389,7 @@ igt_main
> >  		{ "xe_guc_ct_init" },
> >  		{ "xe_guc_log_init" },
> >  		{ "xe_guc_relay_init" },
> > +		{ "xe_hw_engine_class_to_str" },
> >  		{ "xe_mmio_probe_early" },
> >  		{ "xe_pcode_probe_early" },
> >  		{ "xe_pm_init_early" },
> > --
> > 2.34.1

