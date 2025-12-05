Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7815AD2CDF2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 01:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2997010E23A;
	Fri,  5 Dec 2025 01:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKUCeTLG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902EC10E23A
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 01:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764898476; x=1796434476;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sWgTOkS9Wr7PXFEWjY9ik+fsF3dNacUeBxGfVdEDkCk=;
 b=MKUCeTLGSNORwyv6Em4ipEq8W7yxY3Hlib5KAsHduE13n1xjE6Gfa2No
 b+dOvq8sOQqndN4h3GSPokZRUpPpGAcSk4xnXnQTZm3cN0NURsPFuVSV+
 po2LBcWqLTiS5LvjK3AbLH529Opn6j6OYg/+zVwqvsVaTAhuvO8gMv1g8
 asERVzYMdlik/PvME7MZJAxJHxgV3EuwxWU1uvKJ3b7qNIsfFccT2ntjf
 ncUCTIQPoqxsniTLNK7VaulhhlyCnHZAsDfSX12bWoUwdFfhIVRi21uwS
 zEIX6Y7ttjEO964H21vpCs6cugMeySb6LXe+sB3A+2gJNXwUm4K+Ci0q4 A==;
X-CSE-ConnectionGUID: 92uBhhGeT8SkU4qD8yAA6Q==
X-CSE-MsgGUID: XUGEivPFRqachdAQC6Uceg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66817296"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="66817296"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 17:34:35 -0800
X-CSE-ConnectionGUID: pGAen7HETtqlInOHhTh/tQ==
X-CSE-MsgGUID: ad19zb/GS/2oQrNqVecS6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="195174975"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 17:34:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 17:34:34 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 17:34:34 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 17:34:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPvgk/3WPb9zrq3/sQP019XPZrm1GbDNuLH7ZAWtrZAZdrIdAb+NF8YNrTWOdEbXyP+v0W6k36So5ZBh7oC9pRgCFnz1E9/jUTjgA996pMi4uylmz9wuCejCRBGDX6hkHXZRZKA+tuXm8FdtMvbeT2N9X1n6Gd2KWV9ZTIQ88jlN1IBPBj9D0fSV2pmPqupVQa+6UlYptuh9rpSIAbD/19G96E3NpZOwrL4NMBu9TIKZ5/5MIddYGaKrqCa6b7ch3XX63AWckTUE8/91c4UH2v8sF4FoKMqG28cEJX5vJtVWpPOc5RPruPbflZHs7ItDojOUF5CdqLFYpgv41enSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqpljdz6saHIf+tpwTNemV+yAFJTsjM3Taos7/Y/GJE=;
 b=knXKwjwkfvtXBgPhiRWmIgPRBG2Vymeq2i9EtoexBv6xMfMUEoP0DapURphV8wVl8lRwdN2O4kDbe1CqTJGv2RJW6RJPo1i7SvgJBTG1DdfSO9B3irnNTL8z2iTUBeNlbAWpz9AAUvjWdKZzC7BWoU5NeLXOfgOXpQwBzyeAPBCph63TxEzuCylLz88U7bshnq37Ewdy6WCWYTlv1KvO0LjQVwqrngW9ExUVv9gHvJRGNjLEXYNqjNVSbyRx4j6QaWaYKyUd2X88X7RXkE2fSepjkRYUS1kIFVOmDSFwIJ4MIoZR0OT4Q5y0fBI/feLcpMuvPqTvdz52bT60oI6qaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS7PR11MB7858.namprd11.prod.outlook.com (2603:10b6:8:da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 01:34:32 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 01:34:32 +0000
Date: Thu, 4 Dec 2025 17:34:29 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 03/19] tests/intel/xe_exec_multi_queue: Add
 xe_exec_multi_queue test
Message-ID: <aTI2pRSBKrMVos1a@nvishwa1-desk>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-24-niranjana.vishwanathapura@intel.com>
 <3fb9954db5df109619718dba6c3482ed3a39d788.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fb9954db5df109619718dba6c3482ed3a39d788.camel@intel.com>
