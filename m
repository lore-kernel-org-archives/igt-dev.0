Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1B9F4199B
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 12:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1CF10E6CF;
	Wed, 15 Apr 2026 12:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJT48sNl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3541A10E05F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 12:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776255402; x=1807791402;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=tc8JC32G60itnO18VnqNHr01EOvrzaJ6aRPrqL4gldo=;
 b=nJT48sNl9ocDORQwRsV/gxU5mScGiceMfI9Jf8KQEFPxcyzNAraPOPmd
 53syey5d95kr4FkDXROKds1j/WZ1Nb66jHP8PprSRggc3HaS0OGffw6qQ
 DvYOSFJYYUgRZ61+hqvbTwTZTOYF6wPVLtDjNA1gAarveGPq8bkmiOiva
 4woYXlDvsQuaCFKrXFczGGE42rK32Ri/oRH4AQYyLtq9veXMtiQfRZ3b4
 a+n8bSWJSIKGKFqpHCnNSiDIekHuQ/C2hb4lx7cSL30VKhZZ/Bj5QyaDn
 e16eEenMA+YeSxaSLWw9XRBzHpNHry/yQFIv2Sy1dg5/Lh62qjyPGGd+9 A==;
X-CSE-ConnectionGUID: qQyXIkB6S16YzdtVCTjoMA==
X-CSE-MsgGUID: RQ6T0ECjSIyLvvnooypOYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88310191"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88310191"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 05:16:42 -0700
X-CSE-ConnectionGUID: M8iYCdEVRTCRnoChS2J9qw==
X-CSE-MsgGUID: 8cQKfknaR+K3S5nW/1Gmvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253819718"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 05:16:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 05:16:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 05:16:41 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 05:16:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbaVWys+td2i9Ko7U9mpvo8rWSI6AGQvNUldKHUZloaMPlKyt9ybVWb9/XvyCddL6uDavATTadKvQVAuUVSgTaQyTe4h7ZWDiZGnmJD1pyBhI+nqx4aBEcn3PbUIX6EfagJjGtmkHgNEgr0oCEOUA6xQva/e7DtUdHrhswD4iRhyS/BtzszPoUmjclR00UUoe/5BSEKY9WIpB2q/EPRbklfiBmtcz3h9CU7/pWsE4vlpPFtxTkMrrXnRc75tac4vQ48PmN077ELHVoOhL4ZX/j6053maezA8e0remL78SwGa5vr3/3mkRpJ/+Hu/efQxeHn1wXNBYX0xgvDaI8ZyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoQ8bsivQFe6amgYMeIEbCEtl6mVZtY31ibBQPfx/fw=;
 b=BZ2mIUXbazL9TN0f/h1nNlVBKzkzv92SomrrwHozjuIJs42MGFMKTABrfUPrKTz+qVTEI9CMu7YZrMZ3M7iXqdqDSC8N9cFJvvmQLwU286KktwvOUAjN4ArqR7YOBaEYzY5cyg55rYtHxqqstqFedt+2xDZm0ej90K00jE2EwhaB6cHPvVY4sJL8ObukVAqUeVAvETo57JKNoNbjUQYnXpWUeqE97g56iq/FEpAvvYIU40PkYqxhpFU5+NTFHu9rBvzFGenvjgIyYL0WvoREH72H2op38bVJuKJQ9aDRmnHFv68cPT0weVBjUVDKWQ0TbFx9rOoNgVLauoVE6Hey0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB7588.namprd11.prod.outlook.com (2603:10b6:510:28b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 12:16:39 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 12:16:38 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 5/5] runner/resultgen: Insert attachments list
 into results.json
In-Reply-To: <h75a4hpy25g4u6tge5kigkm4x33df47z4oj2yoruf3pem4lpe6@nwlnm4fhzofg>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-12-zbigniew.kempczynski@intel.com>
 <87eckhw7an.fsf@intel.com>
 <h75a4hpy25g4u6tge5kigkm4x33df47z4oj2yoruf3pem4lpe6@nwlnm4fhzofg>
