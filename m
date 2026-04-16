Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57F7F8D76E
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 19:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889DC10E10F;
	Thu, 16 Apr 2026 19:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HT4Y2maj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC4D10E10F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 19:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776369552; x=1807905552;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=e/DgW9sd2cZCYrppmYSoi3JPf5wSKyaLlYrwlyQq2jA=;
 b=HT4Y2maj6XkY6jDTdn0I0IfX3wUp3X9sGhalWL08KnUNl76f2Y8vagjd
 99POyCbeJe2Ol8lbXR+QuhLXbvYDyO1KASIOJjxmIrrHPIJdxWYfZmyJz
 /3GYTmfHqchClN6cZso2h0zdnWnXFZim/IBAX+vudHtOzKWF9uLIfrCf7
 dH6dtJNCuoeUk0/pIk1Mj85apZxoFhRP4nsJSmGerCLEILHKvKKjla/mo
 x1NtF0JVDTMGc1Y4EGZERebG91KpXk9bxmsLOlf30wUdQZO3zXG8s8BOV
 0e2VnP5nW0+GZfsVHOupypZf9SwGFciUw/Do+nksqvxP+h+9fCho0gyXT Q==;
X-CSE-ConnectionGUID: mNYVsAnjRKKywWeXdULceA==
X-CSE-MsgGUID: +AdOOmevRmSi+j1WYk//mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="87687417"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="87687417"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:59:12 -0700
X-CSE-ConnectionGUID: 08zHs8/nQdqmfLyNp6KmHg==
X-CSE-MsgGUID: T11zKhz1SFSg3E4fdabbJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="231086842"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:59:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:59:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 12:59:11 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 12:59:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRVM1hv9+cObNJHJgu3d0JI0wbBbU8sXHNu0N2oYvBGfMifhzPDdTqPcnMRdvDOx+rZtunFbGeTckbjY3tfbnCwxnrAJqEoCdpSanuQJJVF+XCitNhrg+u5dKyhNxpB3ZWqxMyQsLIjVrCSConrhgA13KnpFidqt75HHQCKvngTPSjHEF+fpPFnT7AP56qbwYuI2osSef62Kb3OyLUI1ZMuTFIxRxm5J2/23Hu9R21/sXkMZDHEd7c+Bkxs68RV83UgClb8eqGWChRRuRnc6FNm+YN7LT/PNFUWnFepXlxcdlZUZcqI6yA0VWZKfHO7ThURyySgN5QLHugcBb9RAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OYZ0SmTzhj4zGABTNE9oyvkRdSu6OvyFuIgCQ+otdA=;
 b=afurzOfUVuLjDIwYSWf27xVVcJsmtNyHzlJbhotHIAENK4tpZzJhbkc8Y5q40is2ygUwsw4OIvqpt7Vh8b2iS/mmUREE1l88z+PktXnrcKJ5bKGMcdU8DhqTPxlirCXY4fZg7HesTTwRkJgchvfAqBrALamiamO9v5aDypSP0rVY/w9qm8YUma4pLb+BTN4Cup+btYYQap/v8emCWqHOrC48y9Jv2cnnL62Hc7Sn3vGJU34fzJ+qz4RaLkdmLr7z0442T+nJz3/Z5klyk1nX4O3vBEMYsvY7730FLcJ6x7JQugjassZLoiF/2rhiJCd6+VJvh11v7xa/JEpznxxn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SAWPR11MB9570.namprd11.prod.outlook.com (2603:10b6:806:4e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.45; Thu, 16 Apr
 2026 19:59:08 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 19:59:08 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 3/5] scripts/hooks: Example guc log copy script
 and allowlist
In-Reply-To: <whs6rir6koqiw3ul22hvvla5qhd4lb5h7z4xhb2xlqbzsd2evu@uwsh6oyshba5>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-10-zbigniew.kempczynski@intel.com>
 <87h5pdwad7.fsf@intel.com>
 <4aj2f6zypdgeh464ioioadbbb7gv5wmmpxn4o33pim7zwb5wop@5io7kd4hcw4n>
 <87eckgz8s8.fsf@intel.com>
 <whs6rir6koqiw3ul22hvvla5qhd4lb5h7z4xhb2xlqbzsd2evu@uwsh6oyshba5>