X-ClientProxiedBy: BYAPR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:a03:117::30) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS7PR11MB7858:EE_
X-MS-Office365-Filtering-Correlation-Id: f3eea411-0131-443d-d2f6-08de339e7096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZcyiCL2d85ZVCgVXP+gN7B+qM4J9YOax4PjjroM8K1LbW+VrSkSTFXbRFI?=
 =?iso-8859-1?Q?mYEOKt/FBYlJ5BJfuDBHnCtxQvJ4NO6PvhuRTqQoMO09YV95bfsB3pYgDu?=
 =?iso-8859-1?Q?CnP5DrgpE2o0kGxDLHZ8E/RlNne0bT+j3sEfeHfQqoe/3y0Q5tvcIW39vg?=
 =?iso-8859-1?Q?/dIPfvSFc7gW6FvdyhVApPLi28hXtJW0XhbRFZ6xx9UaE4G/wsWdLZnf+I?=
 =?iso-8859-1?Q?MDMJS0DmNhHfYPMEJbGMoazem/SmpGaqQ6DQHn060BdtYu5qV7ohV8uBDJ?=
 =?iso-8859-1?Q?Jg6iN3WAABhT0wiNEAtkdl4m+pZKn7Q2cURPMqDCQwQ1RIlRMvdmiMlU6M?=
 =?iso-8859-1?Q?mEAy9aUu7Z7/DquT6bYBtVEHkQYDJ4nZYAmAIO5V2TYI8UV9KTdyIFTc+/?=
 =?iso-8859-1?Q?qWz/8Fr5kvB6I4KIZx8FeXo4NuKjI05ocgJngIJ0ci1rAyePE3q06WCj8I?=
 =?iso-8859-1?Q?NBw+dR7tk2/tKbidtGEB52xCFNwxlGG+pJ3hdgpHxFmYSlynUwdPS2J5uN?=
 =?iso-8859-1?Q?aI6dODoez8vLb8RB2hs1W+FZa+l1U19JHL2CsrGpUBYm3Ti/3fikQ3QMMf?=
 =?iso-8859-1?Q?AyUF0pY9ETpW8DOBq3pAqmnCRR0cilbm3tsfNhLw4VsoItf3UTPEE4n0Jf?=
 =?iso-8859-1?Q?0qJotHAyH15KYLHKiBoUz3v6+lJgCD8V4u50l21tBOI4GFYanSOfsuh9uf?=
 =?iso-8859-1?Q?z3WJvqsl84Cl5oqxZI/IZBNL9DDlOUaT8lsIJLSJNF8ilLxpnff2n+25cx?=
 =?iso-8859-1?Q?3OiX1mTYv0j9abpp6suAVD3D4i8I2T+Wm+z5qQz9Pb2vP6g1IqekVZ5e3K?=
 =?iso-8859-1?Q?hc5rw2gx35N84WbzYa7KQd1o2FopDOElARXkbx4OxNVzQzyD7EBM5wq5XY?=
 =?iso-8859-1?Q?QlNu5YjZwwghQne5d/eBjeT+OY6H3f9Kpl/6zPvQkOZrhSIrwHTUgvQDEt?=
 =?iso-8859-1?Q?LQdKfFM2NcWKDYFhh32FkaxCCDfX1W3z0WJ/SlFOP+oRDAZYyfuN2KJqtY?=
 =?iso-8859-1?Q?wImX7vS98/3LrR2jp29za3ZR6k3i7anfmRaesOasZkgN2ZVPbDp0cBNMCJ?=
 =?iso-8859-1?Q?ZXPs8hDSQ/pz4psz2MZCEYCWjVD9CZ1wBH1cKlwcZZDEUkfwuM8wnQ7ozX?=
 =?iso-8859-1?Q?tHBVZc3j+Bt+haiukJVq7S91APgNL8Ntu6RzUZFyJcbwIRr/8Ie08tkD0H?=
 =?iso-8859-1?Q?4bNqJWNTg56nVSEZRuCcvg9owkK92FLJCbBhDM1GhTavRgtNVI3UmqxVyK?=
 =?iso-8859-1?Q?tYHel0YpYJursDjN7zCSmV32EBKaVs5jIxi9rpkRerNF7bNHyO4M7a7eMG?=
 =?iso-8859-1?Q?/8UuBVtx+rRi2ykMwU5V7o5K4NdMPdv14cYve4eVSpR2mflYZ8tBEB+3K/?=
 =?iso-8859-1?Q?uYH72u9PWJ2n8/btueUozME6wHntK5O0kCSweynUEuPYMS4qkuDJUK/y/z?=
 =?iso-8859-1?Q?qHWrC03qrzgPu+RR22DWRUyl/uMhD0HbS1q8de/XVzNoqDXNIl3sGNViCb?=
 =?iso-8859-1?Q?JtIGqmR8ukSA+pe4wUcMJ1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mJc068uS9l7L9QynfS7uRa+p+5oVYPnmhz3qrbqTNr8TFts0I0rHtC+0jT?=
 =?iso-8859-1?Q?lr9+FALTFfFqNMEq5U5qi8qAe+l0tI2KV1JzRivwj3FdjiOX8Q9K3254d7?=
 =?iso-8859-1?Q?26SPBVHyUooRipZ0ZBpPlJb/5Mgz5sUgDQEUPQAXl2q/NogH9MFmsPvkfD?=
 =?iso-8859-1?Q?bvZ0C+bWtaOVLKCz3xLsJkyZPaamIBGqM3Yv3mkjMJQUOvuBBBUdJmDV9S?=
 =?iso-8859-1?Q?eSOpdqiVlgEm4DE3Mn87DQVqB3HptaN4auJJKNuMh1qs6Man/uVoPxZGIy?=
 =?iso-8859-1?Q?/JD9cS/xZrecFlXjnh44pUg3xjZzNf9cpPN/qiiF7QtND1Lhklu6Eu/8zo?=
 =?iso-8859-1?Q?8RXWkfsB4M5DbPkFguh3Az+sf3ExR9NGON/h7qMVGk3lVgAzrPjDJryTF9?=
 =?iso-8859-1?Q?j307sM679yXaQxCOJjbGpWV2NSq6v7Ku4vSJkZOJfcxZNKfjuwplMQiXUv?=
 =?iso-8859-1?Q?1mxlAVAY8BnM4K+X3HAbJbauk4ZbHbXD3ntPB0F0whLBvHgZUwhFpGT0T5?=
 =?iso-8859-1?Q?Crvt3LTPibla2E3pxVzQlrrhYxAJxZHYxRS4g6GnhDy1UYLFCgRjAVIPM2?=
 =?iso-8859-1?Q?U12ZfDgsdeK33Ebv0nf4xmTVXirnfi/vrukhGoGCuO44YygPE9aze0UG4Z?=
 =?iso-8859-1?Q?1+e/RYKMsKLDHD+n4fApxJVlWoQvTORb4iSmv+tZOSrHvCtiubXLfTz+uI?=
 =?iso-8859-1?Q?xjOqtG6bTsbADq3LHBCzk/F1LilIkevivNWA/XMudcSkgdq0+CYINHyRS4?=
 =?iso-8859-1?Q?bXZfhDuGCmJQNhZ/QrnFuHnng9WUWZrsjPXtPXlsLSrY2GJp+lgrqrJBz4?=
 =?iso-8859-1?Q?6XIVf6pcqdYHj4Q2/WX0jQ2U+Wil3CHbkmdJ7RPwV+/6D/g9XYE/9ZKJ1E?=
 =?iso-8859-1?Q?Vrt/rmva3kVIH+DJ502D/C8DMOYofWTUF/sh/ebSC4nwTqUKa0q0fKDfuB?=
 =?iso-8859-1?Q?ZRSivFcDFK8PwluKpwShw75VLcavcKGBjdkXrHIEPQIphE3qXEl/qxXppt?=
 =?iso-8859-1?Q?D0uMlYJSH8edIn/+eIa7DTJ9OmCt4+GyYKI6vv7fqXYFKJwGkRYyYI8GE8?=
 =?iso-8859-1?Q?Jjo6zS83vPqPhH6oD37MfxubOtXUrOwDV53TNQB4wK3gduyFLNGyS2JtrI?=
 =?iso-8859-1?Q?SZVkSmwCAxaGAenN7QcscT+0YrVaVG/y4FX+CbBlqaUue9OROHHvS/nwV2?=
 =?iso-8859-1?Q?eO02rh2dzck0kH9XU9yIRRiWEvacTf41fZwMnZzKBd/BRm/jfT6MQmQgDg?=
 =?iso-8859-1?Q?vXXFdGAHS0FKSxTYIS4KVxs7BT2KPO/w2y2TcIShwW2n0YcOI4R/TJSh/G?=
 =?iso-8859-1?Q?uZ8ZShAee6FlFf7ePskkQM/wf0/5jGDjJsuwRIRdR+ge2miT/jM3uoG8uM?=
 =?iso-8859-1?Q?0ZGs4FkqpytXit2X52tYZdPQ550EKIvxt5PF8wK6vBLajmhqU0Mr1ODhml?=
 =?iso-8859-1?Q?DkOs5+BAx1yXBwB+RsXOqBL+exJ1psgVY97CNW8c6GyERNFaQNsPIGxVHC?=
 =?iso-8859-1?Q?MpoqSrT+2M1PQGp5qIZHq4QHdaC0pqrkK8+l0sD47nSI9HwHxGafSSfgMy?=
 =?iso-8859-1?Q?d2VyYC8apyLh3XjJwuOadVF8FYkh9adIGEkvQwltMtbfV5lgOhF6bhOezj?=
 =?iso-8859-1?Q?YbMeF8bEJHaT7EZiuxZeTN3/QlEwAvEYqlx2bVPqSkclp8gSfAVd69kJ7X?=
 =?iso-8859-1?Q?UnM4jmbEYLL+tZdSFTQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3eea411-0131-443d-d2f6-08de339e7096
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 01:34:32.2776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQLNYczyaiPBn+LbheBoSorFak6jucM5duHBoiHf7PEeLccxoqMOL+4ZKdAtlfZVJ/uNB1aULIRgROeUHjGxWuslFvRuZr5WjGl/LQDGKiAhiM3H7xd8fXum6bUoiptO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7858
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

