Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFB5CD3436
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 07:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8571410E046;
	Fri,  8 May 2026 07:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TR5XiZBZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9659610E046
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 07:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778226020; x=1809762020;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=4nUeFrYoOLmJxzSpz6s6Usn/IIRn7eo6FfCnHh0okm0=;
 b=TR5XiZBZJCag2OaPw23CF7RSazkm92sKcaSBgPZFCdGakmmjmqZm5SSX
 GOuZb2rWtAvA7p2plEWOgEzIPUOFMMajuwFIDhvQExIK9JgxXlkhRVmfY
 8S7/JNgbxwnrl4XpfpifbLXhYGmeooO9vbb8/lQJVD5X3DTO/moaELC/3
 OynBGzQHdX7ZYnS/N2NUIpk78NiL5udd8wXF9fYPjOyCH6dRFit07o2tD
 E7p6RDbgQufXsPawWsUhI7d4r3Ftv627jBi0SGb2hMo7UM6bMydbB9h3i
 SVW+2fpo4BSQeNACATfCDENPz2o8jt3/0Rhjn8DqMNCNRLNdDd8OjeydV w==;
X-CSE-ConnectionGUID: LrAiKBRaSwyEnuvw7BFHnQ==
X-CSE-MsgGUID: UeVx4cUjRWWysJHZpSh8Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96757757"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208,217";a="96757757"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 00:40:19 -0700
X-CSE-ConnectionGUID: X8UHVnM8Svyd52qL99uTGg==
X-CSE-MsgGUID: 4Ysc6baOTpaW3TG1YfzAEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
 d="scan'208,217";a="274815103"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 00:40:16 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 00:40:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 00:40:16 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 00:40:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kF1CBZiVOlPaRwKVoyvwYXjB8ClNjXSfYF21d61nTTRuS3fAUi8tHlNw4KLAaJ+jDCcoQdO1lIzS70HTXNeZKV0deRu2nUgaI1TypxwFm9grkoYxQOeo+DJd+iX3f8vKMNV1qaZlnd01nOcueB7MGChfmUCYxscaG9wg6nBRVPvqF3g3Dkh2/5FRkXSz6YWSI+FMI0Ul+Jhov2LO7hwxWAFz/B8YAH/laJE42gr+5BAilr8N0EbVYF2Ns9kJb2Md6Bja8QXTJm6KaHOcKwYNONVJK+YF3n3pRaoSuS8FZYPseLIqk4cX++9531WGQe1LXklXrAnQ9uAm+GhOK9DSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbUkYkNRcW0LadhuIq+/qoUYjJgDF9cGYqG5wxhHJeU=;
 b=DDG3nNtlGqBwvwcI1Nhbg4oj0mLzLkv57QFy+9pQGG4ul9f2ABL31cizIsVSgOm223YK1ouahRk8eFlIQ+x7QIsc8VlrzsifFEPMNtGLQeAbqNT8SJQFmTo+etOSSqb1U5y4WcUjyPxETu4CWCQaCVVeZ8CRKk3r+sGCRbq3oux7nrP/dUK74qyfa5f3Vy2W9qUKT/kWo3ryUvFePBQMEc9LUjPaKeYSB5KVdmo+dpu/8YMmIfORUcBriatiO1GSmjTgKOsoMfGsrU5ZnpndT61/4kFhEK3omEhqjjKn9GJDe9qiH3wROpMhipUB4TbE7uBk+wFOfI6W9J7EOiIEdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DS4PPF708A6BB3E.namprd11.prod.outlook.com (2603:10b6:f:fc02::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 07:40:07 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%7]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 07:40:07 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Santa,
 Carlos" <carlos.santa@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, 
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "Karas, Krzysztof" <krzysztof.karas@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_exec: Add VM rebind stress test
 with cpumask cycling
Thread-Topic: [PATCH i-g-t v3] tests/intel/xe_exec: Add VM rebind stress test
 with cpumask cycling
Thread-Index: AQHc06VJXrSPthspKk+nckFQz0j7/bYA3a4AgAL07xI=
Date: Fri, 8 May 2026 07:40:07 +0000
Message-ID: <CH0PR11MB5427D369272B9C0C3D77A9BB983D2@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260424042457.2178562-1-s.sebinraj@intel.com>
 <20260506102414.7t4drh2ucvuz2x23@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260506102414.7t4drh2ucvuz2x23@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DS4PPF708A6BB3E:EE_