Date: Thu, 16 Apr 2026 16:59:04 -0300
Message-ID: <87y0imu16f.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::36) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SAWPR11MB9570:EE_
X-MS-Office365-Filtering-Correlation-Id: 710c35c2-bb1b-4f88-f86e-08de9bf29ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: SESD0u/L9YYK5RoZS8XfF4/mzrGPVubky/3n4MyuiUp5Z+nArLVm4HVajss0j1BMws+O6/EfI2Tg43c6tQI6MtSm/YxE5cMsZilqPuQONpRE5M1aBuYkKuIHCX1LQ/eU3TmYsrn2/wglQOIVvJenPuvxTSBX4e68Azr032CZo3A8UbbsXTQdVlisVxn/SWpjUdNznYcepC6GBIkK90iebdyyG/VbByyT0+/WrATYcvzRXxkokG2oTZeLbb430NGRTewg7o00zaBiiHKzq5KSHHNRyYUoHVWo2WHpKrQkJhEtqhX/okahYzgw4mXbSGXaR5wJY/X7JPbcUheABw9/fsmiYBtfy0EY7h+6WlZERdFlW9/PKbGsX3IGO3mjiJMFhiw6lExa7nv9gJDbcYCTeEsvPk74aDc0kMMuX6yLzafV//sMmNzaocf9bRxsrLIrwTIfDPUu9HhpdHDLLA5dWA3vSy50GYGndE6EYoK6Mz++htJUPwdsAi6w4eSeXZn7jNwrEhFaYR8ROfQe9Ka9uMZox95CToUkwHEwl1BZ8AhRS07TWC5PU0eIig5CkStpsY5Gwh6mRsKdv30fR8syXQLYwlz6y5GLOXF9A+ZzkMEnNQ2fF9/tqoU70tDiKWGS8WIrPdmQh4U+yWGHEKD80PKCXwjVL0K7MPLmjwuR4K6zi1XvOypAtaT1l6k6rzBkFVeHtwLEqlri5HjttsG4qewwRWcdf3KLEVQMr9FjKJc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnkyaDRpczMxOEc5NTZlRzYxR096ZzcvOG13Tmw5NE9MdHRXRzZSeHBNTzJm?=
 =?utf-8?B?amdsK3Jsa0ljOWl2TjJGem5ULytOcHE4TU5sVGdvZW9oR0xUd1E4S1NtS2Mx?=
 =?utf-8?B?Mm51VVFWWE5ROGIwWWhOZE5SY1FsZHM1N3RQNjNXaEZWMlNueHFKcGR1RGY1?=
 =?utf-8?B?Y0MxbkovN2FlOUwzL2ZTYmVucVpQU2hTeTcva1dJZmtJeitPcW5LMXpiVFhF?=
 =?utf-8?B?V3l6bHFmeTJkWnRuTTVJZzdwN0hlUmFMZTloWGVoWk5FTTJSWmZpZysrMmww?=
 =?utf-8?B?V1JoZGd4NEkyR3YvTlJCNC9Yd2haU2k0bGQ1Tjc5eGJ3NldyUUxTY1ZJcHd6?=
 =?utf-8?B?akczMlJUR3FiMXRCcmY5NG5tOTlha1k0RVl6aytjb2V5T1M2cUl6OHJqODVT?=
 =?utf-8?B?QmRvUWUwV0lEYnZVem5oVFVVcUJ4WTNkdlc2cnAyV2NjUU52Q011UkppUzZK?=
 =?utf-8?B?WldZbENIUkhvSU1aWFBscjU4Q2NPUWNhRDI3cEpDNS8vc1liZ2xMOVY3SDJW?=
 =?utf-8?B?aHFrSUt5VE9oUG12V3orY0RJdW9MSE0vcEczOS9YbU1zdlgyb2lVTU9pN041?=
 =?utf-8?B?Y0JRWW16NitpdGhyWTMrN0VmWXhaRDNEKzJRNHpTaUFoTG9RK3lWQVVRbitC?=
 =?utf-8?B?ZWNNS2k1ZytEQWMybUdNTnM4TXFiSThEK3dpNEVLZ0x6ZDBLbUJpRHd0MU4w?=
 =?utf-8?B?OW5ManJYdS8zY2ZpSEI1aSszdHM3SHI4Z3A4M1VBUzdGbW1BOWRkRFdTT2VW?=
 =?utf-8?B?UEw2OVpVMW1kcktiUUJ1RGwvenBDTXZyNC9aR2ozWE45dFdEUld4Y3plczUx?=
 =?utf-8?B?Z1hHeEVWQitWMFVCV3NNbTFaK1p4Y1ZMc1BQN3Q5NnU4Q2pGblVsR1JvMzAw?=
 =?utf-8?B?Nmt5Y0hpa0pSWTlKdEV3eUJ5T1BZQUg4WUMrRlptbHBFV3c0L045TVBYM1lZ?=
 =?utf-8?B?Q1VKcmQ5NXRuQ1V5cGtFUmtjbU1ST1YxWmJMallUeXFIbzN1RzNFVzEvUjA2?=
 =?utf-8?B?aHVZVzNmbVR6OXpBN3AwMURaU0p1S2g3T1REZHcyNlB0bng4MVlobVlDZ0to?=
 =?utf-8?B?YStWNzJRQ0dNQURuNTZjRVBUbVNkUnpJM1pwS3UraFdBV01tMUI1TVdtazlr?=
 =?utf-8?B?OXdJeW1RYW50dVAxRFpOMVdsMk9QSElvYjR1VFAwbEk3bEdaSERFMldhaGE3?=
 =?utf-8?B?Vit2bTFha284SzF3d2pnLzZwMStqbE1oY3UyMlRueDM5eDJJR0ZlU3Z4QU1P?=
 =?utf-8?B?Y0xFYTVGUVlocHFIY0NuL3FkMUhxQ1dBZ25uZE81cFJUWDVMNFdIQzA5NEp0?=
 =?utf-8?B?Zkp2UjJka2owT2dZa2tmdXpFY3RmbFZxZE15R0RPQksva3NoOWhsT3RVM3g0?=
 =?utf-8?B?Rks2NTlvTlRET01kcXVjT0J3TUFLQTJOM21XUjI3RGM1NGw4Zm5GNkp3U1Va?=
 =?utf-8?B?dVFEdXprNnNzcVpGT1RDY2YvUzNGYXRVdURIZmNqSFJrK0k2MTVGQmVSYXYr?=
 =?utf-8?B?TWx1UW5zck90dVQzMS9DcjJ1VjROSk0wZG9ac0hBV2IyUXpPRWlOVTBCQnF6?=
 =?utf-8?B?S29sQlU2UVdTZVNDYmtGK1hxMzhlY2FlOU5McHlISmF0ZllQdVBZVWJLQ3RL?=
 =?utf-8?B?M2V6bWU0Zk1sTW9VTFNudlJvOGp5T29uYkRuZkMwVjQ4MlNjRUZYNmQxQ3FY?=
 =?utf-8?B?U2E0SGNIQkhWTDM2U0YxY1NGamh4NkRrWU95NmFaQ1N4M1IrRDk1bFdPOWVo?=
 =?utf-8?B?OXJ6VEVzclMyNmk1bVFGaVYxQWpNeDBFWUdXR3ZMRFhxejRUOFd5a3RiTlVy?=
 =?utf-8?B?aVdhcjBHMjhJdDBXNkRmRWMxU0NJc1NuOWJBUTV1cUtSenlZOEhobVFmRW5D?=
 =?utf-8?B?bUlTMlp3UzRhdi8xSHV3NGxYblZMTi9GclRUTlQ0YUNRSWwvZlBCb1FGTnc5?=
 =?utf-8?B?Q3UyVjZxVEw2WFNMRjcxS2pYb3BaUEhaSGpSb3lvbEFhZnFWUzlnaDhYeXpQ?=
 =?utf-8?B?TmhITlk2R3cxaTVzOENMTyswSW5GOE5xa2JyQU1OdTM3NWhVajI0NVVWenY5?=
 =?utf-8?B?VU5vQTFEOEhLc2xYTFNUNWcxLzRVTy81ZEdETjFqa3FHNW12cHZrZFVieW42?=
 =?utf-8?B?M1N0UzdKczZFK2NpYXluc1NBdHpyMmUyQlh5c0cyV20xalV4eDVwYXlza0dw?=
 =?utf-8?B?WkdGYTZrVncvKzBzRkVpR2lOazkyTzBadU1YM2E4WmpIcTNQVUZSQU5wblhv?=
 =?utf-8?B?UVFNMXdzTG53K2hrajZSVUlKSURXcUQyNHNRZ2wvei83YWNUU1ZDaE4yL2NN?=
 =?utf-8?B?NXFuQXBZR21FMHVaZWE4YmxOeENib1Zob3NrSXVVcVlUVWFFSWhMUT09?=
