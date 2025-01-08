Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7519E77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 14:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BC588DE5;
	Wed,  8 Jan 2025 14:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yt3gjupE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425B110EBD2
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736348225; x=1767884225;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4BTz5mZsviCOhAbdIUis54fVlzyXbMPZ1ZcLYh8PDYc=;
 b=Yt3gjupELyrmNijaqyhHJQriV5+v9FwagtYm/AjZmcV7h/wUTQ9xjnER
 L90rC+HD0nGqUM0YcR/y1W32nAIUQ4UHve2LoaB7py2Dm5v4v6a02KIct
 sO0ypdZrLET0g20lLuzfRLHMnbgPfnYaqtrcVsQm5S5WvgUhotBoJxmS+
 zAxG8lD+fp0rNo8CR8gqdsuTFfAH1tjap/A/g4abIMteczLnxBaIN3wXv
 HsR9pE6CCm8b76P90rb4JKqUwesvFRW8h6hxE4E8OqrGAzlu6ReMsCiis
 yJezz1Kl26tx0Kbyhqu5GgvznjjRfP+NfHq1bj1HQbJVJN/NPG/wGx8ih Q==;
X-CSE-ConnectionGUID: 1VyCd5+vR3qig4p9jCEZng==
X-CSE-MsgGUID: lWeCOPfzQvOUtfsyITHXow==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35804395"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="35804395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 06:57:02 -0800
X-CSE-ConnectionGUID: vaQsMT1uSjGLZTNQP8Vlvw==
X-CSE-MsgGUID: HqNhWV9pTfm42Af/h933aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="133965290"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 06:57:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 06:57:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 06:57:00 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 06:56:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrvYJZ+VTzVPLuIfvKMds6G4RXVVcqJdJZM1biW+1FoI8QZ2Mtzf05twTlV61xOnHuEwbnjpLX2Mp6qv9PSzBsPTVOP5gmCxCVSDf1Zj0bq3dtaES56wHQvwSNoSjIjGjBVylu3XSpYTBxAN3HYKIRqZywYJmWxcAbu0ROp1Ro3fZigaSbG5PM0WEEIecFUeDmLUEmJVyROzHwbTuIQ8amQ1zgc0i7nJmAp5EN3oCVOemrwbEsHIixn4GFnMNwxgaDAPGI9B2vFY38LA6QH2qt+H9EG8THAPxL8tg833CR5+6XKITkZjthGfOM8H0dsCMDNWIne4oKSmE60eldXdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6vrjCKFUxpgZuvnCtX+n+iS1UCKDt+wg330dal2QWw=;
 b=u9j0CVOHdGpQV7Zr3MQEHZ9olYX5r+nRbJon0PiL4qujYNnDxKvJLwklH8nuOJftauF/gDg+4Qe6njommsVepKL14zFv1rN7n6uYJm8JlYx7N7SxpYmsUw51aIAaKH3bDKdqxokcalPQyjCQ0sV10tupoW2wnPu6N/2qW6SJi5dd69HUufCLJMEyEWpJdgsgY4dKli+Swd5xFZSmreSVljVgf/dLGFWm+dZ3csxZUPwiKPr+gjMQq+6hHpldRxr7Ed6IFE9f1xGRO+DgZtQFR0CqEq3ob2TNQuBFLjunjRc/z9OfRQo/101I58JJ/5m4LOlvdraNqfeXABqL7MyE/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH8PR11MB6610.namprd11.prod.outlook.com (2603:10b6:510:1cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 14:56:57 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 14:56:57 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t 3/4] tests/kms_feature_discovery: Add tests for
 UHBR/non-UHBR over SST/MST
Thread-Topic: [PATCH i-g-t 3/4] tests/kms_feature_discovery: Add tests for
 UHBR/non-UHBR over SST/MST
Thread-Index: AQHbW4xMIQhtJRmR2UCIeUCnfiJeVrMNA18w
Date: Wed, 8 Jan 2025 14:56:57 +0000
Message-ID: <DM4PR11MB63126F1D2EE62FDA1894E49890122@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241231141518.765212-1-kunal1.joshi@intel.com>
 <20241231141518.765212-4-kunal1.joshi@intel.com>
