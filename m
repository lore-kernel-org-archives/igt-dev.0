Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5BEC0218A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 19:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C5E10E3BE;
	Tue, 28 Jan 2025 19:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ArZzGK1H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB89210E6F6
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 19:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738092899; x=1769628899;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=YakUpmEKQp1n+uSPcYmSGevOsYuNAktG6eWiM9e5DTk=;
 b=ArZzGK1HSSaxxccdvmxPitknqYwhTV/6aclhAeyxg+nOv62Apfdqz8rn
 vhDgyGtJwRCqL+DI/9HbTLA3dOvB7vngzrBuWHQTfRtZ4ViSrhygA5C0r
 /9bjit+lVl1oLanZezpYROZ2nBCcs8Hjg5Geyn+xzlOvMzq6d2TMVhWMs
 9T7f/KeOVVu1UdwZ4mB9RSr40hkt6KffeFbbqLqIcJkZ+ZgK9XZ79mfPh
 GZMdzKqikl7C3WBJvvBmdt02DgoG9B4RBEHVNMrBHqh6EEbRv9fHNOaPr
 XGf6lm5lLXqRMJGdii9rdP2WJA2GCfN6StYe+Oy1a1YLLccqgF1K6gBpe w==;
X-CSE-ConnectionGUID: xqj2OL8JQRWjG0rt6yhIBA==
X-CSE-MsgGUID: k29SJ3FNQSqPRSvetqnYNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="63950498"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="63950498"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 11:34:59 -0800
X-CSE-ConnectionGUID: yi1/kkEwSfmhF+NntqQ8yQ==
X-CSE-MsgGUID: vDTbtux3SZ2nu5h5G3CH7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="109357727"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 11:34:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 11:34:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 11:34:58 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 11:34:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCSZOTRy/ZS8inZqdtxY0MrW6E2oblc0nVM35R0Gv7TAgWO9OwZGU5YmY5V4Xu1606PhY9GoKUa6d/5NWVQwYYHUD3yY7YNWS9L4KKaWbAxjvXBXjKmW0DbyLz580tVfMQEOuRKRsLy6SSkrsrbT5pQF99Q1uVs23zTWCu6Sb+ccG1qh1tlhHtPvlGo6mF2qy/nJY0/dDRROfwrqUs53/JNdoE4XmqULMLfVt66MlcqksNwyMvM7g4TFRfxyQXjQPXWh1j79PxbAnpKXg6/YIuL0B4WWyAk0pQVaOOE8PiHeTfymZ1m+0W7DxR9xZp5aZRIcV343Og1ysVrOs2spWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJaJ03RmHahY5AnGo4bX41bBcbIREt1qPB/PTsQlptM=;
 b=BwdwQerrL0jmRKYIrfuClUzLE7GmMWfnny/jeinh/bEYNnyjwj8+c0BnW2a4k8K6o/OLXJi4Zl38/hO9ZoDw6u/QxxfjcCMpMPQns4NHAk9P+gJ0qzRnycnqMxOekkryqpkyv4iFE8HfEUQW8Ob3D9XTJzmlhJzdYJdNwRQaqfnKeLJa9reQhBoXebVvfGtfv6P+o3PVpZ0IZ97zh+zREyjscLusPEkb6LVu5YqZ8pBypo/96V+AtUSH2u3GYEEg1eWXC1QarfzVm6zFV1Vkn2pIyHxnPwrgMK6cq+D7HKu6y/npVfb7MZ8b+TYkZDtwjnp+6ii8uM0Spz+ed771kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Tue, 28 Jan
 2025 19:34:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 19:34:29 +0000