x-ms-office365-filtering-correlation-id: 60dd4873-6b7e-45b2-dc88-08deacd506fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|13003099007|56012099003|22082099003|18002099003|3023799003|8096899003;
x-microsoft-antispam-message-info: M8bWnS6MvOtfgDjV+iHECZVTcKLZZCcRAi1irBSoWNWWVH2jgnv7YehO4fGNrb8yeTsO6Ix0vMxD1PLaQyNR0Y1iJ6vJHhC0NaRGulA3vPJ9wASWNDSAPkfLWsT4eZZO2QFbxsKfCo3gD22n2u4TIfq/vK1umLP5kca9lysVseMwvY06hTE/Ti+QVQstjsXVp8K7wd9EFlk0cU3bNSsCD2rJjHFBnulTGh2hyRWqjRf4YLxNR54H1Oas5drbR1AhDhr8wldxocibqWpw/SgBdiDMzF7TzYST3nxon9CdJVV2aQkCE0k3bHe0X14Q1NwiiTM/A6Z6lJq8ZZ3WWe50y00eWbESCHAuLy99VDUkU4gthdRqaVGypDjMePXmaUwC6njRmSxxBVGFWY3WMzIuanOMZyrDvlI+1fCf5/NcTyFBOyLdOcuNh711zLrc7Ax8wihvUhOtJNbiOVOTgeQ2q9SSjgfiol9L7E+aXoq2aQLUQjWu/36iFsj4+aKfjxDiGkTMnRmNKUEM1xR/kSsI4npQVy10ApnqNXBBAgwep+FgtEUM6dCpkGusmb04rOjoL39mHWnLzJpJxEYmS4Oo9UbytnCmCCnz/W93T4lVLL9NZAC/141Zy59BNIlfo+kkAePJzUUzJDXFTthWcmKH8re8pt1/+K/dTJBWRqM8+e88kBS1pnhgTIYpYy5l4Xc+kDrQvEkYIU88+kTAp6xPyA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(13003099007)(56012099003)(22082099003)(18002099003)(3023799003)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?KPPlc6DEEGyUbf/74WE0NOY/Rz2jQihXd+qyYhFRRoOlqmjjPXwjhD+3?=
 =?Windows-1252?Q?jaGyO18sYtisHMkeRI8q3LFHMGojbqUw5t6No0BNFcKQyZlsvA+L5AoB?=
 =?Windows-1252?Q?ri4ZDvJbaEMhzYhYt/IP+24sregWd8OVryPuU+NHdTvyOuMEP39wZWJu?=
 =?Windows-1252?Q?Q0eDZLdyjTP+JuENFf9B+ojhXJ0OJee9mHM2IGGt8Jp5kjVGlWLutB/s?=
 =?Windows-1252?Q?lVzvxuRyueecImt+Iw9dvkdhe9k3Bx5b2jPdW6EV9T1sm/ZNt4/XK2yv?=
 =?Windows-1252?Q?4ixG7w2sqIUkcg1BGEqBQCT32MfeOtcMhllvHjwiAKWlxj0zz0kj+2dd?=
 =?Windows-1252?Q?9F68wNpecbZ/sVp4IqDVQjKVBLCRRlZoSftGrXXLWC4M5ByrKhgmb6eX?=
 =?Windows-1252?Q?/xnS9eO24RqB/4lcwH1ZnrugiIxa3xpTB9jyXZNgztbofFjWKrXw3IVu?=
 =?Windows-1252?Q?6rSCunKxejCh+UPVBTIQ3cyaeDtDDCbqs+56XLfUkuqECrkXn46ARph4?=
 =?Windows-1252?Q?X5sUXbOFb2bFXJ4+g/elvT2PzaRrH8tkFAyjFcMOE53XxPBLeyFAKfa3?=
 =?Windows-1252?Q?SNsUotzw7+ymUwpO3o9Pd/3zneYF6VeES8q/H+tGv3xEm3cNzYs0n8tB?=
 =?Windows-1252?Q?G6UPQ8/Qfl3gMgbff9QJJfYRwRJ/TtgSJw/HvUGr/S2r2jmSEvu2Zuh6?=
 =?Windows-1252?Q?OwFhRlk19Cd9EJLg5pSZsMID8HrsXGTz1nPdLFGHtAU3GZNWsj49EV+Z?=
 =?Windows-1252?Q?ZtJhJ4bs/1oSMCfG6hrsuje/LYepXSdJKQw0nbwQfl2KF/YqJu+A8DT8?=
 =?Windows-1252?Q?eUzCBpQJiZVoZs11SAFktPDUO7IPDsc3CflWL80HXLUuPM4il7OnwgR9?=
 =?Windows-1252?Q?6+TiFJldmGREcbUDnx/zH8cg9ihpBSgoza9YFEEpcVBcMGIp9ybFz02W?=
 =?Windows-1252?Q?Kw5PG8k053a/kW+KwwyCXFp/muwY/SUog7y4xmjxpULS6x6iAnh1IJbn?=
 =?Windows-1252?Q?hmrT91d+dFKHkMCtDDAsZfd+Noeye3BZKDo/qvrJ22ZG+ubwMTzm81qk?=
 =?Windows-1252?Q?Q3tC9OjfEGM3De63Agis6TanQnVAF/Es9RU8NOY2w1ORj8jl7kl8gDPr?=
 =?Windows-1252?Q?auT7LE8cAyPx84jtvJG8v654aHCmGwTFaOi2YyHJV1uhviTA96L/1fPs?=
 =?Windows-1252?Q?beN1sSN4MzrzZPW9oA/QozCB9bPDSuOw3ZK62cRETVvsb8vNTH86j73P?=
 =?Windows-1252?Q?fHxkQQb7bt5aHhZggN7xD8iRkEHGErQ8mjpbBQ11FPemw1ceDh5p7AUR?=
 =?Windows-1252?Q?8Fwb0wnf97DmlyPMpldjDisAAVcs8qpYCDNW0jFWS49JaVqeWEHfcsSb?=
 =?Windows-1252?Q?l07IHrKKvo/iLS786S9TmRzaEtzLeIbt+lrlhs+i8MfZmgQ8VFes0UIC?=
 =?Windows-1252?Q?96hPoU3N7vXOYpCiIEHLOa77LVExq1givpBif6ih3X8DZEbIUPAFMxhC?=
 =?Windows-1252?Q?8mDuWIiwaBw3FbysMg9U19HIVzf6+qaZhv78EWb4CyXt088FmRO3/TCB?=
 =?Windows-1252?Q?47vFp//WygbPXcY3mCT3hpY4yUEM0KYvm/eDXTJCwN6JQe6020m6mo8m?=
 =?Windows-1252?Q?CKA/34bk3BkH9qMgAiws5XwhrvViVRhiKZnTdtEspL7eXGzmsAkfS/fp?=
 =?Windows-1252?Q?V9nPMmyPmQ2myh6cMCj/bTpaYOVBDB4DlPOGRpZhuTZn/wki8NrSZrva?=
 =?Windows-1252?Q?EzT0PElh53Rr0f18QwClPofnldjsZjxu3jyDZ/MwNSQurDk7P8p/CQPX?=
 =?Windows-1252?Q?PFi4a8/MXTSJVTns9Wd4kQwGCkLwlDYEfJNAnScolJ1RzbhA?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5427D369272B9C0C3D77A9BB983D2CH0PR11MB5427namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZnYiOwk1m5lx3JVTUgqLNqoeF4UPZMzvYDfkkSek0qIabykcWfoHMPURPJnlj8+wTXXK3wyAqL8yqV3Ox90i661O4X53hmMUp38y3XUUsWLqA1WJxl75hcQ0YkCyAZsQCaLa8THGomceiFtD9UmyfLjKljm3G4MyWIyb1dzCHgVPVxVuivT1qlERRXnZ0VVQM2oX9hC860Tg2QXJo3NymtunB4FzjV1KOjUpA9ia+l83JsLwcABWc4HTaapCs+D9pPsW4TZCdY1g5He8oiDveb57fcWdMXxRYHtj7iC0eOE6l49Me4/zaPWwLc3KvqFytlHhVMz7gUFT3F6oqHq35Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60dd4873-6b7e-45b2-dc88-08deacd506fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 07:40:07.7865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R7pjIL+eoITMXmch2XqKIGMDqv+neHukPiwPDSTkpA1b7+x9dQoHJ++2aWkbHTZ220Souj0PPuTshFglLVLvTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF708A6BB3E
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

--_000_CH0PR11MB5427D369272B9C0C3D77A9BB983D2CH0PR11MB5427namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


Hi Kamil,

Thanks for the comments.

________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Wednesday, May 6, 2026 3:54 PM
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Santa, C=
arlos <carlos.santa@intel.com>; Brost, Matthew <matthew.brost@intel.com>; B=
adrappan, Jeevaka <jeevaka.badrappan@intel.com>; B S, Karthik <karthik.b.s@=
intel.com>; Karas, Krzysztof <krzysztof.karas@intel.com>; Konieczny, Kamil =
<kamil.konieczny@intel.com>; Kempczynski, Zbigniew <zbigniew.kempczynski@in=
tel.com>
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_exec: Add VM rebind stress tes=
t with cpumask cycling

