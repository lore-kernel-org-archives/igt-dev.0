Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6832CFA466
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 02:13:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4DF10E0D1;
	Fri, 21 Nov 2025 02:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmOF11pB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E586910E0D1
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 02:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763691179; x=1795227179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2iNj9UFKDJZj55JryZG83okK2dfU+abWTnL30k8H4as=;
 b=OmOF11pBI2oMmVmvKzsEoDsTdF1LqAoHg85gJPiRRJgfvuFmBiO3OB8g
 g3+RyrOloIGSoEfFI7bvJyYBaI5hOO5zm1CSoTCn+evv+qUHh2liwaRd5
 0blTPN3SJRVC8cDT8GWRRTOHzu9b5PvmbdvHynPliid0hlMuHPOX0f5uX
 tzyhJA7eYgPkBbDfm7SwfYY4mdMye4VTBw3frfcbzZbPlrvSo/Us5J4Aj
 m6PG8I8/F+5QcmCWFrq9LDGJK3WWAyB8U1jtw0mUHPtu9JJDGxGXHBIdy
 K34Wr9KURkU1gsvEQDoGrs+ccGhfztWau4FL555p2NEKh3HuxDUTpiNui g==;
X-CSE-ConnectionGUID: ZnHB7hKOTlOLpXyJ24LUUA==
X-CSE-MsgGUID: AtLU9FlcQEqSGD7ckdohgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65477882"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65477882"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 18:12:58 -0800
X-CSE-ConnectionGUID: PQ3G0QCbR/6ipeJHyH5LYQ==
X-CSE-MsgGUID: B1JELHBGQCiLemlNJW/OHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191239430"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 18:12:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 18:12:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 18:12:58 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 18:12:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBJZ1gn/qmsKFXDho8TDjyFOfhIVus6rAtuMdnUgp1yArTNT34bPHFES6LVQmLSY5zg/0tm/YjUNB9YejCGRLWT1KIKefMv1ZqnIvGq1/Em+Ycgra8J0nj1zuSOVf3+ADmN076JK6y2bVcvRYTACcNPvecf+T5hxagwsZRVK3i1OsBCXN0dtY71iP+3WaS/m6di5ktGDIZIqRxgVFNrAZO0dva0hD6FA2EkjWWCqkFPrmdjUWUCMFH3l9i9DBsv5bMNDvUpKJ4vQmew6HkvcRFxbB3TyhY9Z6PyghQfTb8XcAeUruXgUFHAn+zBDy1bZBurCWuLld4E+9F6RKHI25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGhmNXDKclCYPp9MYrlTXneQV1No0+1rvYEN7cSnFUE=;
 b=jByUEXvbocrMVNVUAASltT+Pv5GX0G9SreY3mTZwbNDEC5Q7waFPhgFoNRI7ctWhuJmO326gSsL1r9/1RsxEIb7TCQIKQd5zEci2mwynYAkFrrglk/+jbIWJ351q0WR00RhURU/i5sYZ1WIGCaMOpUenNA9kRZuZcEv0PvBXWU12AXRpuHq8OzXY0pgE/PI+jUJXARL0QRcZusvVEGr6mY8ZvJ/VUpddTXwak4dI5nbNH+a7n4SCTQN4nhIJGmO4gAzpW41xzTjzJqKsnxunzzDviaSeuEva7MDXqBucRo3u20d/vkaPPsAkTwJKBplNQyL52SuINzMK4CCLdpfL4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DM6PR11MB4737.namprd11.prod.outlook.com (2603:10b6:5:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 02:12:56 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 02:12:55 +0000
Date: Thu, 20 Nov 2025 18:12:53 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 18/18] tests/xe_exec_multi_queue: Keep group active in
 exec-sanity
Message-ID: <aR_KpcY5AE7KXb4-@nvishwa1-desk>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-19-niranjana.vishwanathapura@intel.com>
 <BL3PR11MB57473AA0BE167BD7ECD0B86AD0CEA@BL3PR11MB5747.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <BL3PR11MB57473AA0BE167BD7ECD0B86AD0CEA@BL3PR11MB5747.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DM6PR11MB4737:EE_
