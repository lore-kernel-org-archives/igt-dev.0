Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E38EE369D
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 16:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CC810E769;
	Thu, 12 Feb 2026 16:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ULrCMfBG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BAB10E769
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 16:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770912315; x=1802448315;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xl+QbcyRtLOQjnstikM9+pOa+aEcgAATIidy3CCyx8Y=;
 b=ULrCMfBGAlNtu1dUB/T/UCK0/dYvBfWO4WuguOELGAMIoNMwZKqzp2IT
 2ccXNtaeyrhqPbJydpJ7ZTh2/5+9VHSyRXgtgDm+Uf0AG6qFjwqPnJ0ls
 VDtVjnnYlgvimpB7bwj8xevAZTVSCgw9Ql2lATsRIn6wr0rEMcahcSNjD
 4s1eBA78wWYnCblr66wvKqh4N52EVhh+0ClouVdx0BNj+hI/PI8TEZH1U
 XVqmOi7TfCHZOzE8RRvhhA/csKTKlbEDTPdebZRNCWpVsTV6QvD674GRW
 Uk5UGoda5tEWDXgm5RMSvtPyewKuMCCGAoaRkweUfBQVsEZp4/CvtZDBx w==;
X-CSE-ConnectionGUID: vO+C22kzRUON4diQJVs9Aw==
X-CSE-MsgGUID: eQkmTybXSQWcwpVMwvr2fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71113327"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="71113327"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 08:05:14 -0800
X-CSE-ConnectionGUID: TuhihaFsQiSvJ8CB6QenqQ==
X-CSE-MsgGUID: 23kAEDzZTD69pszTGBLLVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="216795285"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 08:04:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 08:04:54 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 08:04:54 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 08:04:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5EA6/mPRL1RDP4G6/P570Kj7sPpOkd+oH9AwHxE0kjoRc8njEMxePvLVnxLDjTCoMa5wv4lHdbwmPIUxXZRCS0P3xfyl0mtoLQwQzXSfwhViagMFikk+ip1GGHUXRDoEMlJfEK5HvSOUCVeNRGvcUh+PIR+HtKgxtFKytpda3EeAhQA+Mf2Fc9CDEtDhyxUhPxvPjd+Z0UupYnIW37Wl20jyADvDnVG8fgbBE6QbYUDbbeDSZY/GjBDt/BkwWm+FlUGzl2MMtCYVxUJ00LYxYqCkJlPHMafvIcSKO4asoXdBXjxrkQwBvvPClSmaZD46Cl+sq9+HPLIDs2NSRP5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNjrVYn4VudJKh7iERucCKMoqhFYtzt731VYCSIRAiU=;
 b=epyEyHjr06/nlH7WKbxE8tr9/nfTYDSN151M90XUk6qc+sF4sK5Ayr419VHqOoARnXtBT7FIqA8szwrU8FVtv7FKT1n3MS6uAXL2DPRTFEpBEc13zEzfNJ7U0D6qlUW45hXQtwmF7fKkNBWv/PclsiVtI2/hVMu4EX/ERt61P0o/Re3KgQIJ+sRpbu8fUYpXWe6SPtX7tWhp8xDuShdrDABSnGQ+w+xAbP0i6MTeQgcdpSgS4C5znjPLMon3+BF2Zp9zJ43wAtrZzY9O2zVcZxQFHI5dBoKcXd83/1NT2bNU8ujPgD39H3xtjWP0W7wcUjWNrAVFBD9qcnRghgy8eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by PH7PR11MB8549.namprd11.prod.outlook.com (2603:10b6:510:308::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 16:04:51 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 16:04:51 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v8 8/9] tests/kms_writeback: Refactor
 writeback-check-output subtest
Thread-Topic: [PATCH i-g-t v8 8/9] tests/kms_writeback: Refactor
 writeback-check-output subtest