Date: Wed, 15 Apr 2026 09:16:33 -0300
Message-ID: <87h5pczae6.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: 8deeb666-cade-4594-8a24-08de9ae8d843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|18096099003;
X-Microsoft-Antispam-Message-Info: VGuMnZcIUSIzJI1muQAuPrW7Xp4GG1N5uG+T15aRe0PnFDgFuE2NuUpNAEGiFDBWHY3K405uxES5KZCxVkpEyd6gritx2GfN+gVbzlXOdvJxLCmgL2aowcK4d30iD6QKuM6W0JXWuJFogmcZjVs2YCBgQ/sUB+ym1JG4w6myMDEGHasa8BZbVwbgAOzBoEDZc9mlWTAnh1FoH/sWuH50KcUpTA1B5MPium+LlJyWhlGrbCF2FdNT+zrdYAFgXxlfjXchclpneivF/aFu55kAGyLJ+JXvXJQNkNzu7XbdM9//MJIJzMmLhBq5J6zvD8EtXTNnILVy2+hTkV/cdnEF/W5/7I0wm4gFwkCCJ2uvUoFe05g757CCWWhKgU/WzgsuUTG+DivwTstjuEhH2ChFu2zQitZ3QjOog3WVlFjaDXwAleiwzwomuCmC1NSVuH/Uf/DtarC2azoJ11qolMP1LTqOw5sfC3AEfQlJ8ZyvzVyrCiIY3eOIpyrDc5KE46al+T2Mk8mPdkEHhLxhKc54rnQNrTHEJHrXq1wMyd2R95frp1SqtaChec3BbuxG6Ciybl/LuqgZCttAIvV/kYnnUy87X3pEX2qGVq6Zxa1DC92iZTp/aEWrSyAN17ppxE4GCqphjwy+h/WZvZi22dp/aB7gszZHVWxxEEktGSLfsdcXKpWo6MSnTU4uFpykhMkI9SIzrY66NXD/pTfW/d/yGW33t1iSQwav/Pzj1t6OPLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(18096099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGNuMGpWaEpFWG1ZVTBpcWcvRFBYVzNMeUorL0ZjN08xZE5WK3RZVE9wRWYr?=
 =?utf-8?B?VmJ0N0xjayt0QURUN0tIS3NIYTRkdEQ5QzJCZDA4SnkySEtIckdydmpzSU96?=
 =?utf-8?B?NGdTTlZHblZmQVdPMFJpN3ZscDdXOWxpdlA1VnZhb3VEVWQyQ0E5RGE0N25K?=
 =?utf-8?B?N0E1SENwdmorNEdvZ0JOOWUrQWV4cTk5YWFYMDdLeVZ3ZzhBbHdNQVFhQzJQ?=
 =?utf-8?B?czVzc3NFZWtuN0l4OVJCeVk5Sk1DWkJseTIycC93MW9sVVl3aHpydlRhUUgy?=
 =?utf-8?B?L3lLdXZFZ3hHeXJ6MC9GcGVUQW13K0NXMFQyaVhqd3BESHB6RE9HNlpMUXRZ?=
 =?utf-8?B?dHIwbWxUZVZ2REQyWEdVUHFqNFRrQzg4S1hIYnNEbGhTM2dqd2k2T2dVbFA1?=
 =?utf-8?B?Nit3YVdveXcxYnhQUEdya0RlYTAvSUtpU3lXTW15aFo3Vjl1ei96ekgwcDhx?=
 =?utf-8?B?czlnbWlKblhLbFZ5WHUvNWUyWEd6ZFd6TExiQzFoRWliS3ZYenIyaFBUWURa?=
 =?utf-8?B?VVd6SS91TW41dlB5ZHNZMEozR3g3N3ZwSzgyeDgyMGw4cys1Wmg4K2lLYVp6?=
 =?utf-8?B?ZlpjOGRYWlVKOE9CV041RndudVhLRy9ubmNDRVV3RjJBQmFCZk5jU3I1U0l5?=
 =?utf-8?B?YzBtNSthN0xHTnJXYVlxUVd2dzlIcWtRTFJYYkliOFRhRmNFaDJBZjRXNUk2?=
 =?utf-8?B?dWd3d0d1S0Fpb2plY1V3VVhzZCszWUF4ajNJTTh0bHY5RlphK0w0ZTF4KzA5?=
 =?utf-8?B?Z2RBVFA4NEJDTDQ2aVljVWh4NDZFaG43S0twQmJldkJQcmNqbERoS1R6K2ND?=
 =?utf-8?B?Unppck05OEVhNGRtOE1MYnRHbkNYa1lsbStaNUxFejRJcUoyUmJPamd6NzZZ?=
 =?utf-8?B?ZFd1UDlGVUFQaTVRVXNPVkJneFM4aEYxb0NnMEJ0OFhnN1g3U2phYlhpN0VE?=
 =?utf-8?B?NHRRYzZuQTVDZm9CVjBXWHEzNzl0YU9QT2JDNnFTS01sSHNrTTZwQ01vRDlU?=
 =?utf-8?B?UHd2OGVBbG95eXJ0dE9tWUFhdlRlRXFLWmttKzM2SnRNUDZLZG1qNHR2R0Ux?=
 =?utf-8?B?WE5xTzVMd2lFcFNnUWVEbUxGV2VyRFBSTjdzQzVvclJTelUydFJUNHJNTHlz?=
 =?utf-8?B?YnUwM0xUOElleGZjaEpKZzRrSDlTcHBDYSt2RldKSnNrM3lNc0JEbEJVQ1dL?=
 =?utf-8?B?bDYvRE9uK0ptNEZnZTlySEFIaE8ranp1QUY0UXVycitxc1FwSTBreXpUeElN?=
 =?utf-8?B?RjU1TVBOUnBIbGVHeC9oTnNiZmxYZGdyQjZCU0IvUWpaL3hqaTMvaGRFbldM?=
 =?utf-8?B?VkVjWUdJcTVGYkY4ajZWRlA1SVNrdEU1cU12TjVyR0FmM2V4a2ZLdnFveEs5?=
 =?utf-8?B?c2h5ZDV1OFhpeU5qZ0FSYWJqR0xrakFzZmlnUERjWW9USDQyT0FvYzA2WHB6?=
 =?utf-8?B?M1ZHTFBHbjZ2dm92ZHhHa0dNTnEzbFI0UnUweWxNOWlDRHlkWG5kaUhkM0hN?=
 =?utf-8?B?QTZOL2RtWEI0WkFvbCsrUWZYUlpQV0FnZjJXS2hZbkVUSGpVWm1PZGZXbXZI?=
 =?utf-8?B?bExHcFExa0ZRMkZQZjV0S1M3OWpSWnZZUEJ5Nkd6YWdiNURJdWhOZFZLNFlH?=
 =?utf-8?B?ek9GNEVtNENrSTN2Q3R3RHJ4aURwRU5JNkVnVkRBaVlGbFRHSy9nYXkwb1hu?=
 =?utf-8?B?VUEvSTNxNXJZcEtMc3FCck5Hdm10U05sOGtaV3JwZU5ZZS9ua3ZtZEZOM2dV?=
 =?utf-8?B?SGkxZ09hT0tNVFZEZzdORXZveFhpR1NJOWhwTnlnMm5ocllxTkhrSElLRWt4?=
 =?utf-8?B?enJvUEtHaGdnQ2tPdys0UE9obDlqaGlqMG5xN01YZ1RWbkFvaHF6aVlnQkp5?=
 =?utf-8?B?alY5TDNTL0Nxc2JtT1F3dmo3ZXVlQlh6VStQSU5tOENFRWFMdDJXTHlRL0px?=
 =?utf-8?B?b3JMVkpOblZ3YzFOeUxLZExqWHNXb1lKY0NjRHA0WDk2NUZVYlZSdmxwOWtU?=
 =?utf-8?B?czhiNXR5dVpLVzUxZlk4WVZ6VFBuTCtuVW9ISVVsOWIvUExCODVvaDlGOEUx?=
 =?utf-8?B?UHR2MC9Yc1BZK1prakYxcjF5SUxSMmt4VFJrZlNwQi9hLytFdXRrRGl0NFVu?=
 =?utf-8?B?TU1WTklqMUtFbzk4b3RQUnNWMzBZako2aFd4UVlLTW92QnE3RENDcmRsNURU?=
 =?utf-8?B?RUtYV0lJR3pvMkMxTnNnWGtlU3VycloyRWFKRm90cWwxOFUvRUxhRTZ3MFdV?=
 =?utf-8?B?UUIxM0luTHRybisvRXQ4VnAxVW1adGN2QzBnS2hCRFZzWE4wbWNhSEJzRjdt?=
 =?utf-8?B?SWFBbDUzWS9qNk5KVmlBeGxLMGg2ZHJUNWZ3cXFuNlhQRXE0UFJ0QT09?=
