Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434C6EB5969
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 06:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9778E10E0A5;
	Wed, 11 Feb 2026 06:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yx9fQvUu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B150A10E0A5
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 06:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770791978; x=1802327978;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZsWGun+fp5/dXbWoHP01S6DtR9UNC3R6WqdEa2QnVkw=;
 b=Yx9fQvUukYZS/x2/NAVzKjgVly13kq31p52PUPbYrpYKHGClcio4QR2E
 PgCGP+5peU9xodjJTdUCgZ3tyNo4ySNW8/60dxM6wJ6Kh+qlvFQeFyl4f
 SOpOsOq6z8+r1XsdO3PiBfTqKClc9dTY984EbxhpGS/gsBnMFXgElAziC
 tRitVWVP4tsADYyjdhD2NvsaRqXnQ7Yy54qHsvAGaTv6k7U6pjYtl5O9N
 o8fYK3s3iHTrzZ4Ivu3LMPrAZ+ewUB1tTfd9epeNGFIfRS0MI17w+rRIS
 mII7NBHa7/VK6CSCPVRaGolRSRoH3ioN2iyc3ZIxnZN1UF9aRhLfDV2cC g==;
X-CSE-ConnectionGUID: qidczuXGROe4I9QjLP/heg==
X-CSE-MsgGUID: eFqUJF2zRACthN2IkbxFIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71974811"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71974811"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 22:39:38 -0800
X-CSE-ConnectionGUID: nGZU/Rx2T8avHpnda9jRlA==
X-CSE-MsgGUID: 1WYEdk44Rh2Mn4WI9oVhvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212245530"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 22:39:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 22:39:37 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 22:39:37 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 22:39:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJm6ecVkiPHrUDmhiPtYgGBpuU3eCRaxGSB4/aZ8otfY9QeyfBqhQ1T3wMat12210Sh5hJEIi2of601aZpllDvO771inXii2s8O9C74HmkuR9A/nNZdbv5gbfNUS4kpB+HKtonPtdM+wUPBa6sHb+KG+41b9jdHzrZ+zMYT/wEo70QWEkJpBTUw4jIzO8PFh4vmLxKIVebsQJTv4JU044hdIPPMYTNK/1VF9KPSCi61IWgXDoez7O0q5aKFKpzWTx9pCfugKoAs4RHZCqFv/+wpRtGMJDflE1V8RDV9JBP4eEvWi75A4Vx8ETevfr2kgg2T6MTQe/MLojkHb2JraLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5Yscm2RfLCKf2NubUxVKP0cbScrlhGZ7Cbdef/unt8=;
 b=TIz83Se4mxiD8Q4kFabCAcsV/ZLs1GKnmehemHhryUjxCF8UP3uuTscm61jMrTbTVBmdi4tegbbPblcbhF4NFtDZv1Be66sbKBUATbcNLlLcG+Def/tqWv079etIx07fD4cELMBBL7RzDRtBmEeYvmBKpk7myTuJ6KOzXCgJNj8hSzbn23WzM9ID9gJcfCdGH80zQqeJyJD6hdgx3gCVwpdx9LTgMHb+gj0V4UGKRevnMjvTW5slIJtiMDVRcw0nTUpH5pHdbOBAas0E8H74ELaXdsZJbikzJQB7yYRCBnTb21Z05q5be4CXUl57xQoN4/cOIbmoOOpRvtH6UmI0rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB8668.namprd11.prod.outlook.com (2603:10b6:8:1b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 06:39:35 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 06:39:35 +0000
Message-ID: <3f0acb60-218d-4935-ba2f-0314ba481cf3@intel.com>
Date: Wed, 11 Feb 2026 07:39:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 2/7] lib/igt_pci: Add generic PCI driver override
 and bind/unbind helpers
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
 <20260204163217.121305-3-marcin.bernatowicz@linux.intel.com>
 <2ebfcc0d-49ca-4fde-a48f-27a014b5f729@intel.com>
 <1c068311-2769-4f90-9c7c-9733a45d9029@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <1c068311-2769-4f90-9c7c-9733a45d9029@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::29) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB8668:EE_