Hi,
On 2026-04-24 at 09:54:57 +0530, S Sebinraj wrote:
> Add a new subtest threads-wq-stress-rebind-bindexecqueue that stresses
> the VM rebind path under workqueue CPU pool migration pressure.
>
> The test spawns per-engine threads that continuously perform VM unbind/
> rebind cycles using per-slot bind exec queues, while a helper child
> process rapidly cycles the global unbound workqueue cpumask through
> progressively wider CPU sets (f -> ff -> fff -> ffff) at 100ms intervals.
>
> A new WQ_STRESS flag enables timed fence waits in test_legacy_mode at
> three syncobj_wait() checkpoints (per-exec-queue, bind-chain, and unbind/
> TLB-invalidation fences) using a 5-second deadline. If any fence misses
> the deadline, a shared atomic is set and all threads bail out immediately
> rather than running for the full 30-second window.
>
> All GPU work runs in a forked child that writes its result via a pipe,
> the parent polls with a 60-second timeout and restores the original
> cpumask regardless of outcome.
>
> When a hang is detected the child drops the kernel page cache
> and issues xe_force_gt_reset_all() to unblock any DMA fences still
> pending from the stress run, then writes the hang result and calls
> _exit() immediately without closing the DRM fd. Closing the fd while GPU
> work is stuck would block indefinitely in dma_resv_wait_timeout(intr=3Dfa=
lse,
> TASK_UNINTERRUPTIBLE). For the same reason, GPU resource teardown
> (exec queues, BOs, VMs) is skipped in test_legacy_mode when a hang
> is detected.
>
> On the failure path the test is aborted, as the process (child) gets into
> a D+ state (hung) and may affect other tests if marked as fail alone. So
> aborting would mean forcing a reboot in testing environment.
>
> A bug of same signature regressed in Xe driver, where the whole system
> hung due to a fencing signal not completing, which was finaly
> traced to an issue in the kernel workqueue scheduling.
> Hard reboot was the only way to bring the system back to work.
> https://patchwork.freedesktop.org/patch/715805/

>Add a description to this link, for example write:

>For reference see https://patchwork.freedesktop.org/patch/715805/
>("workqueue: Add pool_workqueue to pending_pwqs list when unplugging multi=
ple inactive works")

Okay I'll add that.

>
> v2:
> - Abort the hung test instead of marking as fail alone
> - Code Comment corrections
> - Fix type casting
> - Write check for cpumask
>
> v3:
> - Rename title of commit
> - Correct commenting style
>
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Cc: Santa Carlos <carlos.santa@intel.com>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 334 +++++++++++++++++++++++++++++++++-
>  1 file changed, 327 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.=
c
> index f082a0eda..7197f4345 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -13,9 +13,15 @@
>   */
>
>  #include <fcntl.h>
> +#include <inttypes.h>
> +#include <poll.h>
> +#include <signal.h>
> +#include <stdatomic.h>
> +#include <sys/wait.h>
>
>  #include "igt.h"
>  #include "lib/igt_syncobj.h"
> +#include "lib/igt_thread.h"
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
>
> @@ -42,9 +48,89 @@
>  #define BIND_EXEC_QUEUE      (0x1 << 13)
>  #define MANY_QUEUES  (0x1 << 14)
>  #define MULTI_QUEUE          (0x1 << 15)
> +#define WQ_STRESS            (0x1 << 16)
> +
> +/*
> + * Maximum fence wait time when WQ_STRESS is active. If any bind/unbind
> + * fence takes longer than this to signal, the workqueue is considered s=
tuck
> + * and the test fails =97 this is the direct symptom of the
> + * Xe hang caused by the kernel workqueue pool_workqueue pending_pwqs bu=
g.
> + */
> +#define WQ_FENCE_TIMEOUT_NS  (5LL * NSEC_PER_SEC)
> +
> +/*
> + * Maximum time the parent waits for the child to write its result byte.
> + * The child's stress loop runs for up to 30s (igt_until_timeout(30)), p=
lus
> + * cleanup overhead (GT reset, drop_caches, cpumask restore, sleep(1)).
> + * 60s gives ample headroom on a healthy kernel.
> + */
> +#define WQ_CHILD_TIMEOUT_MS  (60 * 1000)
> +
> +/* Sysfs node that controls the unbound workqueue CPU affinity mask. */
> +#define WQ_CPUMASK_PATH              "/sys/devices/virtual/workqueue/cpu=
mask"
> +
> +/* Procfs node for dropping the kernel's page, dentry, and inode caches.=
 */
> +#define DROP_CACHES_PATH     "/proc/sys/vm/drop_caches"
>
>  pthread_barrier_t barrier;
>
> +/*
> + * Set to true by the first thread that detects a fence stall under WQ_S=
TRESS.
> + * All other threads and the igt_until_timeout loop check this to bail o=
ut
> + * immediately rather than hammering a hung kernel for the full timeout.
> + */
> +static _Atomic bool wq_stress_hang_detected;

>Small nit: isn't 'volatile' enough?

IMHO, volatile is a compiler hint, not a synchronization primitive.
I believe _Atomic would be more apt here for a flag shared between threads.

> +
> +/*
> + * stress_fence_deadline - compute an absolute CLOCK_MONOTONIC deadline
> + * 5 seconds from now, used as the syncobj_wait timeout under WQ_STRESS.
> + */
> +static int64_t stress_fence_deadline(void)
> +{
> +     struct timespec ts;
> +
> +     clock_gettime(CLOCK_MONOTONIC, &ts);
> +     return (int64_t)ts.tv_sec * NSEC_PER_SEC + (int64_t)ts.tv_nsec +
> +             WQ_FENCE_TIMEOUT_NS;
> +}
> +
> +/*
> + * cpumask_stressor_loop
> + *
> + * Rapidly cycles the kernel unbound workqueue cpumask through progressi=
vely
> + * wider CPU sets (mirroring the original shell reproduction script). Th=
is
> + * forces workqueue work items to be migrated between CPU pools, exercis=
ing
> + * the wq_node_nr_active / pool_workqueue plug-unplug path that hides th=
e
> + * pending_pwqs scheduling bug.
> + *
> + * The original reproduction commands were:
> + *   for i in {1..1000}; do
> + *       echo f  > /sys/devices/virtual/workqueue/cpumask
> + *       echo ff > /sys/devices/virtual/workqueue/cpumask
> + *       ...
> + *       sleep .1
> + *   done
> + */
> +static void cpumask_stressor_loop(void)
> +{
> +     static const char * const masks[] =3D { "f", "ff", "fff", "ffff" };
> +     int wq_fd;
> +
> +     wq_fd =3D open(WQ_CPUMASK_PATH, O_WRONLY);
> +     if (wq_fd < 0)
> +             exit(IGT_EXIT_FAILURE);
> +
> +     for (;;) {
> +             for (int i =3D 0; i < ARRAY_SIZE(masks); i++) {
> +                     if (write(wq_fd, masks[i], strlen(masks[i])) < 0 &&
> +                         errno !=3D EINVAL)
> +                             exit(IGT_EXIT_FAILURE); /* unexpected error=
 - fail the test */
> +                     usleep(100000); /* 100ms */
> +             }
> +     }
> +     close(wq_fd);
> +}
> +
>  static void
>  test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userp=
tr,
>              int class, int n_exec_queues, int n_execs, unsigned int flag=
s)
> @@ -600,6 +686,10 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr,=
 uint64_t userptr,
>                uint64_t exec_addr;
>                int e =3D i % n_exec_queues;
>
> +             /* Bail early if another thread already detected a hang */
> +             if ((flags & WQ_STRESS) && atomic_load(&wq_stress_hang_dete=
cted))
> +                     goto wq_stress_cleanup;
> +
>                if (flags & MANY_QUEUES) {
>                        if (exec_queues[e]) {
>                                igt_assert(syncobj_wait(fd, &syncobjs[e], =
1,
> @@ -693,15 +783,65 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr=
, uint64_t userptr,
>                }
>        }
>
> -     for (i =3D 0; i < n_exec_queues; i++)
> -             igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -                                     NULL));
> -     igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL)=
);
> +

>Remove this empty line, there is already one above.

Okay I'll do that.