In-Reply-To: <20241231141518.765212-4-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH8PR11MB6610:EE_
x-ms-office365-filtering-correlation-id: 200e2765-8b46-4a3f-adf4-08dd2ff4b2a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Gevn3bfNB5rBUdwVjxO72l/EYRVZ/ugO+KVHMo56S/mZAXCISsPQ+e4b2NEa?=
 =?us-ascii?Q?ygCUvc0JqzI7jOQlySFiOBuqyBoHWzHx55umLmiT+gh9dPo3Xt8fokg0kJRy?=
 =?us-ascii?Q?hv8KM0lZmvXU5Sc3qWKYCh3PnkEWfln2NvJKsYgGpHJ6M8ITNlCtehLylF0W?=
 =?us-ascii?Q?+nMgAhyFxXDeP16kgpLfMebh5hw4J8RZ9qDBv+XpZeraPmMmbjAKJEZnehe7?=
 =?us-ascii?Q?nRqXu3X/o6EW9esQBWqKvlbhrd+x28hctdvpR7Vb4DLr2LZI9m+0Lqswd10N?=
 =?us-ascii?Q?uUQ0YHwGfnifpbyvkcXspPO149ZMKjqDyV0HkJnjw6WCxU6/4syLWqLILTLk?=
 =?us-ascii?Q?+Ulh7K4vxj2owJIR190UvtK0fNecnMUeaZNNQv3cyl13/0dnJhOPckbHeRlB?=
 =?us-ascii?Q?P6Kd2X3uy+fqR9iC51y75SriknzabTw8QcG5vJPUo1cV7Knufcf6mtg89G5a?=
 =?us-ascii?Q?aCgKkkwPMIdQTafz57ABmlQnE1MB2bI/BmfSIdZLYNUU7WTrXs9BQO2yBjv4?=
 =?us-ascii?Q?yegpdNt86qwMybePSzSlsLdssXbCMsdtMNnldxN4xHfhXlLnD3LZYWxv5rb2?=
 =?us-ascii?Q?AFfZygOjNixLDkXWYnx9ZjfLa5gQ5wAcVl2OA7jlVtXC0XvYkOuE23mOT7Zf?=
 =?us-ascii?Q?mSIKeZUb39Av57Ic9z0fsvjQLtGrddBi7tQnhgE77+WkCI7NEh0xqf0IL8+g?=
 =?us-ascii?Q?MeTEailrNITVBnl/dNpaETLVP+/TQg3ZnEBXNZrW+ekIyy2YT3wYL8o2uAwe?=
 =?us-ascii?Q?ya3q2WZmQYbvknp/Cd7yDNEJNJPuW5+SahsffwIpaMFc8a5KFjKjnQH+Zm5Y?=
 =?us-ascii?Q?58BdDbi2nmhCL2zx3X+SS2X3WQ+xZmwjuQfDzlRryna95uu9YApJW1VMl1i0?=
 =?us-ascii?Q?3cy8dHLLw/z/yiLIyycIlEbq+J4Stq/QREjH7jZ2CW4RbyYpkC3bsnRVFJqw?=
 =?us-ascii?Q?u4fMM8Ul7QtdNDySL/urjMs0XH1tYdJJhAXhIg9xAHl/v3/fe+ZPc50qre/L?=
 =?us-ascii?Q?7l7ffrPWXwlxoyEHwgskiZhhqY0v3+zj8fZG7PUIdd8TPBkKThtou752mHpk?=
 =?us-ascii?Q?/C8kP5mzP7EsySMw/s7FdlPCK+BbaLW6x1Cz1nhpsnAwxFxdmaWDPlWR0ipX?=
 =?us-ascii?Q?X6L4Ao0iOEWxN8il/A6gKPBTF/LNnX5ZM3aqX6Z121ZbDHzUge4Soe9oSVb/?=
 =?us-ascii?Q?cIhulsRh4ebe7gNk7TDizmmA/lZLBLghCnojsTk4xsL4WiIcAKCyECE8lLVs?=
 =?us-ascii?Q?sTLVYXEFIrx6G6nGktFPHY8gG3oC5bZ8rbaBcQFr9aK4gmc79vtXL8DMLrS+?=
 =?us-ascii?Q?/4vt0yZLf2EUY0C7BiWa2dqImdpXGpO3J2Nl1VfPUAlkv2bg6H2pW8vfuJGF?=
 =?us-ascii?Q?Q/1sHRp8nyVdB5Pz0CabOxAEMF85+26o++efHzYw355JJJMUq0kP6NPRbpyi?=
 =?us-ascii?Q?gmIcf1Ce1Ditp9etUIUhjNhxnl6U7xj9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iCbVYn4xxwAVOHNykoc+U07M1BwHh3KiHc6k/5YK5Xettveu4qMQ5WI1V6rP?=
 =?us-ascii?Q?Nwiv0ykecew/eMk3UtZl2Yi6J6ORui0lFYW5kR1mzO0eh6G8bXf8xBudTDj1?=
 =?us-ascii?Q?hJBawp1gOa/wbABAcYKDAbC/Nq901lQo5gXr6VJSnok4Nhe2KmjAAkId+ONf?=
 =?us-ascii?Q?nxvm/plkiGe/UKnMZ0hJCRGV/V+lhu7/op9h1/fe2hkbXjwjZWHKxGEHcbrP?=
 =?us-ascii?Q?SeGQo9AmzgNMfnLfAkNFgkqhfhVgkwBQyhJT4mInE4TO66r95CT4E7Knbq76?=
 =?us-ascii?Q?9Wa7/ynnZ4xlEeVDcDcIkPFpBs2RdTI2ZETcBvTDFnHozHyHg/KpiAXumQYL?=
 =?us-ascii?Q?bzlwTwUqEQiqY03wyK6RlppgH+hQxEkYcIvwYOUB203Sj05hKwxFG2fvt/5+?=
 =?us-ascii?Q?wAXnsXEuUcU9p+nSVhSV1oEFN+cOMOyS5TPSVlo4XU0Tf/tGK0dog/9Jda9M?=
 =?us-ascii?Q?XoLL0NXmAGgMYbdYge+ItLBpNEJUDLMaQooCu6yNRzjuFORy+bJj4EFNpeJm?=
 =?us-ascii?Q?6AmX6Ad6/0etIKQhcJ5RttZlMS3yEFKTNMTWwaBFZhqVuEtep6AiW/RMdGiu?=
 =?us-ascii?Q?LBGIq+hxSTJGlCbFaTbVrSvNi0/ioSuyHCqzyhaCDdtgNwfSQ3JLX0XuVX7F?=
 =?us-ascii?Q?OLRNiwJqv8/UoBK3UpYAzknF+OC7+0Th3fmK+xcstIFq/yVQ9oMQcTmSs+4P?=
 =?us-ascii?Q?+M+HGi0GruiyPQ3QjnzEmAbw7tYCA82iKXirxyT6+FkSM76MAjOh1IAEf6ek?=
 =?us-ascii?Q?MKu3I0g5xYE5tjYWzcRsNXoOtf8XEJxhoFuOeD+FWCEA0U6616TSVM3kSJWG?=
 =?us-ascii?Q?W7klr5BCEpiE9vDBQE9I5LaTzcuQ/W7yVO2hQyFsOxrWPz63ZHLp/Rv+cAcc?=
 =?us-ascii?Q?IVbLEcpKpRgxt0vevYoerJqxp4Eltesl20OdoRmrzGI4lJQXzh6DkgVxuu+Y?=
 =?us-ascii?Q?ZK54fICAyD7Ewh1WcIMbi5QLjL0Z7vZ50vXtdBDwEywZKli/XEwargsdm42f?=
 =?us-ascii?Q?9CQrowKNJKn3PV3aIG1Ape32D17jHYwkKM81Evb+UB2CPlQh/PUrK/KoWY2B?=
 =?us-ascii?Q?WTMGPYD51gC+XdgXnbcPqsfBT2glxniWj2iCUVNjb/lzL0222KCkFev7KJoT?=
 =?us-ascii?Q?mwHXUtKf9Cu1lLFYykHq5aJOKjay4ulmFx3A36lMKh4FmiaixtQ/RVyJB0ie?=
 =?us-ascii?Q?zVQIJRDCV1V4I8d5j1OOJ/4p14UJOpGBOfeIGEoP8EGuY+EQVBWy4Pxrf4aP?=
 =?us-ascii?Q?/+EjPICGm4hQqYovNJkceLGKjFTR6+D9Hwo65fWa/7MhRA4tAXgdLqS6EH6X?=
 =?us-ascii?Q?xnLJVnHhVaeh9Wigu5c6dgKnK+V+IUoqCVw4XTNzecBj8r6ccavz2XDlg00R?=
 =?us-ascii?Q?XT1Wn4OuPfpihFbeSX1AyQy0OBeRzui1QTsI3vNh4hM51jqjZr1ySKjnzk+I?=
 =?us-ascii?Q?lAlhPqrEyhD1IC9lijyU0bRtPRTVQwxPlVRYVNlg1az0JgF8nxHANzSUeM7I?=
 =?us-ascii?Q?EHSOv37DJYHW3IifgZSxvlDk3OOL/CvsSyebgOU7gADPQkWTMfaBn8p5H26T?=
 =?us-ascii?Q?/2/qDpxmnixkBsmaccI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200e2765-8b46-4a3f-adf4-08dd2ff4b2a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 14:56:57.2026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3VHMHKjU/mRErXatMgTafv/FHGcsLUR4iv+jaHj7R+nYVwk7Qd8A45pj9OcnC11M1nVl8VHS6L/hUUfL/zyuhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6610
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Tuesday, December 31, 2024 7:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 3/4] tests/kms_feature_discovery: Add tests for
> UHBR/non-UHBR over SST/MST
>=20
> This patch introduces subtests in kms_feature_discovery.c to validate bot=
h
> UHBR and non-UHBR link rates over SST and MST configurations. It adds fou=
r
> new subtests (uhbr-sst, uhbr-mst, non-uhbr-sst, non-uhbr-mst) that check =
if
> the link rates match the expected UHBR or non-UHBR capability and whether
> the outputs are MST or SST. The new test logic integrates with recently
> introduced helpers (kms_joiner_helper and kms_mst_helper) for display set=
up
> and pipe assignment. The meson build script is also updated to compile th=
ese
> helper sources for kms_feature_discovery.
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_feature_discovery.c | 171
> ++++++++++++++++++++++++++++++++++
>  tests/meson.build             |   4 +
>  2 files changed, 175 insertions(+)
>=20
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.=
c
> index 5bca9ad76..150c10fba 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -42,6 +42,8 @@
>  #include "igt_psr.h"
>  #include "igt_sysfs.h"
>  #include "igt_types.h"
> +#include "intel/kms_joiner_helper.h"
> +#include "intel/kms_mst_helper.h"
>=20
>  /**
>   * SUBTEST: display
> @@ -71,10 +73,158 @@
>   * Test category: functionality test
>   *
>   * arg[1].values: 1, 2, 3, 4
> + *
> + * SUBTEST: uhbr-sst
> + * Description: Test we can drive UHBR rates over SST.
> + * Functionality: feature_discovery, uhbr, sst
> + * Test category: functionality test
> + *
> + * SUBTEST: uhbr-mst
> + * Description: Test we can drive UHBR rates over MST.
> + * Functionality: feature_discovery, uhbr, mst
> + * Test category: functionality test
> + *
> + * SUBTEST: non-uhbr-sst
> + * Description: Test we can drive non-UHBR rates over SST.
> + * Functionality: feature_discovery, sst
> + * Test category: functionality test
> + *
> + * SUBTEST: non-uhbr-mst
> + * Description: Test we can drive non-UHBR rates over MST.
> + * Functionality: feature_discovery, mst
> + * Test category: functionality test
>   */
>=20
>  static igt_display_t display;
>=20
> +static void setup_planes_fbs(int fd, igt_output_t *outputs[],
> +			     int output_count, drmModeModeInfo * mode[],
> +			     struct igt_fb fbs[], struct igt_plane *primarys[]) {
> +	int i;
> +
> +	for (i =3D 0; i < output_count; i++) {
> +		mode[i] =3D igt_output_get_mode(outputs[i]);
> +		igt_info("Mode %dx%d@%d on output %s\n",
> +				mode[i]->hdisplay, mode[i]->vdisplay,
> +				mode[i]->vrefresh,
> +				igt_output_name(outputs[i]));
> +		primarys[i] =3D igt_output_get_plane_type(outputs[i],
> +				DRM_PLANE_TYPE_PRIMARY);
> +		igt_create_color_fb(fd, mode[i]->hdisplay,
> +				mode[i]->vdisplay,
> +				DRM_FORMAT_XRGB8888,
> +				DRM_FORMAT_MOD_LINEAR,
> +				0.0, 1.0, 0.0,
> +				&fbs[i]);
> +		igt_plane_set_fb(primarys[i], &fbs[i]);
> +	}
> +}
> +
> +static bool fit_modes_in_bw(void)
> +{
> +	bool found;
> +	int ret;
> +
> +	ret =3D igt_display_try_commit_atomic(&display,
> +			DRM_MODE_ATOMIC_TEST_ONLY |
> +			DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (ret !=3D 0) {
> +		found =3D
> igt_override_all_active_output_modes_to_fit_bw(&display);
> +		igt_require_f(found,
> +				"No valid mode combo found for
> modeset\n");
> +	}
> +	return true;
> +}
> +
> +static void do_modeset(int fd, igt_output_t *output,
> +		       bool mst, bool uhbr)
> +{
> +	int output_count =3D 0, n_pipes =3D 0, i;
> +	uint32_t master_pipes_mask =3D 0, valid_pipes_mask =3D 0,
> used_pipes_mask =3D 0;
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	drmModeModeInfo * modes[IGT_MAX_PIPES];
> +	struct igt_fb fbs[IGT_MAX_PIPES];
> +	struct igt_plane *primarys[IGT_MAX_PIPES];
> +
> +	for_each_pipe(&display, i) {
> +		n_pipes++;
> +		valid_pipes_mask =3D valid_pipes_mask | BIT(i);
> +	}
> +
> +	if (mst)
> +		igt_assert_f(igt_find_all_mst_output_in_topology(fd,
> +					&display,
> +					output,
> +					outputs,
> +					&output_count),
> +				"Unable to find mst outputs\n");
> +	else
> +		outputs[output_count++] =3D output;
> +
> +	igt_assert_f(output_count > 0, "Require at least 1 output\n");
> +	igt_set_all_master_pipes_for_platform(&display,
> &master_pipes_mask);
> +	igt_assert_f(igt_assign_pipes_for_outputs(fd, outputs,
> +				output_count, n_pipes,
> +				&used_pipes_mask,
> +				master_pipes_mask,
> +				valid_pipes_mask),
> +			"Unable to assign pipes for outputs\n");
> +	igt_assert_f(fit_modes_in_bw(), "Unable to fit modes in bw\n");
> +	setup_planes_fbs(fd, outputs, output_count, modes, fbs, primarys);
> +	igt_display_commit2(&display, COMMIT_ATOMIC); }
> +
> +static bool run_link_rate_test(int fd, igt_output_t *output,
> +			       bool mst, bool uhbr)
> +{
> +	bool is_uhbr, is_output_mst;
> +
> +	igt_display_reset(&display);
> +	igt_reset_link_params(fd, output);
> +
> +	is_output_mst =3D igt_check_output_is_dp_mst(output);
> +	is_uhbr =3D igt_get_max_link_rate(fd, output) > 810000;
> +
> +	if ((mst && !is_output_mst) || (!mst && is_output_mst)) {
> +		igt_info("Skipping %s as test expects %s output and output is
> %s\n", output->name,
> +				mst ? "mst" : "sst", is_output_mst ? "mst" :
> "sst");
> +		return false;
> +	}
> +
> +	if ((uhbr && !is_uhbr) || (!uhbr && is_uhbr)) {
> +		igt_info("Test expects %s but output %s is %s\n",
> +				uhbr ? "uhbr" : "non-uhbr", output->name,
> +				is_uhbr ? "uhbr" : "non-uhbr");
> +		return false;
> +	}
> +
> +	do_modeset(fd, output, mst, uhbr);
> +
> +	if (uhbr)
> +		return igt_get_current_link_rate(fd, output) > 810000;
> +	else
> +		return igt_get_current_link_rate(fd, output) <=3D 810000; }
Overall code looks good to me, one question if link rate is greater than 81=
0000 its uhbr and less for non-uhbr case,=20
do we have some bspec id where this is common for all platforms ?? Please m=
ention in commit it there is one.=20

Thanks=20
Jeevan B =20
> +
> +static bool test_link_rate(int fd, bool mst, bool uhbr) {
> +	bool ran =3D false;
> +	igt_output_t *output;
> +
> +	igt_skip_on_f(!is_intel_device(fd),
> +			"Test supported only on intel platforms\n");
> +
> +	for_each_connected_output(&display, output) {
> +		if (output->config.connector->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort)
> +			ran =3D ran | run_link_rate_test(fd, output, mst, uhbr);
> +		else
> +			igt_info("Skipping non DisplayPort output %s\n",
> output->name);
> +	}
> +
> +	return ran;
> +}
> +
>  IGT_TEST_DESCRIPTION("A metatest that checks for \"features\" presence. =
"
>  		     "The subtests here should only skip or pass, "
>  		     "anything else means we have a serious problem."); @@ -
> 177,5 +327,26 @@ igt_main {
>  			}
>  			igt_require_f(ret =3D=3D 0, "No DP-MST configuration
> found.\n");
>  		}
> +
> +		igt_describe("Test we can drive UHBR rates over SST");
> +		igt_subtest("uhbr-sst")
> +			igt_require_f(test_link_rate(fd, false, true),
> +					"Didn't find any SST output with uhbr
> rates");
> +
> +		igt_describe("Test we can drive UHBR rates over MST");
> +		igt_subtest("uhbr-mst")
> +			igt_require_f(test_link_rate(fd, true, true),
> +					"Didn't find any MST output with
> uhbr rates");
> +
> +		igt_describe("Test we can drive non uhbr rates over SST");
> +		igt_subtest("non-uhbr-sst")
> +			igt_require_f(test_link_rate(fd, false, false),
> +					"Didn't find any SST output with non-
> uhbr rates");
> +
> +		igt_describe("Test we can drive non uhbr rates over MST");
> +		igt_subtest("non-uhbr-mst")
> +			igt_require_f(test_link_rate(fd, true, false),
> +					"Didn't find any MST output with
> non-uhbr rates");
> +
>  	}
>  }
> diff --git a/tests/meson.build b/tests/meson.build index
> ffbe1211e..db8919ebc 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -366,6 +366,10 @@ extra_sources =3D {
>  	'kms_chamelium_frames': [ join_paths ('chamelium',
> 'kms_chamelium_helper.c') ],
>  	'kms_chamelium_hpd': [ join_paths ('chamelium',
> 'kms_chamelium_helper.c') ],
>  	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_feature_discovery': [
> +		join_paths ('intel', 'kms_joiner_helper.c'),
> +		join_paths ('intel', 'kms_mst_helper.c')
> +	],
>  	'kms_joiner': [join_paths ('intel', 'kms_joiner_helper.c')],
>  	'kms_dp_linktrain_fallback': [join_paths ('intel', 'kms_mst_helper.c')]=
,
>  	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
> --
> 2.25.1