X-MS-Office365-Filtering-Correlation-Id: e696bcb5-8325-4264-d1ec-08de28a37bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B4EnYdZ9g3ln1b2gi8bRD7FNQxMAwRVLOCm3ZK4DLnAnY72yca5khiT4cmcs?=
 =?us-ascii?Q?6Ayos1gWaVxov4NV3kk6I+XSy52/lVjXxb4gwChISemwF5lbeb7cKQ2nJEUV?=
 =?us-ascii?Q?7ORjoGX3ywaO31olMxyREn1c0EETcZaPartV6lDy+G/7ougR7KvF5dQNp26R?=
 =?us-ascii?Q?c+VSaR6NvhkmN3QzPkCklWp2w36NjenrKmpUm6yCUiTwwcRN2mDzUMo/uU4g?=
 =?us-ascii?Q?WR2F8INs3Zs4ipMa7C5eVznFtQvzNvVG/QzcIAimLE1lBJ0QyIs2Sqzsa8uG?=
 =?us-ascii?Q?pEdDpMjo5CzLu+o7jQh5nALnScjGDy+10OWJTXu42QuyXz4j9EOJhzDCVofw?=
 =?us-ascii?Q?3oSyllLA+/l6JSzk7FEf+Vgce7Qe9jukKMs8P1go0A2uJlrBzXrkQXWO95Bj?=
 =?us-ascii?Q?bN+d0B1UDYymwd400ExuNS9fY/dOmp1oZARDIRGIgw4975ZtyKh7mzP4oRjA?=
 =?us-ascii?Q?K05xVU5ceneMT09KBu9AXy42X7Qms5bx9V3r2kz5oFFD9DmwBAihEL+Cnz9a?=
 =?us-ascii?Q?gcHY8dQ+XswQUk9fZ4FwP+geQxddeLHS3l9bmy6VHndhgxGnBuQxe/8aiKc2?=
 =?us-ascii?Q?Gx9Oc8jd+M33XUVGekZTKeZRXGlhPQxvIYkUzfvZCOsDzh2mfOR5K/PvetSk?=
 =?us-ascii?Q?o/tm6/OdmPPgJNzVA1HyvEjusIRi1oRXubZiHmQqPtXw90b9FhoK29J3+NAg?=
 =?us-ascii?Q?S2FwwlDBwcQzrghYeKABWcCYTkd2uPy1tdE8X7fVMpcvJajU84LaM88q6sdN?=
 =?us-ascii?Q?4xEbdtfsq2rUmawMW2YzgerHFc/aYpCEqbntmkddaZgDWZXYieceo+YsVfDh?=
 =?us-ascii?Q?gqRB7OjUCTn/buuMq9gXMQNQ5uS2zhJFQxacISUQMc6rA6O82HcysVukpKGP?=
 =?us-ascii?Q?ux05n3KaBY5MjoLchBed8EUJYGdYFGhb6yPRtzmP2Q/3hsOxr5r2w2iacG8C?=
 =?us-ascii?Q?rXXfj+lMRiTYxX62/XCswMLS1t4oJnCi31yGCyteohc/KLb+w2+xg9oRUhat?=
 =?us-ascii?Q?VlDUrUNUSIJd3vjS9mTGo4JkczkHZ3znCdV3EEswVpLD6coijHES8KGQ84+H?=
 =?us-ascii?Q?qOzcW49gObxGiLE6EwpZIOrcbtxLsNEd+v6fAIzjo0WokxuK/XZZ2LpAJliG?=
 =?us-ascii?Q?liXJ3APRwoVxXVQf1oD6L7urtPFhPgNzfJ6PRyMpSf6rQA1ufO/J7tTT4PwI?=
 =?us-ascii?Q?kb7cZFC/MjumUvHiNxEdHAL4F5kIBy8PmRVb++Cx7TOGe6FNjZIAw3R+kiIV?=
 =?us-ascii?Q?xN/MN+J+2lJb9jbNUn2azDNzvEaLoVwFqLkX0VOxd3oJacfGNF4PsuaXZAgO?=
 =?us-ascii?Q?4vPnZhKnWvAtMw1kRX7qtROmZhuRYYtzss2rDPRGX87B4YjnYn6uQXn57G2C?=
 =?us-ascii?Q?WNecyWZ9cuM+9smlz9+sJWoIxbQa/fNnAGXAVlrnGG+kXI/mPfhkw7T18w17?=
 =?us-ascii?Q?MvixSUS5RP4/TsmRWNgZNiMzQeU8FhxX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YCSyPj0y+o+zbEpXTueBOGlJSODqPjH8GVyaUuTCWoJCSwFnFAQ1SqowyxbQ?=
 =?us-ascii?Q?Brvt1ffi+c9XcRzOxoOjVn37VpgBcOXdXLEE/bN/CLvR9iTzPeemXCzq9Wwv?=
 =?us-ascii?Q?4P95PyUMXOqA/aT2Wi/DKKUyd8ULupnPBvzDmpK181dOWMzlZA+cu+Ej/9Ed?=
 =?us-ascii?Q?KadK62lSTW5vBqZVAa3jUNp4osz+CoT36myXM4hYxyNfxhHEFL0F+ValtyIZ?=
 =?us-ascii?Q?xLy15yQndngBoyTRkrFbmljuSvYKPMY+Np4WJ1R+mZctuuODWFOuClxVqWJG?=
 =?us-ascii?Q?f5509GE2dBxbONOaSOSpi/2aHd2FaTQ6CErL4aiCnsd7B7FyBfLEMSIaeo8L?=
 =?us-ascii?Q?QlvYM0zq+gJx6YbNVXHLGOwAWoxh1r8sqMSxezBqpt9KPDdypQHu6EhTKG8v?=
 =?us-ascii?Q?A7a76lX9s/sZEkUZU8GEOByBDZH8Xj5Bq85DUgfAyZY+4L/dNWJBBAjcdBsc?=
 =?us-ascii?Q?p5q8MDByaVsBlCyrn7B5iLSXUIhBbEM78u8evUI0EWp58Ea728RM/xLJP0j0?=
 =?us-ascii?Q?iBB9NKBfOw8r3qKJaCjsiwn3wSp7Tu9p29arS0Mw3jDY6nmn2s08bw6XvWE7?=
 =?us-ascii?Q?Nc2Viswb2a+GqfAT/a1WGsjYnNWeehBgn8BH90KDFJMe8FYOU1MUnjvzXEnB?=
 =?us-ascii?Q?SOPvhDRcGVlLCoO8rCayXnuVQ2zDsWVLmmeqULrcxeAH5PylOpLFExtHCNT3?=
 =?us-ascii?Q?Fa9VaLFpmPqqS4cjweMd7hsx2TbwiFHeVRvNHFn+rPlY6+k/7N442NzfnvDV?=
 =?us-ascii?Q?3ITHNqCkaS3JZoJ/IZ9rllfPOISsnRmkDUJlktxvPSJtsBLS4Y0UH+3n+50E?=
 =?us-ascii?Q?/ZYGh5/E71+VSplw8uKnTToPJtycZ5J13WO+JDq+owm7AFrHdYADTwJQ7MBG?=
 =?us-ascii?Q?ConbUZbImb1FKcnXxaOAFHZ5hBEoVfj39BDkdpnDSoWVCC/P6AqB96JBPkLK?=
 =?us-ascii?Q?BSEW22UwxJp5VkTXpk71s9Wytv3wIZo7uiJ6vQAZEbE5X69Dy2fF7YC7TGyX?=
 =?us-ascii?Q?pXHttidcMjtJf78fAG/vvrDMN8yNlxa1Rq3ajn8Sd7g+cNysni6P3cyuawho?=
 =?us-ascii?Q?iMElbu4I4BsNlfd79ocYSKjFCPGsLwPQkdgCPg3CtYocw3j51ZYDiLwf+5vk?=
 =?us-ascii?Q?b4tKlbCmwaXa8+QVKFPT1FoPINvO1zHcVMLnONWeaO+8Z7eSu+ToU/m3Ocvg?=
 =?us-ascii?Q?oaPp0spOfa/HNHr8WpwDz7NQNalcfXw3Ev9juX/M4ZAykBpWjmkmcTKSM9mK?=
 =?us-ascii?Q?QxciAD8+NNQJNRggMVqm4K2uC+ByoKbVnS7TTrfNZw5rso1EA3jqGQaq41rc?=
 =?us-ascii?Q?eE+lZ4A4Rs8MCbuRa/dBlHSIi+gMTJPlc8btbcypQx+aPfcef+dp7WbsPzSI?=
 =?us-ascii?Q?QS8Pv2ASfBwniEpATpffyLuOx32S5f2hPTpcJF+p3rssQul8qMFECFNKldiu?=
 =?us-ascii?Q?T//byv04kuWsBMabDdQs7QJqsQWXLBB/EXA2Rxt0h9nYHiD1etO/srJ8DwjA?=
 =?us-ascii?Q?1ROW/zXtLElTRsIYrjz7JX7reVbXIB9fRM5DFPwbjV7t0zjTbRXWPtKJj23S?=
 =?us-ascii?Q?6DFZToZsQqOIWFbC2ZrCr6Ou7KKYRXp0lra2eO4QLJCR/qO+CCEydgUFq5Ye?=
 =?us-ascii?Q?A22Z2kBJ4YmQ1SvB4nNxJWk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e696bcb5-8325-4264-d1ec-08de28a37bf0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 02:12:55.8673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Czn6TtPr7pkycgmjKSNes0Nz4OhW6On1eW2BRWVBfR+LhFd267Z0ICTgaAc6sjbvqoymQlTF/Bapix1iWg3Ua6WT/hqOcou8cnifdRRbOVodenWu/OunvPBSyCV9Q13Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4737
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