> +     for (i =3D 0; i < n_exec_queues; i++) {
> +             if (flags & WQ_STRESS) {
> +                     /* Drain all exec-queue fences under a 5 sec deadli=
ne */
> +                     /* A timeout means the workqueue is hung so bail im=
mediately */
> +                     if (atomic_load(&wq_stress_hang_detected) ||
> +                         !syncobj_wait(fd, &syncobjs[i], 1,
> +                                       stress_fence_deadline(), 0, NULL)=
) {
> +                             igt_critical("exec-queue[%d] fence stalled =
"
> +                                      "under WQ_STRESS, workqueue "
> +                                      "scheduling hang suspected\n", i);
> +                             atomic_store(&wq_stress_hang_detected, true=
);
> +                             igt_thread_fail();
> +                             goto wq_stress_cleanup;
> +                     }
> +             } else {
> +                     igt_assert(syncobj_wait(fd, &syncobjs[i], 1,
> +                                             INT64_MAX, 0, NULL));
> +             }
> +     }
> +
> +     if (flags & WQ_STRESS) {
> +             if (atomic_load(&wq_stress_hang_detected) ||
> +                 !syncobj_wait(fd, &sync[0].handle, 1,
> +                               stress_fence_deadline(), 0, NULL)) {
> +                     igt_critical("bind-chain fence stalled under WQ_STR=
ESS\n");
> +                     atomic_store(&wq_stress_hang_detected, true);
> +                     igt_thread_fail();
> +                     goto wq_stress_cleanup;
> +             }
> +     } else {
> +             igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
> +                                     INT64_MAX, 0, NULL));
> +     }
>
>        sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
>        xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr,
>                           bo_size, sync, 1);
> -     igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL)=
);
> +     if (flags & WQ_STRESS) {
> +             /*
> +              * This is the most critical fence under WQ_STRESS: it cove=
rs the
> +              * TLB-invalidation completion triggered by xe_vm_unbind_as=
ync().
> +              * If ttm_bo_delayed_delete() workers are stuck in the work=
queue
> +              * the TLB flush fence will never signal and we will timeou=
t here.
> +              */
> +             if (atomic_load(&wq_stress_hang_detected) ||
> +                 !syncobj_wait(fd, &sync[0].handle, 1,
> +                               stress_fence_deadline(), 0, NULL)) {
> +                     igt_critical("unbind/TLB-invalidation fence stalled=
 "
> +                              "under WQ_STRESS, "
> +                              "ttm_bo_delayed_delete work item likely st=
uck\n");
> +                     atomic_store(&wq_stress_hang_detected, true);
> +                     igt_thread_fail();
> +                     goto wq_stress_cleanup;
> +             }
> +     } else {
> +             igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
> +                                     INT64_MAX, 0, NULL));
> +     }
>
>        for (i =3D flags & INVALIDATE ? n_execs - 1 : 0;
>             i < n_execs; i++) {
> @@ -713,9 +853,21 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr,=
 uint64_t userptr,
>                        igt_assert_eq(data[i].data, 0xc0ffee);
>        }
>
> +wq_stress_cleanup:
>        syncobj_destroy(fd, sync[0].handle);
>        for (i =3D 0; i < n_exec_queues; i++) {
>                syncobj_destroy(fd, syncobjs[i]);
> +             if (flags & WQ_STRESS && atomic_load(&wq_stress_hang_detect=
ed)) {
> +                     /*
> +                      * Under WQ_STRESS, if a hang was detected skip all=
 GPU resource
> +                      * teardown calls (xe_exec_queue_destroy, xe_vm_des=
troy, gem_close).
> +                      * Those ioctls wait for pending GPU work to drain =
and will hang
> +                      * indefinitely if the workqueue is stuck. The kern=
el reclaims all
> +                      * GPU resources automatically on process exit.
> +                      */
> +                     continue;
> +             }
> +
>                xe_exec_queue_destroy(fd, exec_queues[i]);
>                if (bind_exec_queues[i])
>                        xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> @@ -723,11 +875,14 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr=
, uint64_t userptr,
>
>        if (bo) {
>                munmap(data, bo_size);
> -             gem_close(fd, bo);
> +             if (!(flags & WQ_STRESS) || !atomic_load(&wq_stress_hang_de=
tected))
> +                     gem_close(fd, bo);
>        } else if (!(flags & INVALIDATE)) {
>                free(data);
>        }
> -     if (owns_vm)
> +
> +     if (owns_vm &&
> +         (!(flags & WQ_STRESS) || !atomic_load(&wq_stress_hang_detected)=
))
>                xe_vm_destroy(fd, vm);
>        if (owns_fd)
>                drm_close_driver(fd);
> @@ -1529,6 +1684,171 @@ int igt_main()
>                }
>        }
>
> +     /**
> +      * SUBTEST: threads-wq-stress-rebind-bindexecqueue
> +      * Description: Concurrently hammers VM bind/unbind cycles using pe=
r-slot
> +      *              bind exec queues across all engines while a backgro=
und
> +      *              process rapidly cycles the unbound workqueue cpumas=
k,
> +      *              forcing work items to migrate between CPU pools.
> +      *
> +      *              Each bind and unbind fence is waited on with a 5-se=
cond
> +      *              deadline. The test passes if all fences signal with=
in that
> +      *              window across repeated iterations for up to 30 seco=
nds.
> +      *              It fails if any fence stalls beyond the deadline, i=
ndicating
> +      *              that GPU work items are no longer being scheduled.
> +      */
> +     igt_subtest("threads-wq-stress-rebind-bindexecqueue") {
> +             char orig_cpumask[64] =3D {};
> +             int cfd, result_pipe[2];
> +             pid_t child;
> +             uint8_t result_byte;
> +
> +             struct igt_helper_process cpumask_proc =3D {};
> +             int child_fd;
> +             bool hang;
> +             uint8_t r;
> +
> +             /* Needs write access to workqueue cpumask sysfs node (root=
) */
> +             igt_require(access(WQ_CPUMASK_PATH, W_OK) =3D=3D 0);
> +
> +             /* Save current cpumask so we can restore it after the test=
 */
> +             cfd =3D open(WQ_CPUMASK_PATH, O_RDONLY);
> +             igt_assert_neq(cfd, -1);
> +             read(cfd, orig_cpumask, sizeof(orig_cpumask) - 1);
> +             close(cfd);
> +             orig_cpumask[strcspn(orig_cpumask, "\n")] =3D '\0';
> +
> +             /*
> +              * Start the cpumask stressor in the parent so that any une=
xpected
> +              * write failure propagates through igt_stop_helper() and f=
ails
> +              * the test - running GPU stress without active cpumask cyc=
ling
> +              * would make this test meaningless.
> +              */
> +             cpumask_proc.use_SIGKILL =3D true;
> +             igt_fork_helper(&cpumask_proc)
> +                     cpumask_stressor_loop();
> +
> +             /* IPC channel: child writes a 1-byte result; parent reads =
via poll() */
> +             igt_assert_eq(pipe(result_pipe), 0);
> +
> +             /*
> +              * All GPU work is submitted through child_fd (opened insid=
e the
> +              * child). The fixture fd held by the parent has no pending=
 GPU
> +              * work, so drm_close_driver(fd) in the end fixture will ne=
ver
> +              * block =97 even if the child's _exit() gets stuck in
> +              * dma_resv_wait_timeout() (intr=3Dfalse, TASK_UNINTERRUPTI=
BLE).
> +              */
> +             child =3D fork();
> +             igt_assert_neq(child, -1);
> +
> +             if (child =3D=3D 0) {
> +                     /* ---- child: owns all GPU resources ---- */
> +                     close(result_pipe[0]);
> +
> +                     child_fd =3D drm_open_driver(DRIVER_XE);
> +
> +                     atomic_store(&wq_stress_hang_detected, false);
> +                     igt_until_timeout(30) {
> +                             threads(child_fd,
> +                                     REBIND | BIND_EXEC_QUEUE | WQ_STRES=
S);
> +                             if (atomic_load(&wq_stress_hang_detected))
> +                                     break;
> +                     }
> +
> +                     /* Restore cpumask from child */
> +                     cfd =3D open(WQ_CPUMASK_PATH, O_WRONLY);
> +                     if (cfd >=3D 0) {
> +                             write(cfd, orig_cpumask, strlen(orig_cpumas=
k));
> +                             close(cfd);
> +                     }
> +
> +                     hang =3D atomic_load(&wq_stress_hang_detected);
> +                     if (hang) {
> +                             int dc_fd;
> +
> +                             igt_critical("WorkQueue hang detected; drop=
ping "
> +                                          "VM page cache and forcing GT =
"
> +                                          "reset\n");
> +
> +                             dc_fd =3D open(DROP_CACHES_PATH,
> +                                          O_WRONLY);
> +                             if (dc_fd >=3D 0) {
> +                                     write(dc_fd, "3", 1);
> +                                     close(dc_fd);
> +                             }
> +
> +                             xe_force_gt_reset_all(child_fd);
> +                             sleep(1);
> +                     }
> +
> +                     /*
> +                      * Write result BEFORE _exit().  When hang =3D=3D t=
rue the
> +                      * subsequent _exit() triggers do_exit() -> exit_fi=
les()
> +                      * -> fput(child_fd) -> dma_resv_wait_timeout(intr=
=3Dfalse)
> +                      * and blocks in TASK_UNINTERRUPTIBLE.  The parent =
already
> +                      * has the answer at this point and does not need t=
o wait
> +                      * for the child to actually exit.
> +                      */
> +                     r =3D hang ? 1 : 0;
> +                     write(result_pipe[1], &r, 1);
> +                     close(result_pipe[1]);
> +
> +                     if (!hang)
> +                             drm_close_driver(child_fd);
> +                     _exit(hang ? IGT_EXIT_FAILURE : IGT_EXIT_SUCCESS);
> +             }
> +
> +             /* ---- parent ---- */
> +             close(result_pipe[1]);
> +
> +             /*
> +              * Wait up to 60s for the child to write its result byte.
> +              * The child's stress loop runs for up to 30s, plus cleanup

>Imho 30 or 60 seconds for running a test is quite a lot, would 10
>or 5 be enough? Your test could end up being blocked due to this.

I have tested with max 8secs and is working as intended. I will change thes=
e values
accordingly.

> +              * (GT reset, drop_caches, cpumask restore) =97 60s total g=
ives
> +              * enough headroom on a healthy kernel while still catching=
 a
> +              * child that has silently deadlocked before ever writing.
> +              *
> +              * poll() timeout -> treat as hang (result_byte =3D 0xFF).
> +              * read() returning 0 (EOF, no byte written) -> same.
> +              */
> +             {
> +                     struct pollfd pfd =3D {
> +                             .fd     =3D result_pipe[0],
> +                             .events =3D POLLIN,
> +                     };
> +                     int poll_ret =3D poll(&pfd, 1, WQ_CHILD_TIMEOUT_MS)=
;
> +
> +                     if (poll_ret <=3D 0) {
> +                             /* timeout (0) or poll error (-1) */
> +                             igt_warn("Timed out waiting for child resul=
t "
> +                                      "after 60s - treating as hang\n");

>Print this number as %d and use constant WQ_CHILD_TIMEOUT_MS for it.

Okay I'll do that.

> +                             result_byte =3D 0xFF;
> +                     } else if (read(result_pipe[0], &result_byte, 1) !=
=3D 1) {
> +                             result_byte =3D 0xFF; /* EOF: child crashed=
 before writing */
> +                     }
> +             }
> +             close(result_pipe[0]);
> +
> +             /* Restore cpumask from parent too. */
> +             igt_stop_helper(&cpumask_proc);
> +             cfd =3D open(WQ_CPUMASK_PATH, O_WRONLY);
> +             if (cfd >=3D 0) {
> +                     write(cfd, orig_cpumask, strlen(orig_cpumask));
> +                     close(cfd);
> +             }
> +
> +             /* Abort if hang detected, as moving forward without doing

>Remove trailing whitespace s/doing /doing/

> +              * so could lead to undefined behavior and further issues i=
n

>Same here, remove space at end.

>Regards,
>Kamil

Sure, I'll correct these

Regards,
Sebin

> +              * other tests
> +              */
> +             igt_assert_f(result_byte =3D=3D 0,
> +                          "WQ stress worker detected fence stall "
> +                          "- workqueue scheduling hang confirmed\n");
> +
> +             /* Clean path: no hang, reap child normally and continue */
> +             waitpid(child, NULL, 0);
> +     }
> +
>        igt_fixture()
>                drm_close_driver(fd);
>  }
> --
> 2.43.0
>