On Thu, Dec 04, 2025 at 12:02:32PM -0800, Summers, Stuart wrote:
>On Thu, 2025-11-20 at 19:57 -0800, Niranjana Vishwanathapura wrote:
>> Add sanity test for the multi queue feature.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> ---
>>  tests/intel/xe_exec_multi_queue.c | 163
>> ++++++++++++++++++++++++++++++
>>  tests/meson.build                 |   1 +
>>  2 files changed, 164 insertions(+)
>>  create mode 100644 tests/intel/xe_exec_multi_queue.c
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> new file mode 100644
>> index 000000000..03b920dc8
>> --- /dev/null
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -0,0 +1,163 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Basic tests for exec functionality with multi-queue feature
>> + * Category: Hardware building block
>> + * Mega feature: General Core features
>> + * Sub-category: CMD submission
>> + * Functionality: multi-queue
>> + */
>> +
>> +#include "igt.h"
>> +#include "xe_drm.h"
>> +
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +
>> +#define MAX_N_EXEC_QUEUES      64
>> +
>> +#define MAX_INSTANCE 9
>> +
>> +#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
>> +
>> +static void
>> +__test_sanity(int fd, int gt, int class)
>> +{
>> +       uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>> +       struct drm_xe_ext_set_property multi_queue = {
>> +               .base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> +               .property =
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>> +               .value = DRM_XE_MULTI_GROUP_CREATE,
>> +       };
>> +       uint64_t invalid_flag = 0, ext =
>> to_user_pointer(&multi_queue);
>> +       struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>> +       struct drm_xe_engine_class_instance *hwe;
>> +       uint32_t vm, vm2, val;
>> +       int i, n = 0;
>> +
>> +       xe_for_each_engine(fd, hwe) {
>> +               if (hwe->engine_class != class || hwe->gt_id != gt)
>> +                       continue;
>> +
>> +               eci[n++] = *hwe;
>> +       }
>> +
>> +       if (!n)
>> +               return;
>> +
>> +       vm = xe_vm_create(fd, 0, 0);
>> +
>> +       /* Invalid flags */
>> +       while (!invalid_flag)
>> +               invalid_flag = (1ull << (rand() % 63)) &
>> ~XE_MULTI_GROUP_VALID_FLAGS;
>> +       multi_queue.value |= invalid_flag;
>> +       igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext,
>> &val), -EINVAL);
>> +       multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
>> +
>> +       /* Q0 can't be a regular queue */
>> +       exec_queues[0] = xe_exec_queue_create(fd, vm, eci, 0);
>> +       multi_queue.value = exec_queues[0];
>> +       igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext,
>> &val), -EINVAL);
>> +       xe_exec_queue_destroy(fd, exec_queues[0]);
>> +
>> +       /* Multi-Queue can't be a parallel queue */
>> +       multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
>> +       if (n > 1)
>> +               igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1,
>> eci, ext, &val), -EINVAL);
>> +
>> +       /* Specifying multiple MULTI_GROUP property is invalid */
>> +       multi_queue.base.next_extension =
>> to_user_pointer(&multi_queue);
>> +       igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext,
>> &val), -EINVAL);
>> +
>> +       /* Adding queues to group after primary is destroyed is
>> invalid */
>> +       multi_queue.base.next_extension = 0;
>> +       exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>> +       xe_exec_queue_destroy(fd, exec_queues[0]);
>> +       multi_queue.value = exec_queues[0];
>> +       igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext,
>> &val), -ENOENT);
>> +
>> +       multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
>> +       exec_queues[0] = xe_exec_queue_create(fd, vm, eci, ext);
>> +
>> +       /* Upper 32 bits must be 0 while adding secondary queues */
>> +       multi_queue.value = exec_queues[0] | (1ull << (32 + (rand() %
>> 32)));
>> +       igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext,
>> &val), -EINVAL);
>> +
>> +       /* Invalid Q0 */
>> +       multi_queue.value = exec_queues[0] + 1;
>> +       igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext,
>> &val), -ENOENT);
>> +
>> +       /* Queues in a queue group must share the same address space
>> (vm) */
>> +       multi_queue.value = exec_queues[0];
>> +       vm2 = xe_vm_create(fd, 0, 0);
>> +       igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext,
>> &val), -EINVAL);
>> +       xe_vm_destroy(fd, vm2);
>> +
>> +       /* Secondary queues must map to same engine instances as
>> primary queue */
>> +       if (n > 1)
>> +               igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, n,
>> eci, ext, &val), -EINVAL);
>> +
>> +       for (i = 1; i < MAX_N_EXEC_QUEUES; i++)
>> +               exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
>> ext);
>> +
>> +       /* Queue group limit check */
>> +       igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext,
>> &val), -EINVAL);
>> +
>> +       /* Secondary queues can't be replaced once successfully
>> created */
>> +       xe_exec_queue_destroy(fd, exec_queues[1]);
>> +       igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext,
>> &val), -EINVAL);
>> +
>> +       /* Primary queue can be destroyed before all secondary queues
>> are destroyed */
>> +       xe_exec_queue_destroy(fd, exec_queues[0]);
>> +
>> +       for (i = 2; i < MAX_N_EXEC_QUEUES; i++)
>> +               xe_exec_queue_destroy(fd, exec_queues[i]);
>> +
>> +       /* Validate with multiple num_placements */
>> +       if (n > 1) {
>> +               multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
>> +               multi_queue.base.next_extension = 0;
>> +               igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, n,
>> eci, ext, &exec_queues[0]), 0);
>
>This is the logical mask we're passing to GuC right? The expectation
>here is that GuC will see that these are part of the same multi queue
>group and make sure they go to the same instance right? If so, it would
>be nice to have a comment somewhere, either here or in the driver
>indicating this.
>