Thread-Index: AQHclfeOMVs61P/mg0SBJtKXuvtT8bV/RZig
Date: Thu, 12 Feb 2026 16:04:51 +0000
Message-ID: <MN0PR11MB60347FD8953B39400C7A0E1D8160A@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260204171819.292327-1-sowmiya.s@intel.com>
 <20260204171819.292327-9-sowmiya.s@intel.com>
In-Reply-To: <20260204171819.292327-9-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|PH7PR11MB8549:EE_
x-ms-office365-filtering-correlation-id: 2e7da8db-31cb-4cc6-5988-08de6a507468
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FZdR+C3dsP+pumaBimD6HzW0jlLb9wwxaS1pjXkmnzmv9Yncx9TG2+5H/Fr4?=
 =?us-ascii?Q?E9qsrP3wcazGDJAuv6CQdU2NbWT0BF3lLEmMRwqTJwkSvzY14J1I95WulS/t?=
 =?us-ascii?Q?Gnjf4RcE94xhVaWVWdJG9Je7FyGchTrxZo72sNkxhpI8QbhHff1W37Jjur2C?=
 =?us-ascii?Q?hSII16u1qn34VwxZrRommIMkUftjqEoueq+OWe4KbFcEyG9Ei07ldMbWlP4s?=
 =?us-ascii?Q?nUpJAJq43AYNYX/UVD1IR2MNVaNNt6mYjY0Wgx35WrYHiFRiqLBEd8vcE0O5?=
 =?us-ascii?Q?RRWNqKMEAOo6T1Hmnoc8a8DyBxnaGdES/c4rwQte1WzLJXjnnZQTkXnTL3rm?=
 =?us-ascii?Q?mRjZ8Oy47TTKYT9tRwVr0sc+BatvEe3QOdnL51Wx1YKkxCesoQtfOlNZnodE?=
 =?us-ascii?Q?OcFRfSwUmf7FqpMBEAzh8j3FEuWqrmB+sohjtn83Z3zGHnqTkm01/PEFvNlo?=
 =?us-ascii?Q?PuvGJV1J45P5HHbwAqm2c6IUy3XtinRpVlb7d81EidyVOR/vSOhivSJkbSM5?=
 =?us-ascii?Q?2WcztA3nq/tc7ekcgf/bMZl2Q4Uq8sleUmSfof97c9iIF3yZHF+y6FHj//MZ?=
 =?us-ascii?Q?zDfdKEVDbFnqVH2ySU/2u+5SJA+Y/3obpk62soqMqdibBTmwFDX45aRPuYya?=
 =?us-ascii?Q?qQ8L4NswfZYL5b/m62mOhTKD2DsaOezTlwFjYKpN6ap2diPSefK38lbYbBtS?=
 =?us-ascii?Q?/p0PlNiWMIhPsIR5BvTdfsJDIR4D5wJbXWxEcOxPPP2pGBa7WIBoTYJYURZZ?=
 =?us-ascii?Q?QZulMm4zbxvt75SSrCxLyULv9ALHmMXJ/oiKIuTW9O67kTnthnP5aSdYrdyI?=
 =?us-ascii?Q?gTQiRSHEqsHHU9zVlpbeOBMw5CDGa6FOJRPksPrg+D2Hhx/pbNC/aDoW/CKM?=
 =?us-ascii?Q?sgTZWFC+OmCdL+0bQnPJPKewXg3g5Sqf7LC6cZPFC345vHcAsAXwKScM+bLV?=
 =?us-ascii?Q?t9wqTks4XS7tEqNba83cKc9c3IcDX/2QVcGHCy+sjIvfbKwAzP/dp6VZysmJ?=
 =?us-ascii?Q?7Ks0bdWbntuzbOJgl3T9wSkLzE91jx4dqJ2c7zl96fs7pPLf61wzNC7X8e6X?=
 =?us-ascii?Q?L5/Djmo0Uf6CTaUWebkGkI1g36bjJdV2MA9OlhZFb/zsF/u9OsMKJ1XW/BrU?=
 =?us-ascii?Q?izxLMYqdrW5nt61+ANoRkEOuQ4MQCue/Pr/N3GlOUXf2XfQKf3Bl6deVMNYb?=
 =?us-ascii?Q?EYSJ4j40dVcjv9CP4ztifvB9LqwH6gReCqIsN6sa0tHIT+InYbpHlQW+7wd8?=
 =?us-ascii?Q?TFOY/knemmU1r2AJN0l79DCl84uuNaaFbB3t2DOT3OtuAlzBPveL7YDGScXr?=
 =?us-ascii?Q?9yb6qQB+BwkuUdA2V5KbN6luL69yvo/dp48EdhG7hUZiDiB8I6bNzXOj2DQR?=
 =?us-ascii?Q?UfTAq0DH/QBuYDtwAis08UG8Dez9A1cUMVtRSM5URNKjfRP25y1t4bSQL522?=
 =?us-ascii?Q?Eox2jCEI7LkTZP6TIwrBtz8+F6RGULfrFVDahDhcgU3BBc4/MoAePwd+Zwk4?=
 =?us-ascii?Q?AGW05HZ6tQgCOYcia5QjSpyMgmxZThxb3SUcVvyKlD7wrynr0WnIeCRBzlYy?=
 =?us-ascii?Q?14W248xFE8UsI4Qv4NcR8a//OZxMwsy7//5PExFyR9Di9vNbWuZCIB933di0?=
 =?us-ascii?Q?N7wBvZR/sbPoizKl7QvR+6w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EBMmoBdJTqVQRXqIpTIuG1jZTxCBbZESgr50ISl2Igo4ao1ettnkQI1S/oH6?=
 =?us-ascii?Q?EMdu2oA2NIorFAcdsnVU9tK7Vt+R+HeuqcvAvZo64bj2y2Qy0x6pzZK/rUgc?=
 =?us-ascii?Q?bzSssfllyW11f7C6eVcgDEmjKgU/dPNHziJdZ5+mFYhvf9MWhGrUDnxLMcIU?=
 =?us-ascii?Q?ehVAkwpvoJpHCadPgRoSuWvMlJdqITObhLJXE50IFn5TAsj2t8o4CG0aOfvQ?=
 =?us-ascii?Q?mGJxKM44Mh3xcA1cROyJuRV5fEyf/KZ7/kUo00xfCvt8xel37zEIxy0JJ8lg?=
 =?us-ascii?Q?8xRA3ZhHbNnEmdRO3kd2cPK++/DotK/n5cNSa3AQHVcCAEhNKmikqqIAtcNU?=
 =?us-ascii?Q?of7SPbzghZ+4WkwMJJmwJd79lC35afYzyYDJ05zkllayzFo064CQVrMZOzUD?=
 =?us-ascii?Q?JWRB6d4bOMictHYepZQVfi71anky58z3wgEsLgR60QV55xMXFXSuLKUQJZZ/?=
 =?us-ascii?Q?Ld+5mfttq4dQ/W794b1f4qWJnXKuPb+bou5pqC/OXXd8tV8RzT09D/VScQt5?=
 =?us-ascii?Q?4JMorunajR44tGMPySDGvGW9Sdw3YXInKOBCKYrEgrwCRgwimK4tAErAH6Ie?=
 =?us-ascii?Q?zAC96A7VvwYMco8/+10HEK//yeyePbcxMwdBFCZzR0t6VJpm0TBNBc9Tcv/J?=
 =?us-ascii?Q?Fm86x6+2uhcOTYl1xHUDbzkzcyDJuy3yMekN49qHR2b8MevUYPIKoM/VwOr4?=
 =?us-ascii?Q?r5jgjjVt0h4fp4NuLlo4UXphG3pXduon9SenGdqwjsc6uFldUi2UFL/o1YWC?=
 =?us-ascii?Q?HS7/8/VfwnZVX/J9EyUw1E9BpnWe9r1tx3cxYj1JLYkA9DeGsDxGvUyZ9Ud8?=
 =?us-ascii?Q?8wfLhIez0zIclpqFSr6pG7B6ovGcY1pdsXxef/RSaTLlwPMjJrYCit0CwiRw?=
 =?us-ascii?Q?JnvKoYKMWwOgDxa3bp6Zg1bV6pYJCVDwfdDemS/5royz2ejy4MByW51s7pMS?=
 =?us-ascii?Q?c8BaM6V1dg4SmraJ1kVsHWKZ2SzWXO792LRXlq3c94Qr+Q1wzj2WAy2QzI0A?=
 =?us-ascii?Q?84fQClu3l1RZ2QWOavtk5Q0+WkUv+XBqVNKgumCpcopU8xNU7XichpmDOxn5?=
 =?us-ascii?Q?+rAJ5BjVDNoPx86hNOqiaWeL6V3tsvtNgOoA3yoPUEsmlbXV1p2oG7yOKR/X?=
 =?us-ascii?Q?u8DoQGeX5timotfyRJWg71G/M4QYbV0slIBZfEx6nPv0pRYJm5+KHrU3G2It?=
 =?us-ascii?Q?mpgcV02f8kCxNqagsZsop5wSaw+D8PcWW3lyv7VJqsvOyfW5HICG6vi/j2xF?=
 =?us-ascii?Q?h9WNUPZu/4a63JFNPWTNL0Ofi9pyIDZb86bJRr61mLZD0/7vWKceQZXbN/wV?=
 =?us-ascii?Q?5NUCDtX7KbIZ81TdFPQwTqq0EnovFCipykLN48R6Z1nlZAriZz9kMSrMZAMt?=
 =?us-ascii?Q?NFPIq+RIx8nyy18PkxUDZF0Rw+tDKk7cExL4zkcZINyHfR6xcZAguxxGJZ5c?=
 =?us-ascii?Q?K2F1LwuNJiqXizfyNQDmJFJB6rKTG1Hom+LcLbQdGrr46Navdrx+Upncv7D9?=
 =?us-ascii?Q?vdVo1mq6tZgpCE4+6X1ip+8VBGb3wKWzb5wcrozkMmzFXvoKfXw4ztCTcsiZ?=
 =?us-ascii?Q?bFy9KtF+d6G+tSaOFn9PJxve9uFSKcCQy9Um3Ki4zAq7O+3Bg9DZwqjQv9GA?=
 =?us-ascii?Q?Pc9X2XZcy9eligQaTBCwQHOTN6IktuJe+NS73w34ifNr08l1Hey1FMl2ixk4?=
 =?us-ascii?Q?kTKibS4bqNNM/bKxAy2GAYLe3U1zOz+YCxAWY3BofM6GUfUTwPdWdhcWN+my?=
 =?us-ascii?Q?6D2PZN55AwvggOueCPk7C1AYkcuRXsG2w9YfBXnf3ToiLqUnY9TlDuQLIKcP?=
