Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EC6C54E41
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 07:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A8B10E6B9;
	Wed, 28 Feb 2024 07:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qn0GyAmF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF4E10E64B;
 Wed, 28 Feb 2024 07:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709104889; x=1740640889;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5d3W7VjpLmn4G/iCgsG09W9zdahYovc6HSUXG+nzpoc=;
 b=Qn0GyAmF5W2sc0Ed45ew4uNrNFeB7S+RIrxzanC+aPNCK+QzGm74XkWs
 XQUhPtYb0ezoMDLSLPVjaY4WyAB2Ove5DT2B6cZPu/LklRj4pWHYjeIC0
 gvZlmqYx17ZZl+yUW0T+xoB3uBLOUquv9l20GCQ/4wDIuE3KeGXBvBTtg
 ujwtP4W8Q6JH5w/KSHJKWqxz448B0JElOaGnUG7+5+GcsrD6HoUF7gKGH
 Av9cfuAJe0KvoosJZEdU0xXw0am+8MXxmIc37Hh6LTyqWESSQ5fu3eGHX
 rAy516rrXY89t8Uyi20Z7khS8UI/f3T+LU/7OuIjxYRp7Zs/zFBzoPIdi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="4058300"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="4058300"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 23:21:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7371963"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 23:21:27 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 23:21:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 23:21:20 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 23:18:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bp1PHmrXZJEYDe2W/+34aWVoJ6peJoEmQt7qgbopwrDoWXy9cfBltDC78tmRsKaw3jWUQ8hezc9r8Kc25lX0yELKgHuX9HXXWqHmFHoF9ombcaWLJnPuGE8waNc9aYHnJtGNQ0RyROeRgUyvvQ2bS2zdF4/soAKlm/mYQrGB5AZ2fCvyoxeTV7qW91UjuQxFyHcHE5Ms++GaJae+tcTWpiNxiRRqIz69mqetd50sjyNgK3+lhbsTfKaSTRjUDwLHUlQ9o6bYpakczTklqxSvnnZXlKcjxb7w/qUUiizFhijIt9vukzKwr7RfyF7gd9OKmRQ87STh8FA+/mQUqRs5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5d3W7VjpLmn4G/iCgsG09W9zdahYovc6HSUXG+nzpoc=;
 b=ATF3LnhytAUWslq5YvDd4WwAFmHfOhKN1mYm6oAXGum+L8ATlv7IKr6uq5yGG+83JQuW0g3E5Ews0pizwl4chP3rovGwMda1FLhS/1kCwRQqWsN41j8T1xc316xyDn5q86jPx0fFLNztvzHEZ7/pG4wDKJPZOkkB4EAs8Qd0qayEKGuSTtRcawVGi6YQFKX3oFuD0kVX5l3waGsXihJjHoBP80vRiszF7S3bK2uHRvEZutEo2L6G+lF7s2AYy0+88khti2BeBov7kYSk7Hvh4FqabW5L5XSSqAU9bVbviGdpnF58E1BfccmlCQdsHQ0yUcUhYsd6Hl+Zd/QrbMSigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by CH0PR11MB8143.namprd11.prod.outlook.com (2603:10b6:610:193::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Wed, 28 Feb
 2024 07:18:35 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::9359:9512:f038:13ae%4]) with mapi id 15.20.7339.009; Wed, 28 Feb 2024
 07:18:35 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>,
 LGCI Bug Filing <lgci.bug.filing@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIGludGVsL3hlX3Rlc3Rf?=
 =?utf-8?Q?config.json:_add_sriov=5Fbasic.c?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaW50ZWwveGVfdGVzdF9jb25m?=
 =?utf-8?Q?ig.json:_add_sriov=5Fbasic.c?=
Thread-Index: AQHaZbX+LAcPzQV6gECRNkYWsGLfvrEcdn4AgALe1DA=
Date: Wed, 28 Feb 2024 07:18:34 +0000
Message-ID: <PH8PR11MB67534E4874319906C9EE168CF2582@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240222074337.173747-1-mauro.chehab@linux.intel.com>
 <170862347502.216122.3422604783711275542@8e613ede5ea5>
 <20240226104548.tgsc2r3alpng7qyh@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240226104548.tgsc2r3alpng7qyh@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|CH0PR11MB8143:EE_
