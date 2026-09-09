Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1868C79FAA
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 07:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872EA10EF9C;
	Wed,  9 Sep 2026 07:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYJVJzV4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C426C10EF91
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 07:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788940578; x=1820476578;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TkFc1fKaAAocKR7XeUnU9BXpnM62zx2poKbys4XS7/g=;
 b=KYJVJzV43RD8sLMK0AFi2aIAula07ABHjAK7CPCAgoeWVcqyT1ExJhGt
 ZLZZYgJaBOI1Tf5B3BoDIYL+0kv4CN8xZJxbCsnAnHZtocWnK/zthvTqZ
 KqOTfqablDSKJ86noGjmx+YuHwB061lTQcSiYX1ZXl0ko2vIArJk+BUkd
 J6raYXxUZAcItGbngfhTG96LANUMaXKO3pA+s5CL/MM0cOe6t1yMJmNb/
 pAm8Rqp2p+y/qC6kDcWdpgBdzHmA9qD2OsDzNJddFTlOqTWqRnO2lBm5D
 hqfK6F8MMtZGkbICaHwqCGaIU0i8LNXXvC3goCvBXAuKOvns03uUjc62i A==;
X-CSE-ConnectionGUID: 0bWCHuglR2ya0MUQweOPmg==
X-CSE-MsgGUID: Cd5v3SBHQC6PIg72nBcjwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88505632"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="88505632"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:56:17 -0700
X-CSE-ConnectionGUID: 6fTEf7pyTwS43EAZDpTHFQ==
X-CSE-MsgGUID: FUyMzl9MSo6nGVMr1+kdeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="269901523"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:56:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 00:56:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 00:56:16 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 00:56:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBwC2uhYISGDLRF3HnIWjCv+Eo/M+M4vmh4oOmDiAgQH1XWDuzavA4YJrLCxO4L4RTMPVCbuW4Mfyu4Z0M5cQBgkq1w+dOnku+mVJQlqgajAmAUOySh+64JhwzkuQzmNPEOtjWa5yAjhukGh7kZQG/0vGcG1viwcXiTvc9korqFtFGCdCGF9ylKTMsqbh6IB2Y5JeKNKS0cb4LPpwKmiBlqJW8Pe6zFoRam2KlLVBQJ9NLL7wOIYYKTUijtliqNKfKwV92tl2yiYk1+acP2yF+VVfFTuir7lzyXyj9TKsFzNYPTj8wlGJSyNZNsooR5HXO//VU6R89jPiY+OGzefVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBRzJYpeD6sMs+hrcOv+WXq25M/wzGZlYdwvQNHhJxk=;
 b=ZW89lRu5vrQsml8jkmaQhHxOLmsu7LEq9v4W3VbaUhk1G3WFF3kDPuxQpaXMTVRkHxaq/9UJjlce76TUJFYXBEDJvXp5IVPQnOxKGIOd5lUlPJUmjC4IBUI0Vk/3WrT76XnTnQkHVqMcU24lRfovGJzAMWmiwW830Deu+XWRJM0PXoV75fz/9JFSkNtlbgxsSpPHyj5EHo4Kc66nN3Rb93YgWc1eq2nVOimYBbh7JWRJjtu+kZTVECQLGlZE3q5inTlyq4mPXzEOJnI/TunTPfPL/7fAzV+4JhvT76gJZUwAB9SZxWttIXucQBEydaZBedlM4T++ufz5foL/xxXajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 07:56:13 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 07:56:13 +0000
Message-ID: <6c75d0eb-462b-45dc-a4e1-f151357a3858@intel.com>
Date: Wed, 9 Sep 2026 13:26:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 7/8] tests/intel/kms_color_pipeline: move
 driver-specific test to intel's folder
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kernel-dev@igalia.com>, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, John Harrison
 <John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser
 <contact@emersion.fr>, Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland
 <harry.wentland@amd.com>, Uma Shankar <uma.shankar@intel.com>