X-Exchange-RoutingPolicyChecked: M1+dHH+JBHVNM9ZOqg3LofveqnePNiiqlB5tSqCghpCWgl4ln4e9qHBWv0H247vXx4lY49h/wf+ftxvg8w8d/x34ROtV4GUVtfUy2+CEESIf5ZQlRTQJZRQM0pwuCpguJtqGpMFRHrnmi6VhVIdF212WZStdPJ6zOcWiIxzttdepJuGScwz0N8sas3OvoVnnc6D+bFt7cSbaMIeC+1MF0vsqtj9DhbB8q2jkbSj4qofPmU0wBH312yvLOY5EGLXg6tCekaOCxS07i+iISFaAqp12ruklmZCUwoVfI9+9IZUcbf2s/I0qePQseR6QUbhp2jCi83VYcD0o78Se49lcFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 710c35c2-bb1b-4f88-f86e-08de9bf29ee1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 19:59:08.4385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXze8kmfIrVr80yi3SjQlLTG4dqAHthdt1zRO4H8CsbOEPgT5miNYPcebZhr4fqAwfUQg+RuaZHj0Fkz6TP8gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9570
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

> On Wed, Apr 15, 2026 at 09:51:19AM -0300, Gustavo Sousa wrote:
>> Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:
>>=20
>> > On Tue, Apr 14, 2026 at 05:33:08PM -0300, Gustavo Sousa wrote:
>> >> Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:
>> >>=20
>> >> > We need to explicitly extract guc logs for failed tests so add hook
>> >> > script which does it after subtest/dynsubtest execution. As copying=
 to