--_000_CH0PR11MB5427D369272B9C0C3D77A9BB983D2CH0PR11MB5427namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Kamil,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the comments.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<b=
r>
<b>Sent:</b>&nbsp;Wednesday, May 6, 2026 3:54 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Santa, Carlos &lt;carlos.santa@intel.com&gt;; Brost, Matthew &lt;=
matthew.brost@intel.com&gt;; Badrappan, Jeevaka &lt;jeevaka.badrappan@intel=
.com&gt;; B S, Karthik &lt;karthik.b.s@intel.com&gt;; Karas, Krzysztof
 &lt;krzysztof.karas@intel.com&gt;; Konieczny, Kamil &lt;kamil.konieczny@in=
tel.com&gt;; Kempczynski, Zbigniew &lt;zbigniew.kempczynski@intel.com&gt;<b=
r>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v3] tests/intel/xe_exec: Add VM rebin=
d stress test with cpumask cycling
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Hi,<br>
On 2026-04-24 at 09:54:57 +0530, S Sebinraj wrote:<br>
&gt; Add a new subtest threads-wq-stress-rebind-bindexecqueue that stresses=
<br>
&gt; the VM rebind path under workqueue CPU pool migration pressure.<br>
&gt;<br>
&gt; The test spawns per-engine threads that continuously perform VM unbind=
/<br>
&gt; rebind cycles using per-slot bind exec queues, while a helper child<br=
>
&gt; process rapidly cycles the global unbound workqueue cpumask through<br=
>
&gt; progressively wider CPU sets (f -&gt; ff -&gt; fff -&gt; ffff) at 100m=
s intervals.<br>
&gt;<br>
&gt; A new WQ_STRESS flag enables timed fence waits in test_legacy_mode at<=
br>
&gt; three syncobj_wait() checkpoints (per-exec-queue, bind-chain, and unbi=
nd/<br>
&gt; TLB-invalidation fences) using a 5-second deadline. If any fence misse=
s<br>
&gt; the deadline, a shared atomic is set and all threads bail out immediat=
ely<br>
&gt; rather than running for the full 30-second window.<br>
&gt;<br>
&gt; All GPU work runs in a forked child that writes its result via a pipe,=
<br>
&gt; the parent polls with a 60-second timeout and restores the original<br=
>
&gt; cpumask regardless of outcome.<br>
&gt;<br>
&gt; When a hang is detected the child drops the kernel page cache<br>
&gt; and issues xe_force_gt_reset_all() to unblock any DMA fences still<br>
&gt; pending from the stress run, then writes the hang result and calls<br>
&gt; _exit() immediately without closing the DRM fd. Closing the fd while G=
PU<br>
&gt; work is stuck would block indefinitely in dma_resv_wait_timeout(intr=
=3Dfalse,<br>
&gt; TASK_UNINTERRUPTIBLE). For the same reason, GPU resource teardown<br>
&gt; (exec queues, BOs, VMs) is skipped in test_legacy_mode when a hang<br>
&gt; is detected.<br>
&gt;<br>
&gt; On the failure path the test is aborted, as the process (child) gets i=
nto<br>
&gt; a D+ state (hung) and may affect other tests if marked as fail alone. =
So<br>
&gt; aborting would mean forcing a reboot in testing environment.<br>
&gt;<br>
&gt; A bug of same signature regressed in Xe driver, where the whole system=
<br>
&gt; hung due to a fencing signal not completing, which was finaly<br>
&gt; traced to an issue in the kernel workqueue scheduling.<br>
&gt; Hard reboot was the only way to bring the system back to work.<br>
&gt; <a href=3D"https://patchwork.freedesktop.org/patch/715805/" id=3D"OWA4=
7431fe3-6acc-3c01-c778-2fea6d4b9a59" class=3D"OWAAutoLink" data-auth=3D"Not=
Applicable">
https://patchwork.freedesktop.org/patch/715805/</a><br>
<br>
&gt;Add a description to this link, for example write:<br>
<br>
&gt;For reference see <a href=3D"https://patchwork.freedesktop.org/patch/71=
5805/" id=3D"OWA44bdd9ca-dd08-3ba8-526f-d3815af60c39" class=3D"OWAAutoLink"=
 data-auth=3D"NotApplicable">