References: <20260902180016.303482-1-mwen@igalia.com>
 <20260902180016.303482-8-mwen@igalia.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260902180016.303482-8-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0242.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::16) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 63399e35-e538-4ab4-e31e-08df0e47d1a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|7416014|376014|1800799024|366016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qH3RoOfY2yxiYtJV2HaL/oaGywaVRqLt+SU7xAbOKZ/h6GtERaeZ8giFVLXChtn9J4ijt9VE+wHrfkTr4LwGLhalDqjCb8he1gDQoRAogBYvRsbNTyy9pL1bHIyRbEwqR8JvR7H/A8LH6lmm5SjISwNoyn4QM1eOVAQN1EuNhLaxsdyoqnx+C6WT+cuPztigFd0+JNT/3SV6sL9DY+gccxWK5KEbS0pCdpcCwxRuAAZdpQBSwB5aIxRX16ePpbSj7/o9CS2Fp1mkVcI2N4nTpJtfLh07f3P+w8EgZ18l3AdWbfYajoRMVTeclT6Gll/VCL4E7TOfhIb07Rh8XOD6mFzjedcvG9rFH0VzbxeitbO5xe1sLnup+RAB7NmyplUfU/QpNULI2jnIHKFBnZT68P8SslLg8aezhNYR6KpmgX3zMkY/TRUjWGjNLJ7PmTUpVfIPvk1aScnp+mDdwoGbEEKB+KgCQhpxhGxk6ZaXclj063ZFy654AeBoyK7oSlj3u4IhQcGcq6vOEr0mJwnimpck+F1iqqOFu3q/AtzXnYebBgvNAtuATp+vpXis259SoprKpGXoSy3Uk1e/MolTMlnu13GTaqbb1Q4TjvkYXCiRW3fwIu8KhMC0GrKOSCLbkJ/6uG8nt9uw2H4GsP2qKKoXnlAkeIEyUq2iw2s+NhE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2IzTkI1Yjd0WURuK1gyT1ZNR0QzTVhzdHVhbnNYWVhxL25VU0N4SDh5SkZF?=
 =?utf-8?B?VGhRUE1BeVpXc05kc3N0bDBEQjJodlhoZVpSUTkwN1pZM2dKSHhNVlhwdy8w?=
 =?utf-8?B?T2hLOXhEcVJFTGNuUlVUejZ1VGxsajZUandTcEQ2UGd1a0g4MTZMU1Jwa2xW?=
 =?utf-8?B?M2FGZGd6K3EvaFFkMUk2MkZPS1h3OWcvdEwwNWY0UHl2ajk5bUVuTG1qayt1?=
 =?utf-8?B?MHVkTzlNUlpFVzBGck9icDNGVmQ4L290QWU5TkdzT2t6a0djUDR6YnRFNDRD?=
 =?utf-8?B?TE1KM1YzZ3hyQzRaNzRNRGFJU3BOTHMwQUZmUFM3MjJ4MGdiRERyRWdtVEJK?=
 =?utf-8?B?eENGalljN1RXYWEreTdTRGltdy9FbDhuNEU0T0lHb0pQcE83REwxVTh0d1ZV?=
 =?utf-8?B?am5VVnEvNW9sbnBkQ3piRHBOUGE0VmFxNHBMYUNzbjNqZDhPaWUzd2VkY2xB?=
 =?utf-8?B?SUEwakt3SG9RZWJ0NGIxZDByM20vU0VyemtvZncxcGk2aU1kTFNzYlJpVHor?=
 =?utf-8?B?RW1pTTVDZWUveEYvampBVXhlNEw1Qk1QWEZzbmhZL2dORXBlTVhXeTB2K2w0?=
 =?utf-8?B?YU5WRVNubmlVN3lZbWxKZ2VsUTNhd1RLWkdMemNXRUY5SzFRbnB6cnBqTEJY?=
 =?utf-8?B?WncyR0ZEODF2Q2EyejRXbVlxWHdhaDQ4VnJDdE5UQWtWVVptOFBTeW1EQ002?=
 =?utf-8?B?RDVGNWNwRzcvaFVvMS9Obk10eENGSWlSNmYzaFV5VWVaWUZUOEg3VWxWUHBO?=
 =?utf-8?B?UERiaWF5MGY5WnNGeitCQnhRRTdhNi8yRllPNU9QMTh3L0d5Q0xOSUhmMGNY?=
 =?utf-8?B?TDg0Y2dBTU1yZ0U1RFFzUG9DbHpjaGpHWFZPd29YWW8xbkwxbEY0YlNadGRE?=
 =?utf-8?B?aXlYYktwL3h6b000OU1KRGR1QmRKbWZNZzFHV0RtNFdNSVVweG05V3JUdk5H?=
 =?utf-8?B?cVZyL05GQ2pKYTZYcVNWdTF0ZzE3ZFVGU1l6OHhaYU1qanVvUzk0VUFWbWVM?=
 =?utf-8?B?MU5lc3duOEtEM3VnL3FWTkZjeVQzRm5nV3VzVGxXU095TjJmdmdtWEhzMmY4?=
 =?utf-8?B?TkxYUTdGN25DV0R2dmN5VjcwOUZXTGZwOGtPZjZ1ZzJCNFFSWWRPdjdHSEZ4?=
 =?utf-8?B?SWtCWlVXT1JGSEF5MVJsV1VHbGRaQ0poeHJ2dG13Y0tldjFENHNJWTNZL2dW?=
 =?utf-8?B?VHpFOXlsSis1VUJlVThBUjUxeWhLRGFKYmdDczRrYTJPUldjY2hEbXlUeHNn?=
 =?utf-8?B?ZjdYQmlCYXVvOXd2dUtEbjF2L0dpV2NqQmY4TXNabmhmUm9lbkZUQzVPd2hI?=
 =?utf-8?B?Rnd1MkpaellZeXlvWTdZK2YvMU9BVHZWeVN5NHhmQ0RlNnZuMi9tdkdzb2sz?=
 =?utf-8?B?eTh2a1k2SG14dmRQeS90aFc0UHpSLzBHMjZtdWM1N3gvZXZtYVl1Q1ZSVjd2?=
 =?utf-8?B?TG9MaG5xaTNyTzRiMnVLYjhGY3pyV1k3MFZubjdEMXpORHo0aUpUbkpHYXhN?=
 =?utf-8?B?Y1JmT0R6NWVCN0xCcGtrSGhIOHpqZ2FDb0YyZE82Tm85bEJwcGpZK3VxYmRR?=
 =?utf-8?B?TStnVVNwV2cwNnhNWDEwVmlpZCtKejA3ZmVQMVhjbnBzR3lDTERmL3RFN0lY?=
 =?utf-8?B?Y2VMcUNMaSs5djg2anl5bjVZdXR5RFlJcWt0RmFWWTdWdWNLQjRMMUV1dXZZ?=
 =?utf-8?B?N0lYUStUR0FHQTYrb0tMVmJkeHJ3OTBkSnRNdGR2QTBvdmhrazBxdHE1Q3lC?=
 =?utf-8?B?SjYwc1ViQi9XcGVzc1VPYzNEUDlrMUhNb1IvUmNuUTRQVmpteitzOEN2a0dy?=
 =?utf-8?B?SDh3OHpwbkg1aEtIWWE5TGxWaW5qU3czQUt5aC9obmhVb3RUSW5qQ3NneW8z?=
 =?utf-8?B?a1BKK3RqRkhBTG1vcmZQaCtOT3hJRlJpTzdtSHNHM0NtVFRKcGFwc255TmU5?=
 =?utf-8?B?SUFzKzcwdUFQRHdWckJNWHdtMWhTdlJBSnRHVHE4Q2drTml1bXcxYmpwOWha?=
 =?utf-8?B?NWVjYWU5TEZvOVhZSkRUSjRKdnNrYjA5eE5WSWJONXdpK2w5aEUwRjhYdUhS?=
 =?utf-8?B?L1ZHc29GOGpudEkxZTFvd2hrNXRWS0dJOXNxUmppYUxWU1NPK2kyVTFvYjZS?=
 =?utf-8?B?cU9DNDdPNlVHUCtjdzhsSG9vUTd5eUxlRDE2SFIwVlVvZm1rNldmcnZVY2Y1?=
 =?utf-8?B?allnNFJ3WndYOHk1aUo5cytFRkxSdzFxM0l5Nmh4OUliTitkQUhYWmNzQjF5?=
 =?utf-8?B?WWMrWkVGb1FQeVBsRUhWY2JLaVg4Ky9RbnFRSkYrTmxpOWxiNjBCWWdCYjF6?=
 =?utf-8?B?NU1iOVhOOWNtK1ZoU0Z1WkJ2SDFSdDRnaDF2Q292K0xjdjdiZDNPYzFoczFC?=
 =?utf-8?Q?rJzVPC20bqcoKtdU=3D?=