Date: Tue, 28 Jan 2025 13:34:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
Message-ID: <wfzokcb257qutd6324fku62dkdxkm552xtcftue7m2zaxdryuz@e5sdrclgnjxr>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-7-lucas.demarchi@intel.com>
 <20250128183744.zegxv5uougqwvc4a@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250128183744.zegxv5uougqwvc4a@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: MW4PR04CA0258.namprd04.prod.outlook.com
 (2603:10b6:303:88::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 2616d36b-1d5e-4384-0334-08dd3fd2c81d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AQiCSTUffpF+RTFx1+mqrDferzREjrMEKy7HNSMX/tDUfwn4cOFoRZQA4Qs2?=
 =?us-ascii?Q?6/RiEqJccLjI34XVpn5wrZzejUEpwWWUPpmLFw87YXLsfa9yJaUx5ewrCYsV?=
 =?us-ascii?Q?Wq7TGnPxLwp/yhD18nhQ7Ej2ulRf7kPzUl12Pv0c//JiyNGcKFmPdxVPk2LM?=
 =?us-ascii?Q?f89DAsEsSmmLKE2yA++74beA3GuKoFwwMLScGuCyJ6oYDWT2QkSR2vjPzycE?=
 =?us-ascii?Q?1ddu3Q7ywavFItokh4GFBvHSIbqYE2urFvijN6vSMvqeyDvIxm0N7r0Wawt2?=
 =?us-ascii?Q?esJOrybWB2kMRV+Zx6J6LibVzAkPgYREJy4QeY3vs0t+m2ZzAU0Z3SFHrMDv?=
 =?us-ascii?Q?dO+lMsxz89evmul/g/RPk7qOiJmQUNS0Io9BWpEPu9fwz8Sa/BhB5ZMdZE6/?=
 =?us-ascii?Q?6NqZE/0NGUR9uk6rVr8XPk3+thC1gUjSiBt+c/tyn8YJj73+dCauTtQh0rOl?=
 =?us-ascii?Q?XiDefU09wRGDuYfKtv+uVZiilUismpfC2H8YNNG70Afe1movjSoSmIxdwcHF?=
 =?us-ascii?Q?/pMb+HvXa6NwmPDqqSQ9rmNYc8Yxh24VRqv+mlOvpTTduxup+8ZUH6hL5dIe?=
 =?us-ascii?Q?BBCadjuaYuKQ0iQggJyAdkw4YWO0WUxSC2NtF6mZv6JzReYbXYcgRxjPiiKN?=
 =?us-ascii?Q?BgxWMoeRhSUrmdOA77HY1U+UNBr4qN5AYDFf53kiatTV6PBN66m16yf0yWiA?=
 =?us-ascii?Q?YRsq+Yo8nR1sfVuObMWm+pASAtDlacIGJym+BH3nOwoYoWo8KV2E62493+qh?=
 =?us-ascii?Q?tQekHH8EsYhCSKfaYZHoAAZyknQUcRA2nYjGcqiw9uQYjzfpPb6hPbDWlMe3?=
 =?us-ascii?Q?nzCoIptLqYB2iHDVurT61CKlz4LhA2HfM3oVrVWn53vZsmAYhXewRKkBpUg+?=
 =?us-ascii?Q?Yy/ImL0EDPfo0f7En+AzPEeNRMvRR3xX4BxvlPVacTIy/7sGyV3xFDp6fo0I?=
 =?us-ascii?Q?xhEbW1KXbGfMPstZR+bpk6KgKnYMEjk0VFXDyNe9kJz8b5kADtwUBwCwnyj0?=
 =?us-ascii?Q?SCJqtLkBwXtJ4gp2xIbXbX+H4DXZvgsQfoVgnYms64+I/sTYKD1qcXAcA5f/?=
 =?us-ascii?Q?tpRQlzo+7lIA6ikmg+3Z3XdSU9uRPHQRY3tzPpSauFZj+J7ypqpdye0dthT7?=
 =?us-ascii?Q?U/LbTGZ+0n5F89UlXBTDqUUQkdx9A4n5Ru8WE8AnhUJLRIt9zZt6QEw5jG7i?=
 =?us-ascii?Q?JFG/Q5c/ic50JuPZU0kMMQIB0HnZELbsV5JNm4W7fiuUqpKddql/86CwXgjF?=
 =?us-ascii?Q?jI9ZVDhHaCW54sLhuS7LLBPfAxAzUizbNzYJKAMy1UqhETJKsdjFb0aKfcoj?=
 =?us-ascii?Q?AldWfXmrB/X0nwzKj5t734drf55p5EnBb84n3u+T7Cu8b66ZQ2/49FW10R4j?=
 =?us-ascii?Q?aBDIPKIjLwqDIRYci93y9IRt4AYK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nLYEHwv1tIalVGbwd4AdrvJd2uBOeOwbymd33nK50m7+P/PugkNkiv1kzajM?=
 =?us-ascii?Q?/4xWKUAXS1bBg6jb9fTtbJoHHbT0jzNPnYvKjv4Cpwtz8QhNywOh0T8SfN31?=
 =?us-ascii?Q?fjBF2E5a7ys+vTAHm02aTYOdbhwOiLRrco0QZiQZoqr9Tonx4yJUDO6haHoc?=
 =?us-ascii?Q?pCMbA7EDsZ+Xp36Ik7f4NaqsT7ku0ZJ/7DCPTwlo6wh1urQaBh2aV5OOWWdM?=
 =?us-ascii?Q?JvJrtEZ/7xtFcJldD9UQr4J5X7FDTrnJDgtqSYtoqXEAmmlz+9cEgpY0OYzk?=
 =?us-ascii?Q?I2mhAZR7r6Z2q7suVv5jPjcUwtJjRSajJxqoLLBzYY0kURKg6xAwH4kZ68Pq?=
 =?us-ascii?Q?JCCl0ohTz5PZsdEmr8LO0MAp/P0UXKWwCaaJN+6yE9cG5ilaGZn8+qs5pfE/?=
 =?us-ascii?Q?fKRzxNnsMmXlLITW96niJRA/pNk8UqYdVX/IRifJTJMpFjt1okvL7tgm0/wC?=
 =?us-ascii?Q?mZ+xxWFYsNcooD/0RUW6ggvNYO3oBTm11lupCK0GEEFLRQsIntM8nDJk6Rk2?=
 =?us-ascii?Q?GLmogt3Z9lRsGTStAZrE+T51qdJk8S8PGeIdfiekfJ5YAaD1SXjj0BoNLCUF?=
 =?us-ascii?Q?7IE0K90mhYJ67fNMI+2Hz+ZN9Zb+J2gY+VY7TW3/EZEpWuzc6sFkrPF5yY+s?=
 =?us-ascii?Q?P8W7EpkZ6qMtcZDeECdnVoNTAyksz65Hg1QeJuXFQjCJLNU22gs2HPXfqLX3?=
 =?us-ascii?Q?GrNBBwHl2gUgIH0gx0bCVUu6VDI1v93N6FjKqfXQ4NEgdav8eptE0q6xvv9F?=
 =?us-ascii?Q?JfWtSQ/aJ2ywd7SbqMdhyqxOyWvb7d2Ywfg391ifay50zeYZLyaHRYJeEbgH?=
 =?us-ascii?Q?w5RzpnZKbWf5xooeE/eoqhBjaj0dkL/mTEMIdimNp0mb47zK2gIu45xN/Pbs?=
 =?us-ascii?Q?P0aduK6+CSaN/TVpcoPUJMkZvIwUFtfVQ62R2Tf/SqUuBu123EZCaFihw+BG?=
 =?us-ascii?Q?S/RTEuB38rg5II4cScgi5aHL7sobPhJ/s/H//FXhky9DqyG01X06qXElqXUq?=
 =?us-ascii?Q?uuWvD7xcuX4LSAMrqdwCv6vkEThNa6tb+hYRotRcxcSSqkO0iEW6AAHQvVRN?=
 =?us-ascii?Q?T/3+f8vXp8+BxxesJzcvJBBe1LlYiS2d89XYdqiLk66+QHRHRIuhHySE3ozR?=
 =?us-ascii?Q?guQenSxskXf73rZcjdrZxpuM3Dq1isVRh4vLcysQ6GcpSrDYN8KHfmanGICM?=
 =?us-ascii?Q?Wj32cUF+O/a2J0Bq3/LjfaVEfG6b1M9HT+F7Hc7dQM8NRYyPfWzcHDL1isJ3?=
 =?us-ascii?Q?7CKYLSjXEzKPT8gc82+IDf7vzPphtUsz+BeyIDfQHGqHwH+N0lU2iUGWFhFM?=
 =?us-ascii?Q?CwKt+Ujn+WAzLa/JWDMp4RdLeN2BBmz8CTO6hxFsRcxcXPi53qdwpwwssQQF?=
 =?us-ascii?Q?ApDg1zOvcRxrDYpM7mQThRWD8ieK1t0x/GOc5USk1m9iFPqxJyUXxhEQ8mpZ?=
 =?us-ascii?Q?qsHeKjhDwe1W3EaZOnr35D64AXnKVAhsZGxIQltrabMV7PJOGqEsgKrYe2Fc?=
 =?us-ascii?Q?OpSTuOcQqCHpsHIrkJ1qE0LUB5hoidNvxVbVDzC0GdTlekfrloAwmYQy/9PU?=
 =?us-ascii?Q?hsP6jdyMVqQuok1OqxMffJ9jBp7LPcSmdCP0Pp0OOHKXk3no3jLw1SrAO0bL?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2616d36b-1d5e-4384-0334-08dd3fd2c81d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 19:34:29.1317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ceY5GKzWkIwh/Mjm9Hbn/LYrDDC7ymYr6S8h6sbzQejOZ8o9gM0o4kTdveIMTsJD3h9iv3l9cY+pV+RaKXDEbylyF6h8hAEVfzGG+JQHvw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

On Tue, Jan 28, 2025 at 07:37:44PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2025-01-21 at 14:57:32 -0800, Lucas De Marchi wrote:
>> Serialize the command line to metadata.txt. The expected format in the
>> metadata.txt is like below:
>>
>> 	cmdline.argc : 6
>> 	cmdline.argv[0] : ./build/runner/igt_runner
>> 	cmdline.argv[1] : -o
>
>Sorry for late reponse but imho it should be saved for debugging
>purpose but not for reading this in metadata.txt, especially that
>this option '-o' is 'override existing results folder', so it
>should be used only once by igt_runner in setup phase but not for
>igt_resume.
>
>From igt_runner --help:
>-o, --overwrite       If the results-path already exists, delete it

if you are using -o it's just because you don't care about the previous
results and want to completely overwrite it.

igt_resume doesn't have any option - it doesn't have a -o and it
basically does:

"Load the settings from the state dir back into the settings struct"...
igt_resume will read it back and create the settings object.

The results.json as architected in igt_runner discards everything and
is basically a conversion format from the state dir to a .json file at
the end of the execution.

>
>imho we should save it into some different file and include it into
>results.json

not sure I follow... metadata.txt has the details of how we are running
igt_runner and it's basically a dump of the settings object. I don't
follow what's the relation with the -o option you mentioned above.

End goal is to have the value in the results.json, but I see no reason
why the intermediary state needs to be in a different file.

Lucas De Marchi

>
>Also +Cc Petri
>Cc: Petri Latvala <adrinael@adrinael.net>
>
>Regards,
>Kamil
>
>> 	cmdline.argv[2] : --test-list
>> 	cmdline.argv[3] : /tmp/testlist.txt
>> 	cmdline.argv[4] : build/tests/
>> 	cmdline.argv[5] : /tmp/results
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  runner/settings.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>  runner/settings.h |  5 +++++
>>  2 files changed, 47 insertions(+)
>>
>> diff --git a/runner/settings.c b/runner/settings.c
>> index 2787869ee..ed1afc205 100644
>> --- a/runner/settings.c
>> +++ b/runner/settings.c
>> @@ -529,6 +529,18 @@ static void free_hook_strs(struct igt_vec *hook_strs)
>>  	igt_vec_fini(hook_strs);
>>  }
>>
>> +static void free_cmdline(struct settings *settings)
>> +{
>> +	if (!settings->cmdline.allocated)
>> +		return;
>> +
>> +	for (size_t i = 0; i < settings->cmdline.argc; i++)
>> +		free(settings->cmdline.argv[i]);
>> +
>> +	free(settings->cmdline.argv);
>> +}
>> +
>> +
>>  static bool file_exists_at(int dirfd, const char *filename)
>>  {
>>  	return faccessat(dirfd, filename, F_OK, 0) == 0;
>> @@ -646,6 +658,7 @@ void clear_settings(struct settings *settings)
>>  	free_regexes(&settings->exclude_regexes);
>>  	free_env_vars(&settings->env_vars);
>>  	free_hook_strs(&settings->hook_strs);
>> +	free_cmdline(settings);
>>
>>  	init_settings(settings);
>>  }
>> @@ -875,6 +888,8 @@ bool parse_options(int argc, char **argv,
>>  		goto error;
>>  	}
>>
>> +	settings->cmdline.argc = argc;
>> +	settings->cmdline.argv = argv;
>>
>>  	return true;
>>
>> @@ -1055,6 +1070,7 @@ static bool serialize_hook_strs(struct settings *settings, int dirfd)
>>  bool serialize_settings(struct settings *settings)
>>  {
>>  #define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n", #name, s->name)
>> +#define SERIALIZE_ARRAY_ITEM(f, s, name, _i, format) fprintf(f, "%s[%d] : " format "\n", #name, _i, s->name[_i])
>>
>>  	FILE *f;
>>  	int dirfd, covfd;
>> @@ -1123,6 +1139,10 @@ bool serialize_settings(struct settings *settings)
>>  	SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
>>  	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
>>
>> +	SERIALIZE_LINE(f, settings, cmdline.argc, "%d");
>> +	for (int i = 0; i < settings->cmdline.argc; i++)
>> +		SERIALIZE_ARRAY_ITEM(f, settings, cmdline.argv, i, "%s");
>> +
>>  	if (settings->sync) {
>>  		fflush(f);
>>  		fsync(fileno(f));
>> @@ -1177,9 +1197,21 @@ static char *parse_str(char **pval)
>>  		s->field = _f(&val);		\
>>  		goto cleanup;			\
>>  	}
>> +#define PARSE_LINE_ARRAY(s, name, val, field, _f, _max)		\
>> +	do {							\
>> +		int idx;					\
>> +		if (sscanf(name, #field "[%u]", &idx) == 1 &&	\
>> +		    idx < s->_max) {				\
>> +			s->field[idx] = _f(&val);		\
>> +			goto cleanup;				\
>> +		}						\
>> +	} while (0)
>> +
>>  #define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, val, field, parse_int)
>>  #define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, val, field, parse_ul)
>>  #define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, val, field, parse_str)
>> +#define PARSE_ARRAY_STR(s, name, val, field, _max) \
>> +	PARSE_LINE_ARRAY(s, name, val, field, parse_str, _max)
>>
>>  bool read_settings_from_file(struct settings *settings, FILE *f)
>>  {
>> @@ -1211,6 +1243,15 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
>>  		PARSE_INT(settings, name, val, enable_code_coverage);
>>  		PARSE_INT(settings, name, val, cov_results_per_test);
>>  		PARSE_STR(settings, name, val, code_coverage_script);
>> +		PARSE_INT(settings, name, val, cmdline.argc);
>> +
>> +		if (settings->cmdline.argc && !settings->cmdline.argv) {
>> +			settings->cmdline.allocated = true;
>> +			settings->cmdline.argv = calloc(settings->cmdline.argc,
>> +							sizeof(*settings->cmdline.argv));
>> +		}
>> +
>> +		PARSE_ARRAY_STR(settings, name, val, cmdline.argv, cmdline.argc);
>>
>>  		printf("Warning: Unknown field in settings file: %s = %s\n",
>>  		       name, val);
>> @@ -1234,6 +1275,7 @@ cleanup:
>>  	return true;
>>  }
>>  #undef PARSE_LINE
>> +#undef PARSE_LINE_ARRAY
>>
>>  /**
>>   * read_env_vars_from_file() - load env vars from a file
>> diff --git a/runner/settings.h b/runner/settings.h
>> index f69f09778..d563a0d16 100644
>> --- a/runner/settings.h
>> +++ b/runner/settings.h
>> @@ -75,6 +75,11 @@ struct settings {
>>  	char *code_coverage_script;
>>  	bool enable_code_coverage;
>>  	bool cov_results_per_test;
>> +	struct {
>> +		bool allocated;
>> +		int argc;
>> +		char **argv;
>> +	} cmdline;
>>  };
>>
>>  /**
>> --
>> 2.48.0
>>