On Mon, Nov 10, 2025 at 10:07:54AM -0800, Ch, Sai Gowtham wrote:
>Hi Niranjana,
>
>Please find my comments below,
>
>>-----Original Message-----
>>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Niranjana
>>Vishwanathapura
>>Sent: Saturday, November 1, 2025 12:06 AM
>>To: igt-dev@lists.freedesktop.org
>>Subject: [PATCH 18/18] tests/xe_exec_multi_queue: Keep group active in exec-
>>sanity
>>
>>In exec-sanity subtest, validate that job can be submitted on secondary queue
>>after closing the primary queue if the user specifies the KEEP_ACTIVE flag while
>>creating the group.
>>
>>Signed-off-by: Niranjana Vishwanathapura
>><niranjana.vishwanathapura@intel.com>
>>---
>> tests/intel/xe_exec_multi_queue.c | 26 +++++++++++++++++++++++---
>> 1 file changed, 23 insertions(+), 3 deletions(-)
>>
>>diff --git a/tests/intel/xe_exec_multi_queue.c
>>b/tests/intel/xe_exec_multi_queue.c
>>index ee2b92293..bdd9851bb 100644
>>--- a/tests/intel/xe_exec_multi_queue.c
>>+++ b/tests/intel/xe_exec_multi_queue.c
>>@@ -268,6 +268,7 @@ __test_exec_sanity(int fd, struct
>>drm_xe_engine_class_instance *eci, unsigned in
>> 	};
>> 	uint64_t ext = to_user_pointer(&multi_queue);
>> 	bool preempt_mode = flags & PREEMPT_MODE;
>>+	bool keep_active = flags & KEEP_ACTIVE;
>> 	int i;
>>
>> 	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
>>@@ -279,9 +280,13 @@ __test_exec_sanity(int fd, struct
>>drm_xe_engine_class_instance *eci, unsigned in
>> 		sync.handle = syncobj_create(fd, 0);
>> 	}
>>
>>-	vm = xe_vm_create(fd, preempt_mode ?
>>DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>>+	vm = xe_vm_create(fd, preempt_mode ?
>>DRM_XE_VM_CREATE_FLAG_LR_MODE |
>>+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
>> 	bo_size = xe_bb_size(fd, sizeof(struct xe_spin));
>>
>>+	if (keep_active)
>>+		multi_queue.value |= DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
>>+
>> 	for (i = 0; i < NUM_QUEUES; i++) {
>> 		bo[i] = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>>eci[0].gt_id),
>>
>>DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>@@ -328,14 +333,27 @@ __test_exec_sanity(int fd, struct
>>drm_xe_engine_class_instance *eci, unsigned in
>> 	/* Destroy primary queue */
>> 	xe_exec_queue_destroy(fd, exec_queues[0]);
>>
>>-	/* Validate submission on secondary queues fail after destroying the
>>primary */
>>+	/* Validate submission on secondary queues after destroying the
>>+primary */
>> 	xe_spin_init_opts(spin[1], .addr = addr[1]);
>> 	if (preempt_mode)
>> 		sync.addr = addr[1] + (char *)&spin[1]->exec_sync - (char
>>*)spin[1];
>>
>> 	exec.exec_queue_id = exec_queues[1];
>> 	exec.address = addr[1];
>>-	igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
>>+
>>+	if (keep_active) {
>>+		xe_exec(fd, &exec);
>>+		xe_spin_wait_started(spin[1]);
>>+		xe_spin_end(spin[1]);
>>+		if (preempt_mode) {
>>+			xe_wait_ufence(fd, &spin[1]->exec_sync,
>>USER_FENCE_VALUE, exec_queues[1], fence_timeout);
>>+		} else {
>>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>>INT64_MAX, 0, NULL));
>>+			syncobj_reset(fd, &sync.handle, 1);
>>+		}
>Same as my previous comments, sync handling logic is duplicated in several places
>we can move sync mechanism to a helper function.
>

Replied in patch#16. I don't see much benefit. I think it is simpler this way.

>>+	} else {
>>+		igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
>>+	}
>>
>> 	if (preempt_mode)
>> 		sync.addr = to_user_pointer(&vm_sync); @@ -375,6 +393,8
>>@@ test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci)  {
>> 	__test_exec_sanity(fd, eci, 0);
>> 	__test_exec_sanity(fd, eci, PREEMPT_MODE);
>>+	__test_exec_sanity(fd, eci, KEEP_ACTIVE);
>>+	__test_exec_sanity(fd, eci, PREEMPT_MODE | KEEP_ACTIVE);
>Why not move them to a separate subtests ?
>

Explained in patch#16. Don't want bloat the number of subtests.
This way we will have one or two BAT sanity tests.

Niranjana

>Rest of the code looks good to me.
>
>--
>Sai Gowtham Ch
>> }
>>
>> static void
>>--
>>2.43.0
>