X-Exchange-RoutingPolicyChecked: F08WoBucdJkTRV6rIkEV96rtpatWZGHQqoD5AOvahz3oF0ppJf8SOXvoWzpmEYKlJDSF48EztxgrRH0FPGDHjfaDLuyU8VbFILN7ZOZ4PwRTvhLj8RX2Qmyx0cEkeagJSPvyNj9NEy5evWpkFq83E4RenNf9xTOIRAkABSBywC8ueOOJGUKPgIJ1D97sdK8LfCs7dnyOxD0GKeaVkxIf0baqB9MIGfYiN8OpsYJhLbz1Z4qTZYMPgg/GM+FJJXGE8kjZzh3CWc20YmW348aWhCoeBEIzcGzENdQXvN1YB2npovYSX1YbxIkRe0tiMg7eUNbliardHXV4rBryAFwZoQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63399e35-e538-4ab4-e31e-08df0e47d1a0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:56:13.5151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SdvoD78v2sPnR0J8/WtNdW7w8Mk55MiDBFDwpE3zVsxRtQgd8WvlB81GvcvDOs+ynbWqwbI7gwuuJ9561NKYljkEeNrApaWBmM9sh+wtC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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



On 9/2/2026 11:28 PM, Melissa Wen wrote:
> As stated in test docs, the kms_color_pipeline isn't driver-agnostic. It
> validates color transformations using CRC, which is less accurate than
> comparing writeback buffers, but the i915 and xe drivers require CRC
> validation when the writeback connector is not supported: kms_colorop
> tests don't run when writeback is not supported. Since other drivers
> that support colorops also support writeback, this CRC option is
> currently only required by Intel; therefore, move kms_color_pipeline
> test to the Intel folder and only open Intel's drivers (not any).
> 
> If the CRC-based colorop test is useful for some other driver, the
> required generalizations and switch to the common folder should be made.
> 