>> >> > attachments takes a lot of time do it only for failing subtests.
>> >> >
>> >> > Adding this hook script to CI will extend execution time much and
>> >> > using allowlist is necessary. Instead of allowlist argument in the
>> >> > runner (previous attempt) now script filters such list on its own a=
nd
>> >> > decides when to move forward and do some post-test actions. Such
>> >> > approach is more flexible but moves decision to script what causes
>> >> > it is more prone buggy.
>> >> >
>> >> > Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@inte=
l.com>
>> >> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> >> > Cc: Ryszard Knop <ryszard.knop@intel.com>
>> >> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
>> >> > ---
>> >> > v2: install hook to datadir/hooks
>> >> > v3: migrate allowlist from runner to script
>> >> > ---
>> >> >  scripts/hooks/guc_copy.allowlist  |  2 ++
>> >> >  scripts/hooks/guc_copy_on_fail.sh | 47 +++++++++++++++++++++++++++=
++++
>> >> >  scripts/meson.build               |  3 ++
>> >> >  3 files changed, 52 insertions(+)
>> >> >  create mode 100644 scripts/hooks/guc_copy.allowlist
>> >> >  create mode 100755 scripts/hooks/guc_copy_on_fail.sh
>> >> >
>> >> > diff --git a/scripts/hooks/guc_copy.allowlist b/scripts/hooks/guc_c=
opy.allowlist
>> >> > new file mode 100644
>> >> > index 0000000000..04cb3f8298
>> >> > --- /dev/null
>> >> > +++ b/scripts/hooks/guc_copy.allowlist
>> >>=20
>> >> Do we want really want the allowlist to be part distributed with IGT?=
 I
>> >> think we should default it to no allowlist and then CI (or whoever is
>> >> using the hook) defines it if that's desired.
>> >
>> > I think we want this allowlist in igt. If there's a test which require=
s
>> > to copy guc logs due to failure developer who will analyze this can
>> > change allowlist without requesting that from CI folks. We already hav=
e
>> > blocklist management in igt source and moving this allowlist managemen=
t
>> > to CI would split this resposibility. I would keep such management in
>> > one place - is igt source code good place for this - I'm not sure, but
>> > at the moment it's there.
>>=20
>> Understood.  Yeah, I guess it is fine to keep CI-managed allowlist in
>> IGT as well, then.
>>=20
>> Since we have CI blocklists in the tests/intel-ci folder, maybe that's
>> where this hook's allowlist should live as well?  Maybe in the future we
>> could move intel-ci to belong to the root of the project, since it would
>> contain more than testlists.
>>=20
>> Now, I don't think executables generated by IGT apply the blocklists
>> automatically, but CI passes the blocklists as argument as part of their
>> workflow, right?
>>=20
>> If that's the case, I think it would make sense for the hook to do the
>> same.  In other words, my suggestion is that we can have a CI-managed
>> allowlist file, but not use it by default -- CI would pass it when using
>> the hook.
>
> I already tried this in v1. But Kamil noticed this would apply same
> allowlist to all hooks what likely is not we want. For example if we
> would have two hook scripts like a.sh and b.sh and a.sh would like
> to execute only for igt@test1@basic, and b.sh to execute on
> igt@test2@enhanced we would have problem how to distinguish which
> line is for which test. It would need to extend allowlist to sth
> like:
>
> a.sh:
> igt@test1@basic
>
> b.sh:
> igt@test2@enhanced
>
> and do more complicated filtering in script than simple grep -q -f.