x-ms-office365-filtering-correlation-id: 9e5bae6b-1c71-43c0-7731-08dc382d79ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gj/1uUJD+mngVuj7KNd51UeAvC7C1qAlPgHHFeEZ5cK9MaoBK7N2H2deoGjH9Fd3zOCrua12tb5J69YvbpEapYHc5FY0I1/VeqJM07owCj+kzHrmJpwJY01VcOAQFK4Fh6DuCqs3ZxWid/+ipcphux6GkDcKcJGrY/TutIVatysZiI6mlDTxFFjkpvAoNPedxdHFSr/XuPVfwI6udjJVXSK6k/9X2niEgdWvRNCe35NAVP8r1CyVyres0D4ukUcvO9hySHs65+LGzMRxOcgy3NqHnEBzfbL5iHIBoGzAYRor+Ydu5VdlXfh4rj1eSGWW88Gy4YhBbyoTRIAKK14SIYYKCqcqqfr4kGXVQ3ZGX3nq5BaoTo29ALVzyJ2manzpSOKeb/7fEi5vj2CEIgKzyisJMPTor2sKIzfhHb1jNnXH/xGjkW2bJECBa2BPoEnjf6hbY98jf955gl4WTUsSw8K2xzvKyj2tt4G0YN67WWJi9yRp+R5GavRtDcBuFbf1Yd3wOQe0CL83o7/Vv+qf0w7OlFsKC+xHpIYNSDyz9PuSggcnJ0X6t2TGmWg3gd3Rh3mTtGRJXBLjeDC7twkNVVTLNF9Q29zFiME1ICnLawh7S4GWAfKFfRqsj6/8OjUWrpUg2uNygS6hpSFeNhlPm33h+1pRmHwkG4wYaLIiaNtMCZssa7SClawzfrtainqo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWVnd1Y2blMza0U2RTBmZjVKK3ZHU3IyR1pCZ2JkSklWRnRBRUVPWFpnTEoz?=
 =?utf-8?B?Vmw3Sjg1WnRjdHlFWEx6bVpWS3NKa0tVMmowNDhLcEI1S1dIVHI2YXRMbEpw?=
 =?utf-8?B?Y0NVQmtHeWRFVG1od1llVm92dXpLenVuTERtVGo5YlFGRmFXRU4xYk9QY1Nl?=
 =?utf-8?B?eFJmeHNqd3l6Rm0vait4ajZiMzVRVHM5dDI5K0VMS3lsV216akVGZ1RwaHl2?=
 =?utf-8?B?bzgrV2lKdlU1bjhIMFlLeVNpRGtMa2NqbGdvUlYwU0R4NUtQYVRQcENIc2hr?=
 =?utf-8?B?cTZpa3pxaWVkamY4SHhEa2NSalozVnp6L0Y5NFVJYlhQelNlTUswbThReGFi?=
 =?utf-8?B?cjlxdVFJU0F2TktUU0x5YVBOckNFUmlTWWh2L0h0QS90ZDBIdWpzb1owblVE?=
 =?utf-8?B?UkNGTUJKSG82QmJPaGxIdzNIOWdHNC9md2E4dW1qS3N2ZTU1VmwrL2t2R1Zl?=
 =?utf-8?B?SjA1QmhIM2tvZUFESU8yQ0JIejVXMEpwNnMveDlRZlB4NmNIMHFYcHRUTWl6?=
 =?utf-8?B?OUdHcDJHdEZnZW03dnNMaUROV3dCaFFwUFdmL2hTNzFlaU9FWGltaVZ4NEVG?=
 =?utf-8?B?eUhNTXY2bjc4NGRMaGk0eHlGY0ZnRWd0T3B1Q2lmWDhPRGlsWG50RWtscUV6?=
 =?utf-8?B?RDJFb3RHeUJmYzNmTThkSEJhUlIvVkpCdEFjdm9GRXE0UzJJdk83eCtwUmt4?=
 =?utf-8?B?UDFUelBrQUhyWG1mNHY3Z3RibEpFTDRJaDJQdzFCeUxXWFl4Ky9KRi8yYnd6?=
 =?utf-8?B?NXM4NGd3QmlOOTFzRTllZkIrRFppWUFyRVkyNGVoUmxDRTVGMmdWU2JvTWRx?=
 =?utf-8?B?OS84ZkpPV2d1ckN0bm1DZThHUHNxb2Ywa0Fvd2Zxcml2eERNdUdnNjM0bnZO?=
 =?utf-8?B?RWhHOVFvcktmb3NGaUx5VnNPZC9GK29iWmJRckZKN0FTbjVQNUY5YTIzVnNu?=
 =?utf-8?B?dE50QlI2M3RiWkY4Mm03eCszbWtVVk1CeHRDOGRYSm5XMXVtNHVWSXp5N1VV?=
 =?utf-8?B?TVJLTXNUQmsvYlB3Q2laRXV5eDAwSVY3VDJIeTBRL3I3UXZoWHdMNzRtbGJJ?=
 =?utf-8?B?NUt1ZWZYZUU0SGlVTFdTS3F6OTFoUVhXRmxFRStJQ2VFYkFpV1poUHBQa2RJ?=
 =?utf-8?B?RDA5RFZaZ2dwanB3UVFwL3psVUdxaHpwWE5IMUxNc2x4QW1LQkZXRVcxZGQx?=
 =?utf-8?B?RHVVVFowRnpkMHNiWndyTlNSQjhYY2l2M2c1NjU5VFFUdUxLYkc5ZmZCZ3o3?=
 =?utf-8?B?R2VKaFp3bDE5bFI3K0R2S0k0STNpcVFmUmJQejlNcWowamxEYTVPZk1jRVNT?=
 =?utf-8?B?c001elJOZVQ3bWRwWU5qWlErdWVNSUc5ZFMwaU8wWUFZQmNyVHZVaVo2K2RY?=
 =?utf-8?B?c2ZZSE1acHltSWxnd1Z1YVkvSVBYQUhWSEdONjdJRzQzMUNMR0t6emxoYW4z?=
 =?utf-8?B?WnVQSElZMzhJTENZRi9kV0crSk9nT0N0N0JUREpZYUE5Z29RNkIxTU1DMGQv?=
 =?utf-8?B?SG15QnZsaEVCZXgwdktQWUI2T3R0alZNQ250MFhFK0xmWTdLa3NTY3lYN3c4?=
 =?utf-8?B?b1gvZitLNWdEanVFL0E1RkJGMFBYUkxXQlRBb2Q0Skg5dHVCUUxCQXRMQnNm?=
 =?utf-8?B?Y1cwZmI1RzJXNVR2UFpsZTY5bWpQZ2hGTlNDUXE4MGpmWEdtT2xncjNnSVBU?=
 =?utf-8?B?TTMrY21jWDhIQ3BndmVJODRGY2cxREhHSUlwdDZtMFMwS1EramNwQXQ3ekd1?=
 =?utf-8?B?V2F0S2lpRFkrSzZYSUtNVE9sNVIvUDAwSXNYN3lMRnpsTTN3MmRpN2lhWVdG?=
 =?utf-8?B?L1VST3FTV2tTTDNFUGh6VE54YXU5d1RSQVBFeTBCOXFuSEZMNjVGNWtkYlkr?=
 =?utf-8?B?NUk3amdXaHNqWS9QVllPQjlHTDEzTU5yenc0NHZmY1YwZEFISXJFVVRGNHR5?=
 =?utf-8?B?UW4xQzNwMFNwaFZhL0ZRTEk0L3FyZEkvZ3pubjdCd1JjY3RTYlV5R01HWEVV?=
 =?utf-8?B?ZUw2ZnRsLytoRnQ2Mk1HNG12OXlXSEh6NHp0YlFVV056QjVHM09iK3NBcXhv?=
 =?utf-8?B?Ymk2L3lqNmxMb2V5bjF5MlVZWmhYelpLOTY3cytaR3RwdzRwa2FacGlMRVpS?=
 =?utf-8?B?cldzNHRBdU8wc2hIYTdVazc3bTRQVlAva3czVUZEbXVkaFViWlJ3NFY1RUdx?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5bae6b-1c71-43c0-7731-08dc382d79ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2024 07:18:34.9321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iFW/d+uZWPSeh8cZglxF2XRtE2uEodpB0l/8AkoJJF/L0lWIX/Ui7NEqm7EPyEZFhdXDtL3mD3lSJiDvyWZRX23fqQLCQacuqqfvjGFHyfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8143
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMwMjQxLyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEthbWlsIEtvbmllY3pueQ0KU2VudDogTW9u
ZGF5LCBGZWJydWFyeSAyNiwgMjAyNCA0OjE2IFBNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCkNjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1hdXJvLmNoZWhhYkBsaW51eC5p
bnRlbC5jb20+OyBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTEdDSSBCdWcg
RmlsaW5nIDxsZ2NpLmJ1Zy5maWxpbmdAaW50ZWwuY29tPjsgSWxsaXBpbGxpLCBUZWphc3JlZVgg
PHRlamFzcmVleC5pbGxpcGlsbGlAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IOKclyBGaS5DSS5J
R1Q6IGZhaWx1cmUgZm9yIGludGVsL3hlX3Rlc3RfY29uZmlnLmpzb246IGFkZCBzcmlvdl9iYXNp
Yy5jDQoNCkhpIGlndC1kZXYsDQpPbiAyMDI0LTAyLTIyIGF0IDE3OjM3OjU1IC0wMDAwLCBQYXRj
aHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IGludGVs
L3hlX3Rlc3RfY29uZmlnLmpzb246IGFkZCBzcmlvdl9iYXNpYy5jDQo+IFVSTCAgIDogaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMzAyNDEvDQo+IFN0YXRlIDogZmFp
bHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJv
bSBDSV9EUk1fMTQzMTRfZnVsbCAtPiBJR1RQV18xMDcxOF9mdWxsIA0KPiA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+
IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNo
YW5nZXMgY29taW5nIHdpdGggSUdUUFdfMTA3MThfZnVsbCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUN
Cj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9y
dGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRy
b2R1Y2VkIGluIElHVFBXXzEwNzE4X2Z1bGwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAo
STkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0
byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNl
IHBvc2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDcxOC9pbmRleC5odG1sDQo+IA0K
PiBQYXJ0aWNpcGF0aW5nIGhvc3RzICg4IC0+IDgpDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiANCj4gICBObyBjaGFuZ2VzIGluIHBhcnRpY2lwYXRpbmcgaG9zdHMNCj4gDQo+
IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJl
IGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGlu
IElHVFBXXzEwNzE4X2Z1bGw6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMj
IFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAgKiBpZ3RAa21zX2JpZ19mYkBsaW5l
YXItMzJicHAtcm90YXRlLTA6DQo+ICAgICAtIHNoYXJkLWRnMjogICAgICAgICAgW1BBU1NdWzFd
IC0+IFtUSU1FT1VUXVsyXQ0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2RybS10aXAvQ0lfRFJNXzE0MzE0L3NoYXJkLWRnMi01L2lndEBrbXNfYmlnX2ZiQGxpbmVh
ci0zMmJwcC1yb3RhdGUtMC5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA3MTgvc2hhcmQtZGcyLTUvaWd0QGsNCj4gbXNf
YmlnX2ZiQGxpbmVhci0zMmJwcC1yb3RhdGUtMC5odG1sDQo+IA0KPiAgICoge2lndEBrbXNfY2Nz
QGNjcy1vbi1hbm90aGVyLWJvLXktdGlsZWQtY2NzQHBpcGUtZC1oZG1pLWEtMn0gKE5FVyk6DQo+
ICAgICAtIHNoYXJkLWRnMjogICAgICAgICAgTk9UUlVOIC0+IFtTS0lQXVszXSArMTQgb3RoZXIg
dGVzdHMgc2tpcA0KPiAgICBbM106IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0lHVFBXXzEwNzE4L3NoYXJkLWRnMi0yL2lndEBrDQo+IG1zX2Njc0BjY3Mtb24t
YW5vdGhlci1iby15LXRpbGVkLWNjc0BwaXBlLWQtaGRtaS1hLTIuaHRtbA0KPiANCj4gICAqIGln
dEBrbXNfY2hhbWVsaXVtX2VkaWRAZHAtbW9kZS10aW1pbmdzOg0KPiAgICAgLSBzaGFyZC1kZzI6
ICAgICAgICAgIE5PVFJVTiAtPiBbVElNRU9VVF1bNF0gKzEgb3RoZXIgdGVzdCB0aW1lb3V0DQo+
ICAgIFs0XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
UFdfMTA3MTgvc2hhcmQtZGcyLTUvaWd0QGsNCj4gbXNfY2hhbWVsaXVtX2VkaWRAZHAtbW9kZS10
aW1pbmdzLmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21zX2N1cnNvcl9sZWdhY3lAc2luZ2xlLWJvQHBp
cGUtYToNCj4gICAgIC0gc2hhcmQtcmtsOiAgICAgICAgICBbUEFTU11bNV0gLT4gW0RNRVNHLVdB
Uk5dWzZdDQo+ICAgIFs1XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRp
cC9DSV9EUk1fMTQzMTQvc2hhcmQtcmtsLTUvaWd0QGttc19jdXJzb3JfbGVnYWN5QHNpbmdsZS1i
b0BwaXBlLWEuaHRtbA0KPiAgICBbNl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0lHVFBXXzEwNzE4L3NoYXJkLXJrbC03L2lndEBrDQo+IG1zX2N1cnNvcl9s
ZWdhY3lAc2luZ2xlLWJvQHBpcGUtYS5odG1sDQo+IA0KPiAgIA0KPiAjIyMjIFdhcm5pbmdzICMj
IyMNCj4gDQo+ICAgKiBpZ3RAZ2VtX3JlbmRlcl9jb3B5QGxpbmVhci10by12ZWJveC15Zi10aWxl
ZDoNCj4gICAgIC0gc2hhcmQtZGcyOiAgICAgICAgICBbU0tJUF1bN10gKFtpOTE1IzUxOTBdKSAt
PiBbVElNRU9VVF1bOF0NCj4gICAgWzddOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0NJX0RSTV8xNDMxNC9zaGFyZC1kZzItNy9pZ3RAZ2VtX3JlbmRlcl9jb3B5QGxp
bmVhci10by12ZWJveC15Zi10aWxlZC5odG1sDQo+ICAgIFs4XTogDQo+IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA3MTgvc2hhcmQtZGcyLTUvaWd0QGcN
Cj4gZW1fcmVuZGVyX2NvcHlAbGluZWFyLXRvLXZlYm94LXlmLXRpbGVkLmh0bWwNCj4gDQo+ICAg
KiBpZ3RAZ2VtX3RpbGluZ19tYXhfc3RyaWRlOg0KPiAgICAgLSBzaGFyZC1kZzI6ICAgICAgICAg
IFtTS0lQXVs5XSAoW2k5MTUjNDA3N10pIC0+IFtUSU1FT1VUXVsxMF0NCj4gICAgWzldOiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNDMxNC9zaGFyZC1k
ZzItMTAvaWd0QGdlbV90aWxpbmdfbWF4X3N0cmlkZS5odG1sDQo+ICAgIFsxMF06IA0KPiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEwNzE4L3NoYXJkLWRn
Mi01L2lndEBnDQo+IGVtX3RpbGluZ19tYXhfc3RyaWRlLmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21z
X2JpZ19mYkA0LXRpbGVkLThicHAtcm90YXRlLTkwOg0KPiAgICAgLSBzaGFyZC1kZzI6ICAgICAg
ICAgIFtTS0lQXVsxMV0gKFtmZG8jMTExNjE0XSkgLT4gW1RJTUVPVVRdWzEyXQ0KPiAgICBbMTFd
OiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNDMxNC9z
aGFyZC1kZzItNi9pZ3RAa21zX2JpZ19mYkA0LXRpbGVkLThicHAtcm90YXRlLTkwLmh0bWwNCj4g
ICAgWzEyXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
UFdfMTA3MTgvc2hhcmQtZGcyLTUvaWd0QGsNCj4gbXNfYmlnX2ZiQDQtdGlsZWQtOGJwcC1yb3Rh
dGUtOTAuaHRtbA0KPiANCg0KVW5yZWxhdGVkIHRvIFhlIEpTT04gZmlsZSBjaGFuZ2UsIG5vIG5l
ZWQgZm9yIHJlc3Bpbi4NCg0KUmVnYXJkcywNCkthbWlsDQoNCj4gICANCj4gIyMjIyBTdXBwcmVz
c2VkICMjIyMNCj4gDQo+ICAgVGhlIGZvbGxvd2luZyByZXN1bHRzIGNvbWUgZnJvbSB1bnRydXN0
ZWQgbWFjaGluZXMsIHRlc3RzLCBvciBzdGF0dXNlcy4NCj4gICBUaGV5IGRvIG5vdCBhZmZlY3Qg
dGhlIG92ZXJhbGwgcmVzdWx0Lg0KPiANCj4gICAqIHtpZ3RAa21zX2Njc0ByYW5kb20tY2NzLWRh
dGEteS10aWxlZC1nZW4xMi1yYy1jY3NAcGlwZS1hLWhkbWktYS0yfToNCj4gICAgIC0gc2hhcmQt
ZGcyOiAgICAgICAgICBOT1RSVU4gLT4gW1NLSVBdWzEzXSArMTIwIG90aGVyIHRlc3RzIHNraXAN
Cj4gICAgWzEzXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
SUdUUFdfMTA3MTgvc2hhcmQtZGcyLTIvaWd0QGsNCj4gbXNfY2NzQHJhbmRvbS1jY3MtZGF0YS15
LXRpbGVkLWdlbjEyLXJjLWNjc0BwaXBlLWEtaGRtaS1hLTIuaHRtbA0KPiANCj4gICANCj4gTmV3
IHRlc3RzDQo+IC0tLS0tLS0tLQ0KPiANCj4gICBOZXcgdGVzdHMgaGF2ZSBiZWVuIGludHJvZHVj
ZWQgYmV0d2VlbiBDSV9EUk1fMTQzMTRfZnVsbCBhbmQgSUdUUFdfMTA3MThfZnVsbDoNCj4gDQoN
Ci4uLmN1dC4uLg0KDQo+IA0KPiBCdWlsZCBjaGFuZ2VzDQo+IC0tLS0tLS0tLS0tLS0NCj4gDQo+
ICAgKiBDSTogQ0ktMjAxOTA1MjkgLT4gTm9uZQ0KPiAgICogSUdUOiBJR1RfNzcyMiAtPiBJR1RQ
V18xMDcxOA0KPiAgICogUGlnbGl0OiBwaWdsaXRfNDUwOSAtPiBOb25lDQo+IA0KPiAgIENJLTIw
MTkwNTI5OiAyMDE5MDUyOQ0KPiAgIENJX0RSTV8xNDMxNDogZDZjMWI4YWI5YTRkZWMzYTUyYzVm
NTNiMjgzNDM2Zjk1ZGJkMzI4NSBAIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2dmeC1j
aS9saW51eA0KPiAgIElHVFBXXzEwNzE4OiAxMDcxOA0KPiAgIElHVF83NzIyOiA0ODE5NmVmMzc5
YTc3Njc1ZWE2YWY4MmE4MmRhNjJiMmFkMmQ5ZGVkIEAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLmdpdA0KPiAgIHBpZ2xpdF80NTA5OiBmZGM1YTRjYTEx
MTI0YWI4NDEzYzc5ODg4OTZlZWM0Yzk3MzM2Njk0IEAgDQo+IGdpdDovL2Fub25naXQuZnJlZWRl
c2t0b3Aub3JnL3BpZ2xpdA0KPiANCj4gPT0gTG9ncyA9PQ0KPiANCj4gRm9yIG1vcmUgZGV0YWls
cyBzZWU6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBX
XzEwNzE4L2luZGV4Lmh0bWwNCg==