LGTM

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   tests/{ => intel}/kms_color_pipeline.c | 2 +-
>   tests/meson.build                      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename tests/{ => intel}/kms_color_pipeline.c (99%)
> 
> diff --git a/tests/kms_color_pipeline.c b/tests/intel/kms_color_pipeline.c
> similarity index 99%
> rename from tests/kms_color_pipeline.c
> rename to tests/intel/kms_color_pipeline.c
> index f71416ce1..3d41b811b 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/intel/kms_color_pipeline.c
> @@ -353,7 +353,7 @@ int igt_main()
>   	data_t data = {};
>   
>   	igt_fixture() {
> -		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   
>   		/*
>   		 * Plane color pipeline support requires atomic modesetting.
> diff --git a/tests/meson.build b/tests/meson.build
> index 1ac89bab7..c1a436420 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -25,7 +25,6 @@ test_progs = [
>   	'kms_atomic_transition',
>   	'kms_bw',
>   	'kms_color',
> -	'kms_color_pipeline',
>   	'kms_concurrent',
>   	'kms_colorop',
>   	'kms_content_protection',
> @@ -250,6 +249,7 @@ intel_kms_progs = [
>   	'kms_busy',
>   	'kms_ccs',
>   	'kms_cdclk',
> +	'kms_color_pipeline',
>   	'kms_dirtyfb',
>   	'kms_dp_link_training',
>           'kms_dp_linktrain_fallback',