It is not multi-queue specific. Yah, it is for guc to choose an engine
instance (from the placements specified) for a context (regular or a
multi-queue context). Just adding this sanity here to ensure multi-queue
doesn't break if num_placements are used.

>Is there any requirement (or should there be) that the num_placements
>be the same between the primary and secondary queue? If not, we can go
>with what you have here. If so though, maybe we want to add a case
>where the "n" we pass below is different from the one we pass for the
>primary queue above.

That test is already added few lines above. Look for,

         /* Secondary queues must map to same engine instances as primary queue */
         if (n > 1)
                 igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, n, eci, ext, &val), -EINVAL);

Niranjana

>
>Thanks,
>Stuart
>
>> +
>> +               multi_queue.value = exec_queues[0];
>> +               for (i = 1; i < MAX_N_EXEC_QUEUES; i++)
>> +                       igt_assert_eq(__xe_exec_queue_create(fd, vm,
>> 1, n, eci, ext, &exec_queues[i]), 0);
>> +
>> +               for (i = 0; i < MAX_N_EXEC_QUEUES; i++)
>> +                       xe_exec_queue_destroy(fd, exec_queues[i]);
>> +       }
>> +
>> +       xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: sanity
>> + * Description: Run sanity test
>> + * Test category: functionality test
>> + */
>> +static void
>> +test_sanity(int fd, int gt, int class)
>> +{
>> +       __test_sanity(fd, gt, class);
>> +}
>> +
>> +igt_main
>> +{
>> +       int fd, gt, class;
>> +
>> +       igt_fixture {
>> +               fd = drm_open_driver(DRIVER_XE);
>> +               igt_require(intel_graphics_ver(intel_get_drm_devid(fd
>> )) >= IP_VER(35, 0));
>> +       }
>> +
>> +       igt_subtest_f("sanity")
>> +               xe_for_each_gt(fd, gt)
>> +                       xe_for_each_multi_queue_engine_class(class)
>> +                               test_sanity(fd, gt, class);
>> +
>> +       igt_fixture
>> +               drm_close_driver(fd);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index ecc0f4c7f..58d223937 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -297,6 +297,7 @@ intel_xe_progs = [
>>         'xe_exec_compute_mode',
>>         'xe_exec_fault_mode',
>>         'xe_exec_mix_modes',
>> +       'xe_exec_multi_queue',
>>         'xe_exec_queue_property',
>>         'xe_exec_reset',
>>         'xe_exec_sip',
>