That's not what I meant; I didn't mean a single allowlist to apply
globally.  I meant something along the lines of either:

  igt_runner --hook "post-dyn-subtest:scripts/hooks/copy_guc_log_on_fail.sh=
 --allow-list path/to/allowlist" ...

or

  IGT_HOOKS_GUC_LOG_ALLOWLIST=3Dpath/to/allowlist igt_runner --hook "post-d=
yn-subtest:scripts/hooks/copy_guc_log_on_fail.sh"

>
> At the moment I don't see really good solution, each of them have
> pros and cons. Current copy_guc_log_on_fail.sh script tries to look
> for allowlist first in IGT_HOOK_ALLOWLIST_DIR. CI may not set this
> variable, so script will exit due to lack of allowlist (I've migrated
> copy_guc_log.allowlist to tests/intel-ci, so it doesn't exist in script
> directory anymore and it just quit. So when CI will decide to enable
> hooks integration they just need to configure IGT_HOOK_ALLOWLIST_DIR
> - they know when tests/intel-ci exists so they can set this env.
>
> Kamil noticed as well instead of using multiple hook scripts we could
> use single hook-wrapper.sh, which in turn would contain all hooks
> we want to execute. Like:
>
> hook-wrapper.sh:
> #!/bin/bash
>
> scripts/hooks/copy_guc_log_on_fail.sh
> scripts/hooks/do_another_hook.sh
> scripts/hooks/and_another_one.sh
> ...
>
> Then CI folks would have less work if we would like to enable
> another hook. Just single:
> --hook 'post-subtest:scripts/hooks/hook-wrapper.sh' \
> --hook 'post-dyn-subtest:scripts/hooks/hook-wrapper.sh'
>
> I like his suggestion, we may do more without burdening CI folks
> - they just integrate hooks once. Of course we need to be careful
> with scripting to not break anything but this applies to enabling
> hooks with or without hook-wrapper.sh
>
> What's your opinion about this?

I think a hook wrapper would be fine if that's what is best for CI.  I
just think it should live in some CI-specific folder
(e.g. tests/intel-ci) instead of a general widely available scripts/
dir.  The decision of what hooks to execute is mainly on the user (CI in
this case).

In that case, the path to the allowlist could even be defined in the
hook wrapper, like in the example below.

tests/intel-ci/hook-wrapper.sh:
#!/bin/bash

SCRIPT_DIR=3D$(dirname "$(realpath "$0")")
IGT_DIR=3D"$SCRIPT_DIR/../.."

guc_log_allowlist=3D"$SCRIPT_DIR/guc_log_allowlist.txt"

$IGT_DIR/scripts/hooks/copy_guc_log_on_fail.sh --allowlist "$guc_log_allowl=
ist"
... # Other hooks

--
Gustavo Sousa
>
> --
> Zbigniew
>
>>=20
>> >
>> >>=20
>> >> > @@ -0,0 +1,2 @@
>> >> > +igt@xe_compute@compute-square
>> >> > +igt@xe_exec_basic@once-basic@ccs0
>> >> > diff --git a/scripts/hooks/guc_copy_on_fail.sh b/scripts/hooks/guc_=
copy_on_fail.sh
>> >> > new file mode 100755
>> >> > index 0000000000..595cf5205e
>> >> > --- /dev/null
>> >> > +++ b/scripts/hooks/guc_copy_on_fail.sh
>> >>=20
>> >> Maybe guc_log_on_fail.sh? I think it is more descriptive than
>> >> guc_copy_*, since the latter is a bit vague about what is being copie=
d.
>> >
>> > I think copy_guc_log_on_fail.sh would describe its intent better.
>>=20
>> Ack.
>>=20
>> >
>> >>=20
>> >> > @@ -0,0 +1,47 @@
>> >> > +#!/bin/bash
>> >> > +
>> >> > +# Hook script for copying guc.log.
>> >> > +# Suggested usage with:
>> >> > +# --hook 'post-subtest:scripts/hooks/guc_copy_on_fail.sh' --hook '=
post-dyn-subtest:scripts/hooks/guc_copy_on_fail.sh'
>> >> > +
>> >> > +# Copy only for failed subtests as this is time-consuming
>> >> > +if [ "${IGT_HOOK_RESULT}" !=3D "FAIL" ]; then
>> >> > +	exit 0
>> >> > +fi
>> >> > +
>> >> > +# Process and copy guc logs only for those specified in allowlist
>> >> > +ALLOWLIST=3D"guc_copy.allowlist"
>> >> > +scriptdir=3D$(dirname $(realpath $0))
>> >>=20
>> >> It is safer to use "$0" above.
>> >
>> > Fix me if I'm wrong but $0 won't contain absolute path if script
>> > was executed using relative path like "./scripts/xyz.sh"
>>=20
>> I mean to use "$0" (rather than $0) as argument of realpath.  Actually,
>> I think the safest would be:
>>=20
>>   scriptdir=3D$(dirname "$(realpath "$0")")
>>=20
>> >
>> >>=20
>> >> > +
>> >> > +if [ -z "$IGT_RUNNER_ATTACHMENTS_DIR" ]; then
>> >> > +	echo "Missing IGT_RUNNER_ATTACHMENTS_DIR env"
>> >> > +	exit 0
>> >> > +fi
>> >>=20
>> >> Well, we could allow the hook user to define the output and default i=
t
>> >> to "$IGT_RUNNER_ATTACHMENTS_DIR/guc_log" if not passed and
>> >> $IGT_RUNNER_ATTACHMENTS_DIR is defined.  Otherwise, we should error o=
ut
>> >> IMO (i.e. exit 1).
>> >
>> > Ok, in case of missing above enviroment exit with -1 makes sense.
>> >
>> >>=20
>> >> As an example, someone could be calling a single test binary directly
>> >> and want to use this hook.
>> >
>> > If standalone test wants to execute hook script which was designed to
>> > use within runner it should be executed with proper envs set apriori
>> > its execution.
>> >
>> > I would like to minimize number of envs passed to scripts from the
>> > runner - IGT_RUNNER_ATTACHMENTS_DIR should be single mandatory
>> > which would point out the script where to write. And single optional
>> > mentioned below - IGT_HOOK_ALLOWLIST_DIR in which script could look
>> > for allowlist. I didn't set it in the runner because I don't know
>> > the allowlist path (this will be know after installing and as DESTDIR=
=3D
>> > might be used we can't say from the runner perspective where it will
>> > be). Assuming script and allowlist will land in same directory (as
>> > currently is set in meson) finding it (dirname/realpath) is possible
>> > within the script regardless it was installed.
>> >
>> >>=20
>> >> We could do some simple argument parsing here or, to make it simpler,
>> >> establish that IGT_HOOKS_GUC_LOG_DEST would be such an input variable
>> >> (and document it in the doc comment at the start of the script).
>> >
>> > Multiplying environment is imo bad idea.
>> >
>>=20
>> I think the hook should be a standalone tool that could be used for
>> either single tests or in the igt_runner environment.  I think we
>> should make it easier for both cases, meaning to have a simple way of
>> the hook user to define the necesary parameters (destination dir and
>> allowlist file) and make it define sensible defaults when it detects
>> it is running in a igt_runner environment.
>>=20
>> If you prefer that the hook should be specific for the igt_runner
>> environment, then I guess it is fine to avoid the extra work I'm
>> suggesting.  We could revisit this in the future if we find users trying
>> to use it with standalone tests.
>>=20
>> >>=20
>> >> > +
>> >> > +cd "$IGT_RUNNER_ATTACHMENTS_DIR"
>> >> > +
>> >> > +# Look for allowlist in following places:
>> >> > +# 1. Try in IGT_HOOK_ALLOWLIST_DIR if this environment exists
>> >> > +# 2. Try in <scriptdir>
>> >> > +
>> >> > +if [ ! -z "$IGT_HOOK_ALLOWLIST_DIR" ]; then
>> >> > +	ALLOWLIST_PATH=3D"${IGT_HOOK_ALLOWLIST_DIR}/${ALLOWLIST}"
>> >> > +else
>> >> > +	ALLOWLIST_PATH=3D"${scriptdir}/${ALLOWLIST}"
>> >> > +fi
>> >>=20
>> >> I would just receive the allowlist path from CLI args or, to make it
>> >> simpler, from an environment like IGT_HOOKS_GUC_LOG_ALLOWLIST; and I
>> >> think we should default to not using any allowlist if none was passed=
.
>> >
>> > That's good idea - if script would receive optional arg which is
>> > filename it may use it. I'll add this to copy guc log script.
>> >
>> >>=20
>> >> > +
>> >> > +if [ ! -e "${ALLOWLIST_PATH}" ]; then
>> >> > +	exit 0
>> >> > +fi
>> >> > +
>> >> > +STNAME=3D"${IGT_HOOK_TEST_FULLNAME}"
>> >> > +echo "${STNAME}" | grep -q -f "${ALLOWLIST_PATH}"
>> >> > +if [ $? -ne 0 ]; then
>> >> > +	exit 0
>> >> > +fi
>> >>=20
>> >> This can simplified with:
>> >>=20
>> >>      if ! echo "$IGT_HOOK_TEST_FULLNAME" | grep -q -f "$ALLOWLIST_PAT=
H"; then
>> >>         exit 0;
>> >>      fi
>> >>=20
>> >> > +
>> >> > +for log in $(find /sys/kernel/debug/dri -iname 'guc_log'); do
>> >>=20
>> >> Suggestion: use $(cd /sys/kernel/debug/dri && find -name guc_log)...
>> >>=20
>> >> > +	attout=3D$(echo ${log:23} | sed -e 's/\//_/g')
>> >>=20
>> >> ...and then here we don't need this line...
>> >>=20
>> >> > +	mkdir -p "${STNAME}"
>> >> > +	cp "$log" "${STNAME}/${attout}"
>> >>=20
>> >> ...and here we can simply do: cp "$log" "$STNAME/${log////_}".
>> >
>> > Will apply above in v4.
>> >
>> >>=20
>> >> One issue with the find command above is that we could potentially
>> >> collect GuC log for other device (not the one under test).  I know th=
at
>> >> IGT supports selecting a device via the environment variable
>> >> IGT_DEVICE.  I wonder if we should make it set an environment for the
>> >> device under test; we could use a different variable name to avoid
>> >> issues with the existing one.
>> >
>> > Good point. Question is - how to pass more than one PCIID in multigpu
>> > scenarios? For single card it is simple, we can set IGT_HOOK_LAST_PCII=
D=3D
>> > for each opened device. I'll take a look to this and share my thoughts=
.
>>=20
>> Ah, interesting.  I wasn't aware of this possibility; so we do have
>> tests that work on multiple devices?
>>=20
>> Yeah, maybe a variable that uses some sort of separator.  I guess this
>> needs a separate discussion and we can keep the hook looking for
>> guc_log files for any available device for now?  We could add a comment
>> noting this behavior.
>>=20
>> --
>> Gustavo Sousa
>>=20
>> >
>> > Thanks for the review.
>> > --
>> > Zbigniew
>> >
>> >>=20
>> >> --
>> >> Gustavo Sousa
>> >>=20
>> >> > +done
>> >> > diff --git a/scripts/meson.build b/scripts/meson.build
>> >> > index 6e64065c5e..2ce961898d 100644
>> >> > --- a/scripts/meson.build
>> >> > +++ b/scripts/meson.build
>> >> > @@ -15,3 +15,6 @@ endif
>> >> >  igt_doc_script =3D find_program('igt_doc.py', required : build_tes=
tplan)
>> >> >  gen_rst_index =3D find_program('gen_rst_index', required : build_s=
phinx)
>> >> >  generate_iga64_codes =3D find_program('generate_iga64_codes')
>> >> > +
>> >> > +install_data('hooks/guc_copy_on_fail.sh', install_dir : datadir / =
'hooks')
>> >> > +install_data('hooks/guc_copy.allowlist', install_dir : datadir / '=
hooks')
>> >> > --=20
>> >> > 2.43.0