x-ms-exchange-antispam-messagedata-1: l4bWqI1FeS0rPQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7da8db-31cb-4cc6-5988-08de6a507468
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2026 16:04:51.5707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wG1MJzsjbKohUsNB3BVwF6Zld+W1BQkBmhj8V6t8i3Pi0GtY0XYs7j0vAvDccOiohUT6B+xdWiN5NCV+YX7xOCQ74gP74grXm2gZg4hh+ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8549
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sowmiy=
a S
> Sent: 04 February 2026 22:48
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v8 8/9] tests/kms_writeback: Refactor writeback-che=
ck-
> output subtest
>=20
> Remove individual tests for each format for the test writeback-check-outp=
ut and
> introduce dynamic subtest generation based on the formats
> supported.Framebuffer creation was now part of the subtest level based on=
 the
> format and removed from fixture.
>=20
> v4: -create testcase for BGR8888 format only for intel
>     platforms.(Suraj)
> v5: -update the documentation for dynamic subtest
>     -update version info (Suraj)
> v6: -Remove in_fb inside subtest and reuse input_fb from
>      fixture (Suraj)
> v7: -Join nested-if conditions (Suraj)
> v8: -Move FB creation after igt_skip checks (Bilal)
>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  tests/kms_writeback.c | 59 +++++++++++++++++++------------------------
>  1 file changed, 26 insertions(+), 33 deletions(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c index
> d17e2df47..1892ddc47 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -45,11 +45,10 @@
>  #include "sw_sync.h"
>=20
>  /**
> - * SUBTEST: writeback-check-output-XRGB2101010
> - * Description: Check XRGB2101010 writeback output with CRC validation
> - *
>   * SUBTEST: writeback-check-output
> - * Description: Check writeback output with CRC validation
> + * Description: Check writeback output with CRC validation.This test
> + *             dynamically generates subtests for each supported pixel
> + *             format (e.g., XBGR8888) and configuration.
>   *
>   * SUBTEST: writeback-fb-id
>   * Description: Validate WRITEBACK_FB_ID with valid and invalid options =
@@ -
> 717,37 +716,31 @@ int igt_main_args("b:c:f:dl", long_options, help_str,
> opt_handler, NULL)
>  	}
>=20
>  	igt_describe("Check writeback output with CRC validation");
> -	igt_subtest("writeback-check-output") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors &
> XRGB8888),"DRM_FORMAT_XRGB8888 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      igt_fb_mod_to_tiling(0),
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> -
> -		writeback_check_output(output, plane, &input_fb, &output_fb,
> DRM_FORMAT_XRGB8888);
> -
> -		igt_remove_fb(display.drm_fd, &output_fb);
> -	}
> -
> -	igt_describe("Check XRGB2101010 writeback output with CRC
> validation");
> -	igt_subtest("writeback-check-output-XRGB2101010") {
> -		igt_fb_t output_fb;
> -
> -		igt_skip_on(data.dump_check || data.list_modes);
> -		igt_skip_on_f(!(data.supported_colors & XRGB2101010),
> "DRM_FORMAT_XRGB2101010 is unsupported\n");
> -		fb_id =3D igt_create_fb(display.drm_fd, mode.hdisplay,
> mode.vdisplay,
> -				      DRM_FORMAT_XRGB2101010,
> -				      igt_fb_mod_to_tiling(0),
> -				      &output_fb);
> -		igt_require(fb_id > 0);
> +	igt_subtest_with_dynamic("writeback-check-output") {
> +		for (int i =3D 0; i < ARRAY_SIZE(fourcc); i++) {
> +			uint32_t test_format =3D fourcc[i];
>=20
> -		writeback_check_output(output, plane, &input_fb_10bit,
> &output_fb, DRM_FORMAT_XRGB2101010);
> +			if (is_intel_device(display.drm_fd))
> +				if (!strstr(igt_format_str(test_format),
> "BGR8888"))
> +					continue;
> +			igt_dynamic_f("writeback-check-output-%s",
> igt_format_str(test_format)) {
> +				igt_fb_t output_fb;
> +				int bpc =3D igt_drm_format_get_bpc(test_format);
>=20
> -		igt_remove_fb(display.drm_fd, &output_fb);
> +				igt_skip_on(data.dump_check ||
> data.list_modes);
> +				igt_skip_on_f(!(data.supported_colors & (1 <<
> i)),
> +					      "DRM_FORMAT_%s is not
> supported\n",
> +					      igt_format_str(test_format));
> +				fb_id =3D igt_create_fb(display.drm_fd,
> mode.hdisplay, mode.vdisplay,
> +
> get_default_fb_format(&display, bpc),
> +						      igt_fb_mod_to_tiling(0),
> +						      &output_fb);
> +
> +				writeback_check_output(output, plane, (bpc =3D=3D
> 8) ? &input_fb :
> +						&input_fb_10bit, &output_fb,
> test_format);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +			}
> +		}
>  	}
>=20
>  	igt_fixture() {
> --
> 2.43.0

LGTM. Minor nit: maybe free output_fb in igt_fixture for better cleanup, bu=
t not mandatory. Overall patch looks good.
Reviewed-by: Mohammed Bilal <mohammed.bilal@intel.com>