X-MS-Office365-Filtering-Correlation-Id: a44bbe8f-3a2f-425a-d0e7-08de693851ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajJSL3EwQitqaCtaYkNiWW84TGJzeCtZSWpRRDNGL2hsUzl5bndOYkVJYnVt?=
 =?utf-8?B?UEtVK2ZFbDRSMjZxVWVVNXh2L1RFSjJnZFZHYTN6anVmdnNoQ1d0WmJMSjEv?=
 =?utf-8?B?WEN3REJ4dU9tL1ZmS1lvQXpYMnNCTHlVZ1ZJV1BNZ1AweEJQU1cyNjVseXU3?=
 =?utf-8?B?dHUxd010cnVzTzltMURaVmh0Mmtpcmdid3A5Mng4ODdJREVzbUNCOGt1Z0tB?=
 =?utf-8?B?eHlZMUVYN3hkaUwwTDQzR0hEUkFhcmk5aVdyLzJOWXVtM2dDcUNTV2pSZTBE?=
 =?utf-8?B?RWQyVXZvR2x1UTZUblU3WkQ1RUJoMVdZQ3g3WGJzOS9wbk5LbWJVaDE0WmJU?=
 =?utf-8?B?bHpwMGpSMDF0MkkzdG9jZ2o4TDIxemdHdzhUbS83WlhUMi93YkVmcFo3dVlF?=
 =?utf-8?B?WnI5NGJUdnc2Qkh2SnNOVmx3S1N0Vm8xNTBEMC8zZ3BicVdlc2kycU1xQloz?=
 =?utf-8?B?N040bW1mSG5rS0pkSFFvd0VxVDVLZERBMWE1KzZ2WXArQnowS2pIclczWUEw?=
 =?utf-8?B?RzdjcVl2ZjJqOC8va1VzWlp1NCtZVC9DcWg0dk9rUnR5c29WaXY3RU5lV01a?=
 =?utf-8?B?OGNRTmpmTnhxSjdvajgwR3JlUTFpaEVOK0QyNnRGcW10enZCekg1cmdNaUZF?=
 =?utf-8?B?T080WmIvRVJ2SkpoYWZZR3JMWnhpalVzaWZKUUkybm5rZUtlNEliZTNJb29V?=
 =?utf-8?B?SGlFMHZlTW1wZXhvNlNPd3d4YnVMYnRxOXZEMFM2ZXZkdko5akxadEEzY2VE?=
 =?utf-8?B?YmV6TmNpR2IxRnFJME5BaDRlWlNIL2lPL3dwMmRxZkp3b25PN2h4cVM3bElC?=
 =?utf-8?B?SU03Mld1ZDFXbXRwNUFKUVMxalpkVzhQdkMxa0NzSUw3VXpwWkhMeHBhYmFL?=
 =?utf-8?B?QldIRGFXUlNnNjVxZk1EdU1XVm1tRWpBRXBPbkVyNXZnc2V0c09BaEs2R2FO?=
 =?utf-8?B?Tnc2eUFDaXRJZG8ycGM0V0Y4YmJ1VXJuV1ZuQVZ6bDZuNms1SjBGL2FlOWJo?=
 =?utf-8?B?c1F4YUtER3VLd0hXZkdQU00xRjk2Wkh2QTFDZlpMcDZ4NFdIVVFCUWhGQkc3?=
 =?utf-8?B?elBoQW9SVEs2ZS9oRXRHWlZLUUYxbkFOeUNmRXZaSXQ5bTc0aGY3ZkZCanl3?=
 =?utf-8?B?TWVqb2dleUZpYkx0NmhoTzZmdnRtYnRTYm1aN3JoMk50WVZwcWVhUzZDMFdC?=
 =?utf-8?B?ekpuU0tFOEJyeFVwRTJRQTJoOGU2Y3hIc04vbjZNLzVmckkreHNJTzdKQjVk?=
 =?utf-8?B?TFI2YUFOTERYdllIVUNDNWFJOUdKTTFwT0xlRmNkSTNxU055WU90RzdYVVYx?=
 =?utf-8?B?UmNlQ011VWYyMll6eFJkMXFiNE5rU05rQ21NSXN6L2dHOVE3ZzZBMU9ETmxs?=
 =?utf-8?B?ZFBpRkUzbW9NT0ZWSmVOMjREdWFqN1N0N3VtMk84SE1tQ1BwWVlVWVpUOXFN?=
 =?utf-8?B?bnFyUFBndUh2Q2M0ZWxMdnVqK0RrMkZrejF4cVdIWUlCOXpKZUdzRFh2cDFV?=
 =?utf-8?B?Q3N4ZGNHaEpndXVSYThTTTRwbTgyM3dDa2R4Ly9TR3NDdERtUFNHRHpabHBN?=
 =?utf-8?B?Y1RWNEZSZXpyWlBXdkxONUxyNlJuWHRsZ3FuYTUxMW1qei9JNEczRHBiVUxS?=
 =?utf-8?B?R1RQekxORUdaMlQyTmZsempGM1oraUEzM200RERna21PUE54K1Mwek10aHB3?=
 =?utf-8?B?bFV6R3ArOVplYStPQUthOFUwdWpENVpUZ3VwMXZ6YzV4bk1aTzgzeFRFNUw5?=
 =?utf-8?B?T2tCUWVncFFnSWZaWnkwRERjUzNXcXd1OWxLckwwQkU5aXBIZlRMRkgrS2dE?=
 =?utf-8?B?RHd4Z2FqVWtURmtRdTlnUTFKUndKeXkvaEE3RzNNVzl3MGV3MFh4TGhWM3VB?=
 =?utf-8?B?a21uTW5ySDlKOFcrclRQUFovN2kydkIwd1dRam9ha0JNQzlBa3hHeUIrU1F3?=
 =?utf-8?B?cTdta0c0dGJ1RTd5MElDQTBsVHE5SHVRcHh5c2FRMWhGMFRQRE0rbE4rK2ts?=
 =?utf-8?B?WStOb05jOWIxY0w1eXVGUzVjRE5SVUdOL2lsaTFvRm5EeWk1aWhGV3MwRUt3?=
 =?utf-8?B?RFdaUGNLZjcvRjZvMzFNUEVhVG1YY29zOTFIVTRaNnNUSmNvTlF1U1JVOHhq?=
 =?utf-8?Q?CHcs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlBQVW5SaDk5WHd5eUNZZ0JMcnR4UGI5dy9KTmd3b01OMHE2RGpqeGo0YzdN?=
 =?utf-8?B?ejcwaGk4bVd3SVFoWFJTOG4yb3Z5TldEVTAxeTFWSkl3WWU2c3Y1K1FkK212?=
 =?utf-8?B?Sm9rejdhSGtRTHY1cEQwL3BvSStxbE9oaEg0QWp4R1NoWU10eGUzMjQ5azk0?=
 =?utf-8?B?UGU3bUN2RGRBZjJKdHRrVXUvV2o0YmQvMElEc2N5Z0kybFU4ODg4WW5WZXBl?=
 =?utf-8?B?ZkpVRXV1cWU0cEV2VDhUYnU1VnZweTNvR3pDY21sck1Nak1EUWNNdHJobVU1?=
 =?utf-8?B?bU9nRTFpWXhiVWdlOUN3dWRzRzRnWm1vcGRnd1pnQW5LTUIxZTFGR2szVGsy?=
 =?utf-8?B?QWJnbjdtK1Jqc0ZSaFcwMUdTUUhmR1FFeEtORnI0S2taaVp3SHlNZ28rblpR?=
 =?utf-8?B?SERGV05EQzh6TVduUTJSOXZNZEZOdWFkNXc4d3RVbEk0SEdRUFQ3T0J6UXZY?=
 =?utf-8?B?QzVnUTVnV2FXUWdYR0dSNXR0eUh0Qk05TDNDMHpZeXl3ellKeUJod0Nsbkti?=
 =?utf-8?B?UUMxQkdsNUh6MWU4ZG0zVFhwaTNEdXhLZE40SjZJU0ZPLzNFNzNGYkhrSzVO?=
 =?utf-8?B?cnhqV2YwcEFvUHBOd1ZISGhudnlxazRySWhpN3BKVHZyQVhHclBBcWFlSlZv?=
 =?utf-8?B?dUlzZHdRemVPNFpMQ21pZVk1bG9iSWc2RE5TOUtoMm1RRysvU05Nc3E2U2Uw?=
 =?utf-8?B?S1NkVUJ1KzZLRC9KSjhjaVJHSnAyNGhZZFFuNy9MSVU3WVVJdFlhYkhQR1Fk?=
 =?utf-8?B?bHYwNTdQa3ZzemhWZUZ3YzRXRnh2YytMTEkwV1E5TjdKbGJxQ2VWdHgwc3I2?=
 =?utf-8?B?eVpMUjdXZDhWTkxFN1RHci8wVEhGV0dPb2xxMkpLOU1uUGxrWk1zYzZKMGZS?=
 =?utf-8?B?T0ZTTGdtREJ4di82anZ3RGRiZnBKelU1QVplVGQzZ1p3akxhS0QxaTUwOVpQ?=
 =?utf-8?B?VC8xMFEvdWpHUGc0c0d5dEZPQy83QkQ5c3F5K2hyMW5xQ1VYcVdlWk9pdnQw?=
 =?utf-8?B?eWliS25mVE5tNEZCQnFZK2V5R2p3cnZsQk9zbWdhSFFpRCt2c2Z6U2phR2N0?=
 =?utf-8?B?bksycWZPMTMwU0VMNXRUVU9jY0lCVkQ5cXJ2bU15SGZFazRpNmw3Vkx3TVNO?=
 =?utf-8?B?aXlTV1ptb0VTdmRBbDYxNGlyRkZZaUFuanRheW91bm02OHpiODh3Rk5rL3FQ?=
 =?utf-8?B?cjJNTmhEQiszOE8rQUdtcC9vNzUzeW02OEhucVVjTlV5WW41c2s2dGJ5eWww?=
 =?utf-8?B?NHRoYTAveGFYRXlnZjNneDM4dE1sSWY1TmJsa1FuUGlGb3ZUQXpUNTFqQUt4?=
 =?utf-8?B?a3IzMnBaR2JQOTNzMzBrUXU3NkJYNXRoeTRteXFaZlBNUVRkN1dqRUFsbC92?=
 =?utf-8?B?K3pGUjYrM0J1STM2b3BpMGNoTlFYbVpVcGRaek9EVXM1N2xmNmxMUmhiZGli?=
 =?utf-8?B?b1pnR0VDSko2OEptdWdpa3lMbGg4S1MxbHJOVG1ZVE1ZUWRpSlp3ZmdYbEE3?=
 =?utf-8?B?emZkc1llRmJnOXY4ZkxjcVdGTkJ1MXNhNmYrQ3lBUVRWaFFGWHVORmd6ejlY?=
 =?utf-8?B?NXNRUzAxKzVscU85cEJqNHpKMGQ2R0VOS3V0RUttb3dRUU1rai9Da3AzcGJH?=
 =?utf-8?B?Vk1tYjRhRm5LNUFEd2h0NUZ1SGpKRjhRYTZJbFlSZTFmUmVGZU5qOUZyQmdD?=
 =?utf-8?B?ZU5tWkZQNjQzQTlhbWEydFY0ZDhvcEV3d3JaWVE0YXJYVThZYmlUNGVIeXVp?=
 =?utf-8?B?WXEwalJrbndJSGUxa0JpdHJ4R28xSlhaWHFxaE9TSyswWjhXQ3BLU0orT3h6?=
 =?utf-8?B?YjViZEZ1NURCTTJsUFh4WEg0NjBBcWJVSzgrWjU1UkYzb1ZtblVkM0pBSWFj?=
 =?utf-8?B?dzZnMHVtNi9rRWZiZFhvVlV3SVFxa0prUDBvV0Y3dzE1K25hQ3pnY3RLTGx5?=
 =?utf-8?B?SDVNYWIvSjJMdW9HandGT0w4ZGY1VWE1UGgzRGRTaTlZTjlxeXZNNDJsTjBa?=
 =?utf-8?B?SGVlNXF6ZXByeTB6NjdseFdvQ3NvL0RYZVJtOTlOSEVhUlhwNFYxRWsxaUhW?=
 =?utf-8?B?Rk5Ka2hJMVh0ZitlV3czdllzUnEvRWVpc3hyelN6VEJHS3c1RjBabFNQN1dy?=
 =?utf-8?B?N1d0Q1hnSVNocDZXOHcyR2ZSRmowdWNtcmI4ZGF6Zkp1Y2E1MTNudkl4cE5R?=
 =?utf-8?B?UTltd0laOWpNYjJkQVQ2bnJBZ2owMmJ4SDNvZEZObVpPbEZqUmMrSml3OFJa?=
 =?utf-8?B?aVpXaDd6UFBCWUJ2VmlIbkxrWUY0L2xaam1HNTVRSEZpSGRlVFIwUGlpblV0?=
 =?utf-8?B?MW1CMWJhcTJDUW5GMm9ZWGV3MUpkQ21RNGJ5R3ZDb091OVQyMlk2dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a44bbe8f-3a2f-425a-d0e7-08de693851ca
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 06:39:35.2277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9t5mSPQT9rGYP5HEIMBNaHjpKEgAxlTAvgoj03lYVZGfnsIk/UtjLLGbh7MAUhVWocVcPQut3KUfCOlFdmteAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8668
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