X-Exchange-RoutingPolicyChecked: dP5yB/tYrf7NO/tdxhGy9o3MOfp4Xy6eyGjWtO8RuC4nAmRaftDXrO7LHY6neaIuAXUSpQPzTqQvhgJ/p+mnaD/zMEftDLYOzt/OovPIPwDX78pLSgJ7lJbFHISALmDAEPYcx2269w3hqf+SOUBHcacP3TriTufS/YjcuQ3RGu2n9Cfu2DtJGsVAFw4qyrnKRqLh7XR9ylq72UGJ7ntpQR4oN4v1zYrEKcX/aZGtSJ5Zcz/MfvrwcK9q+k1cHaLGwvu8SM8eIVK03k6/r+6POc3ysaSvDa/nKVMNuL7Vyix9Qd4lzjcHNW8PWV2zX/biOTOzBBbzD8ih87W3uO7OxA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8deeb666-cade-4594-8a24-08de9ae8d843
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 12:16:38.6467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxExzZe7Ok00bbpPtO0jKY+pJnPn0spumLIamlfjbb4i0cS5pqY89A4avMin+E03LJf5PpFyqerDLeWybXi4Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7588
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> On Tue, Apr 14, 2026 at 06:39:28PM -0300, Gustavo Sousa wrote:
>> Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:
>>=20
>> > Add list of filenames which were created by hooks in attachments direc=
tory
>> > (like GuC log copy) to results.json for allow presenting it in CI.
>> >
>> > Due to lack of userdata pointer in nftw() implementation main json
>> > object is passed via temporary static variable. It shouldn't be the
>> > problem because results.json is created in single thread. This change
>> > is not too elegant but allows to minimize the code change and is
>> > much easier to read comparing to recursive readdir().
>> >
>> > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.c=
om>
>> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> > Cc: Ryszard Knop <ryszard.knop@intel.com>
>> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
>> > ---
>> >  runner/resultgen.c | 63 +++++++++++++++++++++++++++++++++++++++++++++=
+
>> >  1 file changed, 63 insertions(+)
>> >
>> > diff --git a/runner/resultgen.c b/runner/resultgen.c
>> > index f8459385c3..d37f01a433 100644
>> > --- a/runner/resultgen.c
>> > +++ b/runner/resultgen.c
>> > @@ -1,11 +1,14 @@
>> >  #include <assert.h>
>> >  #include <ctype.h>
>> > +#include <dirent.h>
>> >  #include <fcntl.h>
>> > +#include <ftw.h>
>> >  #include <inttypes.h>
>> >  #include <stdio.h>
>> >  #include <string.h>
>> >  #include <sys/mman.h>
>> >  #include <sys/stat.h>
>> > +#include <sys/types.h>
>> >  #include <unistd.h>
>> > =20
>> >  #include <jansson.h>
>> > @@ -1156,6 +1159,63 @@ static bool fill_from_dmesg(int fd,
>> >  	return true;
>> >  }
>> > =20
>> > +struct json_t *tmp_tests;
>> > +static int ftw_attachments_list(const char *fpath, const struct stat =
*sb,
>> > +				int typeflag, struct FTW *ftwbuf)
>> > +{
>> > +	struct json_t *obj =3D NULL, *attobj =3D NULL;
>> > +	(void)sb;
>> > +	(void)ftwbuf;
>> > +
>> > +	if (typeflag =3D=3D FTW_F) {
>> > +		char *p;
>> > +
>> > +		p =3D strstr(fpath + 2, "/");
>> > +		if (!p)
>> > +			return -1;
>> > +		*p =3D '\0'; /* temporary for acquiring the piglit name */
>> > +		obj =3D get_or_create_json_object(tmp_tests, fpath + 2);
>>=20
>> For this to be trully recursive, I think we should create the JSON
>> object in the FTW_DP case.
>
> What for? Imo attachments array for test/subtest which contains
> relative paths from test/subtest is enough. I see no value by adding
> recursive arrays apart of increasing complexity to the code. Be aware CI =
has
> to present these attachments as well, so more we complicate results.json
> more work will be on CI side to alter javascript.
>
>>=20
>> > +		attobj =3D get_or_create_json_array(obj, "attachments");
>> > +		*p =3D '/'; /* bring '/' back */
>> > +		json_array_append_new(attobj, escaped_json_stringn(fpath + 2, strle=
n(fpath + 2)));
>> > +	} else if (typeflag =3D=3D FTW_DP) {
>> > +		;
>> > +	} else {
>> > +		return -1;
>> > +	}
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static bool fill_from_attachments(int idirfd, struct json_t *tests)
>> > +{
>> > +	char attname[32];
>> > +	int attdirfd;
>> > +	DIR *currdir;
>> > +	int ret;
>> > +
>> > +	snprintf(attname, sizeof(attname), "%s", DIR_ATTACHMENTS);
>> > +	if ((attdirfd =3D openat(idirfd, attname, O_DIRECTORY | O_RDONLY | O=
_CLOEXEC)) < 0) {
>> > +		fprintf(stderr, "Error opening '%s' dir\n", DIR_ATTACHMENTS);
>> > +		return false;
>> > +	}
>> > +
>> > +	currdir =3D opendir(".");
>> > +	fchdir(attdirfd);
>> > +
>> > +	/*
>> > +	 * ftw doesn't support passing user data so *tests has to be
>> > +	 * set to some global for being visible in callback function.
>> > +	 * As results.json is not processed in multiple threads it is
>> > +	 * not a big problem.
>> > +	 */
>> > +	tmp_tests =3D tests;
>> > +	ret =3D nftw(".", ftw_attachments_list, 4, FTW_PHYS | FTW_DEPTH);
>>=20
>> I think another option is to use fts(3)? Since it is a streaming API,
>> you can keep the state (i.e. the current json object) as a local
>> variable and update as you walk the tree.
>
> CI folks want minimize changes in results.json, so according to above
> I would keep everything in flat attachments array.
>
>>=20
>> It seems it is not POSIX though.  Not sure if that's a real issue for
>> IGT, since stuff in IGT are supposed to run on Linux, right?
>
> And Android if I'm not wrong.

That's Linux as well, no?  Perhaps just need to have a sanity check to
see if those functions are also available there.

>
>>=20
>> Thinking back, I guess it could fts(3) could even be used for the
>> recursive removal.
>
> Question - do we really need this? I can live with ugly static
> json at cost of simplicity especially this is only result generator
> which likely won't be touched by next months/years...

I would say: if the right tool is available for the job, why not using
it?

Not going to block on this though...

>
> For attachments case imo allowing recursive creation from hooks scripts
> is an overkill.

The hook mechanism is not something created for exclusive use by CI. It
is a tool for developers to use are they see fit.  That was my original
intention when I first developed the hooks infrastructure.

I don't like the fact that we are making assumptions of how the hooks
will behave here.

If CI wants a flat structure, that's fine: let CI provide hooks that
generate files in a flat hierarchy.  I just think that it is not right
to assume that all hooks will behave like that.

--
Gustavo Sousa

>
> --
> Zbigniew
>
>>=20
>> --
>> Gustavo Sousa
>>=20
>> > +	fchdir(dirfd(currdir));
>> > +
>> > +	return ret ? false : true;
>> > +}
>> > +
>> >  static const char *result_from_exitcode(int exitcode)
>> >  {
>> >  	switch (exitcode) {
>> > @@ -2244,6 +2304,9 @@ static bool parse_test_directory(int dirfd,
>> >  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
>> >  	}
>> > =20
>> > +	if (!fill_from_attachments(dirfd, results->tests))
>> > +		fprintf(stderr, "Error parsing attachments directory\n");
>> > +
>> >  	override_results(entry->binary, &subtests, results->tests);
>> >  	prune_subtests(settings, entry, &subtests, results->tests);
>> > =20
>> > --=20
>> > 2.43.0