https://patchwork.freedesktop.org/patch/715805/</a><br>
&gt;(&quot;workqueue: Add pool_workqueue to pending_pwqs list when unpluggi=
ng multiple inactive works&quot;)<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Okay I'll add that.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt;<br>
&gt; v2:<br>
&gt; - Abort the hung test instead of marking as fail alone<br>
&gt; - Code Comment corrections<br>
&gt; - Fix type casting<br>
&gt; - Write check for cpumask<br>
&gt;<br>
&gt; v3:<br>
&gt; - Rename title of commit<br>
&gt; - Correct commenting style<br>
&gt;<br>
&gt; Reviewed-by: Krzysztof Karas &lt;krzysztof.karas@intel.com&gt;<br>
&gt; Cc: Santa Carlos &lt;carlos.santa@intel.com&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/intel/xe_exec_threads.c | 334 ++++++++++++++++++++++++++++=
+++++-<br>
&gt;&nbsp; 1 file changed, 327 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threa=
ds.c<br>
&gt; index f082a0eda..7197f4345 100644<br>
&gt; --- a/tests/intel/xe_exec_threads.c<br>
&gt; +++ b/tests/intel/xe_exec_threads.c<br>
&gt; @@ -13,9 +13,15 @@<br>
&gt;&nbsp;&nbsp; */<br>
&gt;&nbsp;<br>
&gt;&nbsp; #include &lt;fcntl.h&gt;<br>
&gt; +#include &lt;inttypes.h&gt;<br>
&gt; +#include &lt;poll.h&gt;<br>
&gt; +#include &lt;signal.h&gt;<br>
&gt; +#include &lt;stdatomic.h&gt;<br>
&gt; +#include &lt;sys/wait.h&gt;<br>
&gt;&nbsp;<br>
&gt;&nbsp; #include &quot;igt.h&quot;<br>
&gt;&nbsp; #include &quot;lib/igt_syncobj.h&quot;<br>
&gt; +#include &quot;lib/igt_thread.h&quot;<br>
&gt;&nbsp; #include &quot;lib/intel_reg.h&quot;<br>
&gt;&nbsp; #include &quot;xe_drm.h&quot;<br>
&gt;&nbsp;<br>
&gt; @@ -42,9 +48,89 @@<br>
&gt;&nbsp; #define BIND_EXEC_QUEUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (0x1 &lt;&=
lt; 13)<br>
&gt;&nbsp; #define MANY_QUEUES&nbsp; (0x1 &lt;&lt; 14)<br>
&gt;&nbsp; #define MULTI_QUEUE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; (0x1 &lt;&lt; 15)<br>
&gt; +#define WQ_STRESS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; (0x1 &lt;&lt; 16)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Maximum fence wait time when WQ_STRESS is active. If any bind/unbi=
nd<br>
&gt; + * fence takes longer than this to signal, the workqueue is considere=
d stuck<br>
&gt; + * and the test fails =97 this is the direct symptom of the<br>
&gt; + * Xe hang caused by the kernel workqueue pool_workqueue pending_pwqs=
 bug.<br>