On 2/10/2026 11:19, Bernatowicz, Marcin wrote:
>
> On 2/9/2026 11:16 AM, Laguna, Lukasz wrote:
>>
>> On 2/4/2026 17:32, Marcin Bernatowicz wrote:
>>> Add generic helpers for controlling PCI driver binding via sysfs.
>>>
>>> The new APIs provide driver- and device-centric primitives for:
>>>    - setting and clearing driver_override
>>>    - triggering PCI driver reprobe
>>>    - binding and unbinding devices to a specific PCI driver
>>>    - query the currently bound PCI driver
>>>
>>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>>>
>>> ---
>>> v2:
>>> - Add igt_pci_get_bound_driver_name() to query the currently bound PCI
>>>    driver via the /sys/bus/pci/devices/<BDF>/driver symlink.
>>> - Extend igt_pci_bind_driver_override() and 
>>> igt_pci_unbind_driver_override()
>>>    with a timeout_ms parameter so callers can wait for bind/unbind to
>>>    actually complete, instead of relying on drivers_probe write 
>>> success.
>>>
>>> ---
>>>   lib/igt_pci.c | 351 
>>> ++++++++++++++++++++++++++++++++++++++++++++++++++
>>>   lib/igt_pci.h |  13 +-
>>>   2 files changed, 363 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/lib/igt_pci.c b/lib/igt_pci.c
>>> index 61aaf939d..80aaf07c5 100644
>>> --- a/lib/igt_pci.c
>>> +++ b/lib/igt_pci.c
>>> @@ -3,9 +3,18 @@
>>>    * Copyright © 2022 Intel Corporation
>>>    */
>>>   +#include <ctype.h>
>>> +#include <dirent.h>
>>> +#include <errno.h>
>>> +#include <fcntl.h>
>>> +#include <limits.h>
>>> +#include <string.h>
>>> +#include <unistd.h>
>>>   #include <pciaccess.h>
>>> +#include "igt_aux.h"
>>>   #include "igt_core.h"
>>>   #include "igt_pci.h"
>>> +#include "igt_sysfs.h"
>>>     static int find_pci_cap_offset_at(struct pci_device *dev, enum 
>>> pci_cap_id cap_id,
>>>                     int start_offset)
>>> @@ -51,3 +60,345 @@ int find_pci_cap_offset(struct pci_device *dev, 
>>> enum pci_cap_id cap_id)
>>>   {
>>>       return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
>>>   }
>>> +
>>> +static int open_pci_driver_dir(const char *driver)
>>> +{
>>> +    char path[PATH_MAX];
>>> +
>>> +    snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
>>> +    return open(path, O_RDONLY | O_CLOEXEC);
>>> +}
>>> +
>>> +/**
>>> + * igt_pci_device_unbind:
>>> + * @pci_slot: BDF like "0000:01:00.0"
>>> + *
>>> + * Unbind @pci_slot from its currently bound driver, if any.
>>> + * Returns 0 on success, or a negative errno-like value.
>>> + */
>>> +int igt_pci_device_unbind(const char *pci_slot)
>>> +{
>>> +    char path[PATH_MAX];
>>> +    int dirfd;
>>> +    int ret;
>>> +
>>> +    snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/driver", 
>>> pci_slot);
>>> +    dirfd = open(path, O_RDONLY | O_CLOEXEC);
>>> +    if (dirfd < 0)
>>> +        return 0; /* already unbound */
>>> +
>>> +    ret = igt_sysfs_set(dirfd, "unbind", pci_slot) ? 0 : -errno;
>>> +    close(dirfd);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/**
>>> + * igt_pci_driver_bind:
>>> + * @driver: PCI driver name under /sys/bus/pci/drivers/<driver>
>>> + * @pci_slot: device to bind
>>> + *
>>> + * Bind @pci_slot to @driver. Driver must be present/loaded.
>>> + * Returns 0 on success, or a negative errno-like value.
>>> + */
>>> +int igt_pci_driver_bind(const char *driver, const char *pci_slot)
>>> +{
>>> +    int dirfd, ret;
>>> +
>>> +    dirfd = open_pci_driver_dir(driver);
>>> +    if (dirfd < 0)
>>> +        return -errno;
>>> +
>>> +    ret = igt_sysfs_set(dirfd, "bind", pci_slot) ? 0 : -errno;
>>> +    close(dirfd);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/**
>>> + * igt_pci_driver_unbind:
>>> + * @driver: PCI driver name
>>> + * @pci_slot: device to unbind
>>> + *
>>> + * Unbind @pci_slot from @driver.
>>> + * Returns 0 on success, or a negative errno-like value.
>>> + */
>>> +int igt_pci_driver_unbind(const char *driver, const char *pci_slot)
>>> +{
>>> +    int dirfd, ret;
>>> +
>>> +    dirfd = open_pci_driver_dir(driver);
>>> +    if (dirfd < 0)
>>> +        return -errno;
>>> +
>>> +    ret = igt_sysfs_set(dirfd, "unbind", pci_slot) ? 0 : -errno;
>>> +    close(dirfd);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/**
>>> + * igt_pci_driver_unbind_all:
>>> + * @driver: PCI driver name
>>> + *
>>> + * Unbind all devices currently bound to @driver.
>>> + * Returns 0 on success, or a negative errno-like value.
>>> + */
>>> +int igt_pci_driver_unbind_all(const char *driver)
>>> +{
>>> +    char path[PATH_MAX];
>>> +    DIR *dir;
>>> +    struct dirent *de;
>>> +    int driver_fd;
>>> +
>>> +    snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
>>> +    dir = opendir(path);
>>> +    if (!dir)
>>> +        return -errno;
>>> +
>>> +    driver_fd = dirfd(dir);
>>> +
>>> +    while ((de = readdir(dir))) {
>>> +        bool ok;
>>> +
>>> +        /* BDF symlinks are like "0000:01:00.0" and start with 
>>> digit */
>>> +        if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
>>> +            continue;
>>> +
>>> +        ok = igt_sysfs_set(driver_fd, "unbind", de->d_name);
>>> +        if (!ok) {
>>> +            int err = -errno;
>>> +
>>> +            closedir(dir);
>>> +            return err;
>>> +        }
>>> +    }
>>> +
>>> +    closedir(dir);
>>> +    return 0;
>>> +}
>>> +
>>> +/**
>>> + * igt_pci_set_driver_override:
>>> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
>>> + * @driver: PCI driver name to force-bind (e.g. "xe-vfio-pci"), or
>>> + *          NULL / empty string to clear an existing override
>>> + *
>>> + * Set or clear the PCI driver_override for @pci_slot via sysfs.
>>> + *
>>> + * This does not trigger driver reprobe by itself. Call
>>> + * igt_pci_probe_drivers() afterwards to apply the override.
>>> + *
>>> + * Returns: 0 on success, negative errno on failure.
>>> + */
>>> +int igt_pci_set_driver_override(const char *pci_slot, const char 
>>> *driver)
>>> +{
>>> +    char devpath[PATH_MAX];
>>> +    int dev;
>>> +    bool ok;
>>> +
>>> +    snprintf(devpath, sizeof(devpath), "/sys/bus/pci/devices/%s", 
>>> pci_slot);
>>> +    dev = open(devpath, O_DIRECTORY | O_RDONLY);
>>> +    if (dev < 0)
>>> +        return -errno;
>>> +
>>> +    ok = igt_sysfs_set(dev, "driver_override", driver ? driver : "");
>>> +    close(dev);
>>> +
>>> +    return ok ? 0 : -errno;
>>> +}
>>> +
>>> +/**
>>> + * igt_pci_probe_drivers:
>>> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
>>> + *
>>> + * Trigger PCI driver reprobe for @pci_slot by writing to
>>> + * /sys/bus/pci/drivers_probe.
>>> + *
>>> + * This causes the kernel to attempt binding the device, honoring any
>>> + * driver_override previously set.
>>> + *
>>> + * Note: a successful write only means the reprobe request was 
>>> accepted.
>>> + * It does not guarantee that a driver actually bound to the device.
>>> + *
>>> + * Returns: 0 on success, negative errno on failure.
>>> + */
>>> +int igt_pci_probe_drivers(const char *pci_slot)
>>> +{
>>> +    int pci;
>>> +    bool ok;
>>> +
>>> +    pci = open("/sys/bus/pci", O_DIRECTORY | O_RDONLY);
>>> +    if (pci < 0)
>>> +        return -errno;
>>> +
>>> +    ok = igt_sysfs_set(pci, "drivers_probe", pci_slot);
>>> +    close(pci);
>>> +
>>> +    return ok ? 0 : -errno;
>>> +}
>>> +
>>> +/**
>>> + * igt_pci_get_bound_driver_name:
>>> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
>>> + * @driver: destination buffer for the bound driver name
>>> + * @driver_len: size of @driver in bytes
>>> + *
>>> + * Read the currently bound PCI driver name for @pci_slot by 
>>> inspecting the
>>> + * /sys/bus/pci/devices/<BDF>/driver symlink.
>>> + *
>>> + * Return values:
>>> + *  1: device is bound and @driver contains the driver name
>>> + *  0: device is unbound (no driver symlink)
>>> + * <0: negative errno-like value on error
>>> + */
>>> +int igt_pci_get_bound_driver_name(const char *pci_slot, char 
>>> *driver, size_t driver_len)
>>> +{
>>> +    char path[PATH_MAX];
>>> +    char link[PATH_MAX];
>>> +    const char *base;
>>> +    ssize_t len;
>>> +
>>> +    if (driver && driver_len)
>>> +        driver[0] = '\0';
>>> +
>>> +    snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/driver", 
>>> pci_slot);
>>> +    len = readlink(path, link, sizeof(link) - 1);
>>> +    if (len < 0) {
>>> +        if (errno == ENOENT)
>>> +            return 0; /* unbound */
>>> +
>>> +        return -errno;
>>> +    }
>>> +
>>> +    link[len] = '\0';
>>> +    base = strrchr(link, '/');
>>> +    base = base ? base + 1 : link;
>>> +
>>> +    if (driver && driver_len)
>>
>> You can check the input params at the beginning of the function and 
>> return error if they are invalid.
>
> driver/driver_len are optional, callers may pass NULL and/or 0 when 
> they only need the
>
> return value (bound/unbound) and don’t care about the driver name...
>

Right... now I see it, but it wasn't clear at first glance. Maybe 
function doc should be updated?
Or probably it would be even better to introduce separate helper 
igt_pci_is_driver_bound()? It would call igt_pci_get_bound_driver_name() 
without passing buffer.

>>
>>> +        snprintf(driver, driver_len, "%s", base);
>>> +
>>> +    return 1;
>>> +}
>>> +
>>> +/**
>>> + * igt_pci_bind_driver_override:
>>> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
>>> + * @driver: PCI driver name to bind (must not be NULL or empty)
>>> + * @timeout_ms: how long to wait for the device to become bound.
>>> + *              If 0, don't wait (best-effort immediate check only).
>>> + *
>>> + * Bind @pci_slot to @driver using the driver_override mechanism.
>>> + *
>>> + * This helper sets driver_override and immediately triggers driver
>>> + * reprobe so that the device is bound to the requested driver.
>>> + *
>>> + * Returns: 0 on success, negative errno-like value on failure.
>>> + * A reprobe request can be accepted by sysfs while the driver probe
>>> + * fails later; this helper verifies the device ended up bound.
>>> + *
>>> + * On bind failure, returns a negative error and the failure reason 
>>> may
>>> + * also be logged to dmesg by the kernel driver.
>>> + */
>>> +int igt_pci_bind_driver_override(const char *pci_slot, const char 
>>> *driver,
>>> +                 unsigned int timeout_ms)
>>> +{
>>> +    int ret;
>>> +    char bound[64];
>>> +    int bound_ret;
>>> +    bool bound_ok;
>>> +
>>> +    if (!driver || !driver[0])
>>> +        return -EINVAL;
>>> +
>>> +    ret = igt_pci_set_driver_override(pci_slot, driver);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = igt_pci_probe_drivers(pci_slot);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /*
>>> +     * Writing to drivers_probe only tells us the kernel accepted 
>>> the request.
>>> +     * The actual driver probe may still fail (and only be reported 
>>> via dmesg).
>>> +     * Verify that the device ended up bound to the requested driver.
>>> +     */
>>> +    bound_ret = igt_pci_get_bound_driver_name(pci_slot, bound, 
>>> sizeof(bound));
>>> +    if (bound_ret < 0)
>>> +        return bound_ret;
>>> +
>>> +    if (timeout_ms == 0) {
>>> +        /*
>>> +         * No waiting requested. If the device is already bound, 
>>> validate
>>> +         * it is bound to the expected driver; otherwise treat as
>>> +         * best-effort request-only success.
>>> +         */
>>> +        if (bound_ret > 0 && strcmp(bound, driver))
>>> +            return -EBUSY;
>>> +
>>> +        return 0;
>>> +    }
>>> +
>>> +    bound_ok = igt_wait((bound_ret =
>>> +                 igt_pci_get_bound_driver_name(pci_slot, bound, 
>>> sizeof(bound))) != 0,
>>> +                timeout_ms, 1);
>>> +    if (!bound_ok)
>>> +        return -EIO;
>>> +
>>> +    if (bound_ret < 0)
>>> +        return bound_ret;
>>> +
>>> +    if (strcmp(bound, driver))
>>> +        return -EBUSY;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/**
>>> + * igt_pci_unbind_driver_override:
>>> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
>>> + * @timeout_ms: how long to wait for the device to become unbound.
>>> + *              If 0, don't wait (best-effort immediate check only).
>>> + *
>>> + * Unbind @pci_slot from its currently bound driver (if any) and clear
>>> + * any driver_override setting.
>>> + *
>>> + * This is the inverse operation of igt_pci_bind_driver_override().
>>> + *
>>> + * Returns: 0 on success, negative errno on failure.
>>> + */
>>> +int igt_pci_unbind_driver_override(const char *pci_slot, unsigned 
>>> int timeout_ms)
>>> +{
>>> +    int ret;
>>> +    int bound_ret;
>>> +    char bound[64];
>>> +    bool unbound_ok;
>>> +
>>> +    ret = igt_pci_device_unbind(pci_slot);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = igt_pci_set_driver_override(pci_slot, "");
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    bound_ret = igt_pci_get_bound_driver_name(pci_slot, bound, 
>>> sizeof(bound));
>>> +    if (bound_ret < 0)
>>> +        return bound_ret;
>>> +
>>> +    if (timeout_ms == 0)
>>> +        return 0;
>>> +
>>> +    /* Verify the device actually ends up unbound (driver symlink 
>>> removed). */
>>> +    unbound_ok = igt_wait((bound_ret =
>>> +                   igt_pci_get_bound_driver_name(pci_slot, bound, 
>>> sizeof(bound))) == 0,
>>> +                  timeout_ms, 1);
>>> +    if (!unbound_ok)
>>> +        return -EBUSY;
>>> +
>>> +    if (bound_ret < 0)
>>> +        return bound_ret;
>>> +
>>> +    return 0;
>>> +}
>>> diff --git a/lib/igt_pci.h b/lib/igt_pci.h
>>> index 92b9cc392..a66eeebf2 100644
>>> --- a/lib/igt_pci.h
>>> +++ b/lib/igt_pci.h
>>> @@ -6,8 +6,9 @@
>>>   #ifndef __IGT_PCI_H__
>>>   #define __IGT_PCI_H__
>>>   -#include <stdint.h>
>>>   #include <endian.h>
>>> +#include <stddef.h>
>>> +#include <stdint.h>
>>>     /* forward declaration */
>>>   struct pci_device;
>>> @@ -24,5 +25,15 @@ enum pci_cap_id {
>>>   #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
>>>     int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id 
>>> cap_id);
>>> +int igt_pci_device_unbind(const char *pci_slot);
>>> +int igt_pci_driver_bind(const char *driver, const char *pci_slot);
>>> +int igt_pci_driver_unbind(const char *driver, const char *pci_slot);
>>> +int igt_pci_driver_unbind_all(const char *driver);
>>> +int igt_pci_set_driver_override(const char *pci_slot, const char 
>>> *driver);
>>> +int igt_pci_probe_drivers(const char *pci_slot);
>>> +int igt_pci_get_bound_driver_name(const char *pci_slot, char 
>>> *driver, size_t driver_len);
>>> +int igt_pci_bind_driver_override(const char *pci_slot, const char 
>>> *driver,
>>> +                 unsigned int timeout_ms);
>>> +int igt_pci_unbind_driver_override(const char *pci_slot, unsigned 
>>> int timeout_ms);
>>>     #endif