&gt; + */<br>
&gt; +#define WQ_FENCE_TIMEOUT_NS&nbsp; (5LL * NSEC_PER_SEC)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Maximum time the parent waits for the child to write its result by=
te.<br>
&gt; + * The child's stress loop runs for up to 30s (igt_until_timeout(30))=
, plus<br>
&gt; + * cleanup overhead (GT reset, drop_caches, cpumask restore, sleep(1)=
).<br>
&gt; + * 60s gives ample headroom on a healthy kernel.<br>
&gt; + */<br>
&gt; +#define WQ_CHILD_TIMEOUT_MS&nbsp; (60 * 1000)<br>
&gt; +<br>
&gt; +/* Sysfs node that controls the unbound workqueue CPU affinity mask. =
*/<br>
&gt; +#define WQ_CPUMASK_PATH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/devices/virtual/workqueue/cpuma=
sk&quot;<br>
&gt; +<br>
&gt; +/* Procfs node for dropping the kernel's page, dentry, and inode cach=
es. */<br>
&gt; +#define DROP_CACHES_PATH&nbsp;&nbsp;&nbsp;&nbsp; &quot;/proc/sys/vm/d=
rop_caches&quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; pthread_barrier_t barrier;<br>
&gt;&nbsp;<br>
&gt; +/*<br>
&gt; + * Set to true by the first thread that detects a fence stall under W=
Q_STRESS.<br>
&gt; + * All other threads and the igt_until_timeout loop check this to bai=
l out<br>
&gt; + * immediately rather than hammering a hung kernel for the full timeo=
ut.<br>
&gt; + */<br>
&gt; +static _Atomic bool wq_stress_hang_detected;<br>
<br>
&gt;Small nit: isn't 'volatile' enough?<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
IMHO, volatile is a compiler hint, not a synchronization primitive.<br>
I believe _Atomic would be more apt here for a flag shared between threads.=
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt; +<br>
&gt; +/*<br>
&gt; + * stress_fence_deadline - compute an absolute CLOCK_MONOTONIC deadli=
ne<br>
&gt; + * 5 seconds from now, used as the syncobj_wait timeout under WQ_STRE=
SS.<br>
&gt; + */<br>
&gt; +static int64_t stress_fence_deadline(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct timespec ts;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; clock_gettime(CLOCK_MONOTONIC, &amp;ts);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return (int64_t)ts.tv_sec * NSEC_PER_SEC + (=
int64_t)ts.tv_nsec +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; WQ_FENCE_TIMEOUT_NS;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * cpumask_stressor_loop<br>
&gt; + *<br>
&gt; + * Rapidly cycles the kernel unbound workqueue cpumask through progre=
ssively<br>
&gt; + * wider CPU sets (mirroring the original shell reproduction script).=
 This<br>
&gt; + * forces workqueue work items to be migrated between CPU pools, exer=
cising<br>
&gt; + * the wq_node_nr_active / pool_workqueue plug-unplug path that hides=
 the<br>
&gt; + * pending_pwqs scheduling bug.<br>
&gt; + *<br>
&gt; + * The original reproduction commands were:<br>
&gt; + *&nbsp;&nbsp; for i in {1..1000}; do<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo f&nbsp; &gt; /sys/devices=
/virtual/workqueue/cpumask<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo ff &gt; /sys/devices/virt=
ual/workqueue/cpumask<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt; + *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sleep .1<br>
&gt; + *&nbsp;&nbsp; done<br>
&gt; + */<br>
&gt; +static void cpumask_stressor_loop(void)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; static const char * const masks[] =3D { &quo=
t;f&quot;, &quot;ff&quot;, &quot;fff&quot;, &quot;ffff&quot; };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int wq_fd;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; wq_fd =3D open(WQ_CPUMASK_PATH, O_WRONLY);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (wq_fd &lt; 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; exit(IGT_EXIT_FAILURE);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (;;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; for (int i =3D 0; i &lt; ARRAY_SIZE(masks); i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (write(wq_fd, masks[=
i], strlen(masks[i])) &lt; 0 &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 errno !=3D EINVAL)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; exit(IGT_EXIT_FAILURE); /* unexpected error - fail=
 the test */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usleep(100000); /* 100m=
s */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; close(wq_fd);<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static void<br>
&gt;&nbsp; test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64=
_t userptr,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; int class, int n_exec_queues, int n_execs, unsigned int flags)<br>
&gt; @@ -600,6 +686,10 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t ad=
dr, uint64_t userptr,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; uint64_t exec_addr;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; int e =3D i % n_exec_queues;<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Bail early if another thread already detected a hang */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if ((flags &amp; WQ_STRESS) &amp;&amp; atomic_load(&amp;wq_stress_hang_=
detected))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto wq_stress_cleanup;=
<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (flags &amp; MANY_QUEUES) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (exe=
c_queues[e]) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(syncobj_wait(fd, &amp;s=
yncobjs[e], 1,<br>
&gt; @@ -693,15 +783,65 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t a=
ddr, uint64_t userptr,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; n_exec_queues; i++)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(syncobj_wait(fd, &amp;syncobjs[i], 1, INT64_MAX, 0,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NU=
LL));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(syncobj_wait(fd, &amp;sync[0].han=
dle, 1, INT64_MAX, 0, NULL));<br>
&gt; +<br>
<br>
&gt;Remove this empty line, there is already one above.<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Okay I'll do that.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; n_exec_queues; i++) {<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (flags &amp; WQ_STRESS) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Drain all exec-queue=
 fences under a 5 sec deadline */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* A timeout means the =
workqueue is hung so bail immediately */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (atomic_load(&amp;wq=
_stress_hang_detected) ||<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 !syncobj_wait(fd, &amp;syncobjs[i], 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; stress_fence_deadline(), 0, NULL)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_critical(&quot;exec-queue[%d] fence stalled &q=
uot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;under WQ_STRESS, workqueue &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;scheduling hang suspected\n&quot;, i);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; atomic_store(&amp;wq_stress_hang_detected, true);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_thread_fail();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; goto wq_stress_cleanup;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(syncobj_wait=
(fd, &amp;syncobjs[i], 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INT64_MAX, 0, NULL));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; WQ_STRESS) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (atomic_load(&amp;wq_stress_hang_detected) ||<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; !syncobj_wait(fd, &amp;sync[0].handle, 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stress_fence_deadline(), 0, NULL)) {<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_critical(&quot;bind=
-chain fence stalled under WQ_STRESS\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_store(&amp;wq_st=
ress_hang_detected, true);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_thread_fail();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto wq_stress_cleanup;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(syncobj_wait(fd, &amp;sync[0].handle, 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IN=
T64_MAX, 0, NULL));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sync[0].flags |=3D DRM_XE_SY=
NC_FLAG_SIGNAL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_unbind_async(fd, vm, b=
ind_exec_queues[0], 0, addr,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; bo_size, sync, 1);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(syncobj_wait(fd, &amp;sync[0].han=
dle, 1, INT64_MAX, 0, NULL));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; WQ_STRESS) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * This is the most critical fence under WQ_STRESS: it covers the<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * TLB-invalidation completion triggered by xe_vm_unbind_async().<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * If ttm_bo_delayed_delete() workers are stuck in the workqueue<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * the TLB flush fence will never signal and we will timeout here.=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (atomic_load(&amp;wq_stress_hang_detected) ||<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; !syncobj_wait(fd, &amp;sync[0].handle, 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stress_fence_deadline(), 0, NULL)) {<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_critical(&quot;unbi=
nd/TLB-invalidation fence stalled &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;under WQ_STRESS, &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ttm_bo_delayed_delete work item likely=
 stuck\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_store(&amp;wq_st=
ress_hang_detected, true);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_thread_fail();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto wq_stress_cleanup;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert(syncobj_wait(fd, &amp;sync[0].handle, 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IN=
T64_MAX, 0, NULL));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D flags &amp; INVAL=
IDATE ? n_execs - 1 : 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; i &lt; n_execs; i++) {<br>
&gt; @@ -713,9 +853,21 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t ad=
dr, uint64_t userptr,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_ass=
ert_eq(data[i].data, 0xc0ffee);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +wq_stress_cleanup:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; syncobj_destroy(fd, sync[0].=
handle);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; n_exec_=
queues; i++) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; syncobj_destroy(fd, syncobjs[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (flags &amp; WQ_STRESS &amp;&amp; atomic_load(&amp;wq_stress_hang_de=
tected)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Under WQ_STRESS=
, if a hang was detected skip all GPU resource<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * teardown calls =
(xe_exec_queue_destroy, xe_vm_destroy, gem_close).<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Those ioctls wa=
it for pending GPU work to drain and will hang<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * indefinitely if=
 the workqueue is stuck. The kernel reclaims all<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * GPU resources a=
utomatically on process exit.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; xe_exec_queue_destroy(fd, exec_queues[i]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (bind_exec_queues[i])<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_exec=
_queue_destroy(fd, bind_exec_queues[i]);<br>
&gt; @@ -723,11 +875,14 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t a=
ddr, uint64_t userptr,<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bo) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; munmap(data, bo_size);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; gem_close(fd, bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!(flags &amp; WQ_STRESS) || !atomic_load(&amp;wq_stress_hang_detect=
ed))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gem_close(fd, bo);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (!(flags &amp; INV=
ALIDATE)) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; free(data);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (owns_vm)<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (owns_vm &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (!(flags &amp; WQ_ST=
RESS) || !atomic_load(&amp;wq_stress_hang_detected)))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; xe_vm_destroy(fd, vm);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (owns_fd)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; drm_close_driver(fd);<br>
&gt; @@ -1529,6 +1684,171 @@ int igt_main()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * SUBTEST: threads-wq-stress-rebind-bi=
ndexecqueue<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Description: Concurrently hammers VM=
 bind/unbind cycles using per-slot<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bind exec queues across all engin=
es while a background<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process rapidly cycles the unboun=
d workqueue cpumask,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forcing work items to migrate bet=
ween CPU pools.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Each bind and unbind fence is wai=
ted on with a 5-second<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; deadline. The test passes if all =
fences signal within that<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; window across repeated iterations=
 for up to 30 seconds.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It fails if any fence stalls beyo=
nd the deadline, indicating<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; that GPU work items are no longer=
 being scheduled.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest(&quot;threads-wq-stress-rebind-b=
indexecqueue&quot;) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char orig_cpumask[64] =3D {};<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int cfd, result_pipe[2];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pid_t child;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint8_t result_byte;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct igt_helper_process cpumask_proc =3D {};<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int child_fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bool hang;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint8_t r;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Needs write access to workqueue cpumask sysfs node (root) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_require(access(WQ_CPUMASK_PATH, W_OK) =3D=3D 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Save current cpumask so we can restore it after the test */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cfd =3D open(WQ_CPUMASK_PATH, O_RDONLY);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_neq(cfd, -1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; read(cfd, orig_cpumask, sizeof(orig_cpumask) - 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(cfd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; orig_cpumask[strcspn(orig_cpumask, &quot;\n&quot;)] =3D '\0';<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * Start the cpumask stressor in the parent so that any unexpected=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * write failure propagates through igt_stop_helper() and fails<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * the test - running GPU stress without active cpumask cycling<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * would make this test meaningless.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cpumask_proc.use_SIGKILL =3D true;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_fork_helper(&amp;cpumask_proc)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpumask_stressor_loop()=
;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* IPC channel: child writes a 1-byte result; parent reads via poll() *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_eq(pipe(result_pipe), 0);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * All GPU work is submitted through child_fd (opened inside the<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * child). The fixture fd held by the parent has no pending GPU<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * work, so drm_close_driver(fd) in the end fixture will never<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * block =97 even if the child's _exit() gets stuck in<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * dma_resv_wait_timeout() (intr=3Dfalse, TASK_UNINTERRUPTIBLE).<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; child =3D fork();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_neq(child, -1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (child =3D=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ---- child: owns all=
 GPU resources ---- */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(result_pipe[0]);<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; child_fd =3D drm_open_d=
river(DRIVER_XE);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_store(&amp;wq_st=
ress_hang_detected, false);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_until_timeout(30) {=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; threads(child_fd,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RE=
BIND | BIND_EXEC_QUEUE | WQ_STRESS);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; if (atomic_load(&amp;wq_stress_hang_detected))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; br=
eak;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Restore cpumask from=
 child */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cfd =3D open(WQ_CPUMASK=
_PATH, O_WRONLY);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cfd &gt;=3D 0) {<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; write(cfd, orig_cpumask, strlen(orig_cpumask));<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; close(cfd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hang =3D atomic_load(&a=
mp;wq_stress_hang_detected);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (hang) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; int dc_fd;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_critical(&quot;WorkQueue hang detected; droppi=
ng &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;VM page cache and forcing GT &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;reset\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; dc_fd =3D open(DROP_CACHES_PATH,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; O_WRONLY);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; if (dc_fd &gt;=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wr=
ite(dc_fd, &quot;3&quot;, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cl=
ose(dc_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; xe_force_gt_reset_all(child_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; sleep(1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Write result BE=
FORE _exit().&nbsp; When hang =3D=3D true the<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * subsequent _exi=
t() triggers do_exit() -&gt; exit_files()<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * -&gt; fput(chil=
d_fd) -&gt; dma_resv_wait_timeout(intr=3Dfalse)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * and blocks in T=
ASK_UNINTERRUPTIBLE.&nbsp; The parent already<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * has the answer =
at this point and does not need to wait<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * for the child t=
o actually exit.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D hang ? 1 : 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write(result_pipe[1], &=
amp;r, 1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(result_pipe[1]);<=
br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!hang)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; drm_close_driver(child_fd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _exit(hang ? IGT_EXIT_F=
AILURE : IGT_EXIT_SUCCESS);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* ---- parent ---- */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(result_pipe[1]);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * Wait up to 60s for the child to write its result byte.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * The child's stress loop runs for up to 30s, plus cleanup<br>
<br>
&gt;Imho 30 or 60 seconds for running a test is quite a lot, would 10<br>
&gt;or 5 be enough? Your test could end up being blocked due to this.<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I have tested with max 8secs and is working as intended. I will change thes=
e values</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
accordingly.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * (GT reset, drop_caches, cpumask restore) =97 60s total gives<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * enough headroom on a healthy kernel while still catching a<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * child that has silently deadlocked before ever writing.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * poll() timeout -&gt; treat as hang (result_byte =3D 0xFF).<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * read() returning 0 (EOF, no byte written) -&gt; same.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pollfd pfd =3D {=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; .fd&nbsp;&nbsp;&nbsp;&nbsp; =3D result_pipe[0],<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; .events =3D POLLIN,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int poll_ret =3D poll(&=
amp;pfd, 1, WQ_CHILD_TIMEOUT_MS);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (poll_ret &lt;=3D 0)=
 {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; /* timeout (0) or poll error (-1) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; igt_warn(&quot;Timed out waiting for child result =
&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; &quot;after 60s - treating as hang\n&quot;);<br>
<br>
&gt;Print this number as %d and use constant WQ_CHILD_TIMEOUT_MS for it.<br=
>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Okay I'll do that.</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; result_byte =3D 0xFF;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (read(result_=
pipe[0], &amp;result_byte, 1) !=3D 1) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; result_byte =3D 0xFF; /* EOF: child crashed before=
 writing */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(result_pipe[0]);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Restore cpumask from parent too. */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_stop_helper(&amp;cpumask_proc);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cfd =3D open(WQ_CPUMASK_PATH, O_WRONLY);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (cfd &gt;=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write(cfd, orig_cpumask=
, strlen(orig_cpumask));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(cfd);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Abort if hang detected, as moving forward without doing<br>
<br>
&gt;Remove trailing whitespace s/doing /doing/<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * so could lead to undefined behavior and further issues in<br>
<br>
&gt;Same here, remove space at end.<br>
<br>
&gt;Regards,<br>
&gt;Kamil<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Sure, I'll correct these</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Sebin</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * other tests<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_assert_f(result_byte =3D=3D 0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;WQ stress worker detected fence stall &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;- workqueue scheduling hang confirmed\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Clean path: no hang, reap child normally and continue */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; waitpid(child, NULL, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture()<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; drm_close_driver(fd);<br>
&gt;&nbsp; }<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</div>
</body>
</html>

--_000_CH0PR11MB5427D369272B9C0C3D77A9BB983D2CH0PR11MB5427namp_--
