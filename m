Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBC3F428E0
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 20:31:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584BA10E1C5;
	Wed, 15 Apr 2026 20:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PE9G7vUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB7510E1C5
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 20:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776285102; x=1807821102;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=pB16jGV/s3jiX9+HifjR+9ERh+Q6W6SA8KpTQSidKn8=;
 b=PE9G7vUeuFbyMRhuEsLYuEDu78zDX4TuOnjDLE5FMHP3A7AN8TZxdKSv
 8Mi8SxAUlx7ZMd65gdWhid+OwevKCcHwAfNTaYhIVfo22eBLJ0U4i1lms
 SRbmlCbA0esQvi61QoQNsqDzHHCNSTUkHAXzyRonWSO6ibdzEa+BBHZRh
 4xCyw6f95u9BHJShLVKox0ptG7yTG+6qgd7p2JLsqwqn0YzScyHozeTvV
 AFPsx357NKbEUWYnWw4E86zXiCEwdEQ2XP3VIbWKwO6Qwxic3/3xQfwsv
 IV86kqWEL6bcok7tzokL4pzWP7QtHpneYUHHEi5cIMyQm85eVYsn3GXU8 g==;
X-CSE-ConnectionGUID: LUiRboBoRWeTgzGk5d9LxQ==
X-CSE-MsgGUID: Nn/RCumsTO2KvhqT076gjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88656752"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88656752"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 13:31:42 -0700
X-CSE-ConnectionGUID: F2AAsPGORI2SmuLMJ9UuaA==
X-CSE-MsgGUID: EcPojgBkR+eQHni5DNAnQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="253778058"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 13:31:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 13:31:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 13:31:41 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 13:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEbxWqVrHiH0LxwvG1/ohp7bJQ40siXxgmfIopdHqDSq3GjK0bMUKl5LF+qTz0eDhvYREYGeSLGTPAaj59IfeQkK2yHrfiycKHDWxIv/dXOE6NKjZ0fdZyRHV/LvwX/hYLOFXZusy2baVuHHGUBbi5I2u9jgkukL+mMDrlh0tQBXIKXuBlHm7tw8k+haE8h72DiYAZiSumbXBmC8iIYOHMC933h7K1OCzwX5s2gQQDaTDgkwG9i66XsfSfrhE7QB0TQg6DHxWh7EWUWF/BmYssNV+55XpqYjbtmuTfvEYVWJcvwoDz2jGwsMY+bMXGjfvKpj09nbT3iKlQS7SB9yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POP7yNGfxzVhVRqzPlux1b6ZIyKnLSugcfv1xToT+WA=;
 b=BlHZgP2KAp/gjF4hFjjru2Um9sAi7tOqp1RH7AY3c/oSJt5r3uQjZ19d43fGfvBdhaIk1DdIp1rtFcT7ckqCAnNLSMppEoF3YZepm5zUmn30as5Y1btvlQS2PhKHVLgcWcUc2bJQNC5faN296whuikicp/zIZc4Ys4FzACyWdoQ5B7irsAlBmhcKLbH+YCMKKDxQsYF4GBb99wkp+b11cuDd+0GLByZItEZT1ESXr43lQUwMDYWgHTS9CkFq2qW3yYtUxIFeKDD5OyXtyPeziPeJWj2BHFkNGR/zseR76FQP91qvDGIqyJber9EvkyYli1qH3Cotq6DQGpqEUiXVyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB8413.namprd11.prod.outlook.com (2603:10b6:610:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 20:31:38 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 20:31:38 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 5/5] runner/resultgen: Insert attachments list
 into results.json
In-Reply-To: <so5eiricgthaxs7n7qonvktwhpsbjol4g2qnzsxtlde2sypt4d@umwitlziyivy>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-12-zbigniew.kempczynski@intel.com>
 <87eckhw7an.fsf@intel.com>
 <h75a4hpy25g4u6tge5kigkm4x33df47z4oj2yoruf3pem4lpe6@nwlnm4fhzofg>
 <87h5pczae6.fsf@intel.com>
 <eq74fj354iicdqvutrsjcf52h2s7lbkfiyn3zunqx7ys6oxblt@3d7wrtjwfted>
 <878qaoyz39.fsf@intel.com>
 <so5eiricgthaxs7n7qonvktwhpsbjol4g2qnzsxtlde2sypt4d@umwitlziyivy>
Date: Wed, 15 Apr 2026 17:31:33 -0300
Message-ID: <875x5synh6.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::25) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: c13c9c21-7a5c-470d-a882-08de9b2dfe81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: zI9heZ6y1H5n8IvpHINmAsg3MfTLccvXOCXoYCqVNMHsKWRuv85dlENCBHSwW38KK1OwVOTb0LSFe3X8njKSQp67eBVeKnIv593jOTg4HOoSawYxmdnDsg8Zes6GQbAf9k5vqeGs5UMACphA9Mg7vVdsu7mGl8C5fkrrNSkU66X+2yspMRj8tht6qiaYoxXBiqsJfg5dDm9VGlorzOHZJ1U/qP/05Ce5Lu3NkgvekuPE647nvNeb72SyOwmBXt0iYr9+cELvm3Xx/1bLGACcUxN77Kkm5TpETzxD943ObSldJDvdr2c7om7llT79rRYwrEDlREEXTxfana9ZtSF0NcMp/oaDWojXCc3PTXq8BEM/+2F5aV16ySFZs+t/vER6PqNK2BD+4Vz9BDojl0h4deP+b0sQqpmU+3X+WV/M8Cwm9mXtDyAeOlJiK1AyRppPDiZ4AyfHkAui0dywR7MeIkm7VOGj3BR6rCjiBSHl+3kbUm7kBuwyOSttlkYtTjdohH0QUm6ea+367KBdJTMa5wBwIx9+qTxr39e4OjT/jU1gsSUH1/rePPSDog/J/pjhW4jk/TP9OxzJbpKnrulaIznYPO/D2QYj2/TRJM9Mc1XPlYO6i8BwlVoX7R/HLmaJ/9ChCReDuAS5jj5KvGPgyt5hTRQER6dstTe+WgdQ3m6pVILQrt4Koo1juo5zwkFa5aatsM09HN8QvXpUq9CslHkjVBRZGYSRYdOOM/ANV/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1dLZUlTcEV3aXYwMmc2dE5GaTRhc1dDK2I3dkV2RmFhRDM2VlpPWExxUE5q?=
 =?utf-8?B?YUh1MCtrNStVQ1g1aW1lWVZoeGZVdjlSVVZ0dm5vcCttdlVlbTN3VENYT0Fq?=
 =?utf-8?B?dUZCaVdod2g0V2g1ZytmNWtQVnZueXQxNDJXamVSTnFIS2tkbE8yV1FURFk1?=
 =?utf-8?B?bVByTUUzdkhqMGdUYUkzUW5RS1hlMHlPbWxoQmlTK3VSZVpCVE12djZVM0ZG?=
 =?utf-8?B?Yy9LMW9LZXllNHlhS2JuSTRGV0dzVld4cmJoYTFGbHVueUs4cVFBRmlBWlJa?=
 =?utf-8?B?T0ZOZ3pqS3RaNkdXdUFtbS94U0xzTWYzZ1M0UEFRc0ZnMXFSeEFnV0F4RjNR?=
 =?utf-8?B?bk9adCt6MnJUTk82SVBFeFJFdk9MeTBhaGtqdDQ4SGFUbVdhWFBnQ2haLzlS?=
 =?utf-8?B?SzJlN2RtaXQzVlh4TVFjV2phRWF0MWVvQ3VuTURQSjN3UTBCbE9QZitSa2w0?=
 =?utf-8?B?cHMrWHNPTnJWOUwvbnU5NzNEaFRQOEdLaE1IRnZOb1pKZmY4eEtlTXJVRFdY?=
 =?utf-8?B?ZzFBVGVMU1FNeURpZDNCUlNhdlZNWXB4U0VxRHQxeFdCcmFmWVdRaHhkSU1k?=
 =?utf-8?B?OUU1SG8zTTJUdkY5RW1XRENDbmNic2E1Zm9CTkQ0Um9aeWVTbUNUQ0FydlJ2?=
 =?utf-8?B?YVZveFYrYjlraEtXSE1Da2R5WCttMkJreVU5cTB5SHBSUXNYeTFTNW80MXRQ?=
 =?utf-8?B?a0VzWlVIOUtzdS9USHdoRFVld2ZJeUhaMzJWM1pZR2lJTDROUDh5U1NaK3Uv?=
 =?utf-8?B?bUVRc1BFSTl2d1Z0U0hCTFpMRXQ4UGxkUnAwVnk0SlJNandxQUdYVzB0WUNB?=
 =?utf-8?B?cVFWZWRPNFBxd0tyd1V1NXdHcUVFeHgwYU54TVhCSFZSVTFYendZaFNUeWxx?=
 =?utf-8?B?R0x1eVovRm1LcUpzc1dndDB6VHd4ckkwd2oyVGFxcmZjNStPWUcyT1pmZE9N?=
 =?utf-8?B?TzlsN2hKRnVFK1paUnBST1RpRm9scEJmUms5STVCZklMS3BBakY5ZW9LVkJl?=
 =?utf-8?B?eUhFVzQvTXdlTmNqbnRZM3YyTTZ0V2lOOHlFM1ZNRWxKSFpTSENWSjgyb1VR?=
 =?utf-8?B?SmtQYW11QjlvVC9ucWJ6NXlhN1VFYkJHWHNMcm5xaGxHNmF5K0gyb0xSRmZv?=
 =?utf-8?B?aHBDOHRyM2p0UElaN3J2L2cxeGczSDgxbDNBZ25vbm5lTzlmQ1dvMUVDN2V3?=
 =?utf-8?B?SHFyaC9nbGlvdjNwQXcxNS9RVmRMNUd2bWt5Z3RQQnRKZFJLSHBmQXpVby9v?=
 =?utf-8?B?bStYNUV4aXo0YmZiZnVkdW5YWFFiaVU5aVlyUnMvcFRSSDhFeEd0WFEwVjgr?=
 =?utf-8?B?QjZOY3RTWEVLeFUxWjRGV1VLNnNhMEUyZVJWSEhQaGtVMlFJZ2FSQ3VqRUZT?=
 =?utf-8?B?VVNsQnE0ZnppUEo4QmRJSmtWeGxMcEUzb210TnNRcnhzMjdtZnZ1YVBaMmJw?=
 =?utf-8?B?RkllYVRKRFJza0JYcTlhd25VTUt1bHZtb0RDOEFHb2FJV0MxRnZEakZEY3hK?=
 =?utf-8?B?TTg1ZlJzWE9FNTJ4VEtYS3Q0UDBBRWFWUHN2UXZaK3FoTFpqSDBhOFV4QkJP?=
 =?utf-8?B?b0ZaZWlqU2oyVlVJN0o2S3F6MWI2cVpYTXhhMkdQbllJWURoQ0JETEUwVVNm?=
 =?utf-8?B?YTdsK1YzajFQa0k5OWdoZU5wdmkyTE9qQVV1Ryt4dTRDSzhpVHd0clREVE5E?=
 =?utf-8?B?MjFBdDhlQ3QzOEZmaDJCYS94M1FFcG04WXB0cnNxdWFVMkRCSldFeHk4azNk?=
 =?utf-8?B?MFVBOVJQTzJYTkc3bXc0ckVsZEFOcE9RQzdwMFlmVHRlS1dFNTF0c2xCYU9W?=
 =?utf-8?B?M05SUjZtQXVxU0FFajZTNmNacktnampUNWc4ZzYraXQ2aC9XWWZ2Q3RVdGtE?=
 =?utf-8?B?N2xCZ3pKTlR5YzBFeFVGQmxjb21yMGdySkFwQUhidFlSUjMxN3MyMUJQWi9F?=
 =?utf-8?B?dTd3RFEraXZCdllRdk5yeHBMZXZNcTV5V3J1VVdBWlZCQ1VORm1zVjRWaEtl?=
 =?utf-8?B?RU1vWkdFQkx0cmk2MnorU2tvM2c3emRYNDdDbkdwem9ENlQzWm1UTkMwcjQz?=
 =?utf-8?B?U2dZYWtOaTh4OGtkMktCcHdTQ29pOTdQeE9jMTJaVW1WZ0RKN3laU3FxY21n?=
 =?utf-8?B?bDdta0U0TzQ5cGFmeE5Uajg1NWt6c2Y2YjJiVW42eit4VWVNZmM2Y0xYNzJS?=
 =?utf-8?B?eVZtK1VGTzJ5NE5vTG9kSk5PSEVMT2lVSVNJZFUzWm1xNklhTXJkSEZFeVFX?=
 =?utf-8?B?WDJyaWcyeDlPb3ZwaGtDVlM1T2RTekZqNDVRVUJGNmFaY01hV1hUZnF6RU83?=
 =?utf-8?B?TVRpbWtpczdmVXBmNUFYNFhsOHJJTFB4emdFSnJZd2dzWlVTc05WUT09?=
X-Exchange-RoutingPolicyChecked: DvYfokWaD7rjKuPi+qwHqQOXVtcEBqO4svHbgUEaXwZkliy24mMAG0TrLWrlrXHLu26kN7K4zuivyg2EBQA4SoJk8X0S7PQg065Hpd5CTtD9TLI9lKmJ2oYGO+gGteNk98hniNx+E1wr0VhOzTxjz8J0Zd0rBK79ncwe0aJ0TWfh8s90qjOfLwjVcQ6GOHTwsGNRTXryaoFNrGmw8i8rUetoMXZRUKmKnxerr7dA9yOSYK/C2pFRX9jLsFgm7ZPL57VDfBRDlyQZ0Ayj9VRXQUOcEnmcih+/BsVqre/bdH/xuQF/+0noxrRACD5+gkxYONgns23u0Ii2NcVcCHe6Tg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c13c9c21-7a5c-470d-a882-08de9b2dfe81
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 20:31:38.1123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hg8jUh+jhXkgXZph0uppJ7L//O8Nz4p4woGLu6mGBlJ59kPqoHYS1Eh/vLyUOBDK2ymbyQMUkC/kCmOFWUr2sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8413
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

> On Wed, Apr 15, 2026 at 01:20:42PM -0300, Gustavo Sousa wrote:
>
> <cut>
>
>> >>=20
>> >> >
>> >> > For attachments case imo allowing recursive creation from hooks scr=
ipts
>> >> > is an overkill.
>> >>=20
>> >> The hook mechanism is not something created for exclusive use by CI. =
It
>> >> is a tool for developers to use are they see fit.  That was my origin=
al
>> >> intention when I first developed the hooks infrastructure.
>> >>=20
>> >> I don't like the fact that we are making assumptions of how the hooks
>> >> will behave here.
>> >>=20
>> >> If CI wants a flat structure, that's fine: let CI provide hooks that
>> >> generate files in a flat hierarchy.  I just think that it is not righ=
t
>> >> to assume that all hooks will behave like that.
>> >
>> > Executing hooks out of igt_runner won't provide results.json, right?
>> > So all that recursive removal / etc doesn't makes sense when you execu=
te
>> > tests standalone.
>>=20
>> My comment above is not about running igt_runner vs standalone tests;
>> it is about the users having their own custom hook scripts, which could
>> be used as part of an igt_runner call.
>>=20
>> By the way, did we reach an agreement about whether we should or not be
>> adding the attachments to the results.json?  I remember Ryszard had his
>> doubts.  I might have missed some conversation about it.
>
> Yes. We got some offline discussion about this and Ryszard requirement
> was we should pack only attachment filenames to results.json. No content
> should land into this file because it is already big and adding content
> packed via base64 will only make it bigger.

Ah, this makes it simpler then: just an array of paths relative to the
result dir and no need to recreate the hirerarchy in the JSON.  That
would solve my requirement as well.

>
> If you don't mind I would like to provide minimalistic solution which
> will provide guc logs first. I suppose you have your own setup which
> likely uses hooks much, but at the moment I would like to solve problem
> with valid guc logs for failing tests. We may try to satisfy your
> workflow in a followup series, but I would like not to loose my primary
> goal from the radar.

Okay.

>
> --
> Zbigniew
>
>
>>=20
>> --
>> Gustavo Sousa
>>=20
>> >
>> > --
>> > Zbigniew
>> >
>> >
>> >>=20
>> >> --
>> >> Gustavo Sousa
>> >>=20
>> >> >
>> >> > --
>> >> > Zbigniew
>> >> >
>> >> >>=20
>> >> >> --
>> >> >> Gustavo Sousa
>> >> >>=20
>> >> >> > +	fchdir(dirfd(currdir));
>> >> >> > +
>> >> >> > +	return ret ? false : true;
>> >> >> > +}
>> >> >> > +
>> >> >> >  static const char *result_from_exitcode(int exitcode)
>> >> >> >  {
>> >> >> >  	switch (exitcode) {
>> >> >> > @@ -2244,6 +2304,9 @@ static bool parse_test_directory(int dirfd=
,
>> >> >> >  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
>> >> >> >  	}
>> >> >> > =20
>> >> >> > +	if (!fill_from_attachments(dirfd, results->tests))
>> >> >> > +		fprintf(stderr, "Error parsing attachments directory\n");
>> >> >> > +
>> >> >> >  	override_results(entry->binary, &subtests, results->tests);
>> >> >> >  	prune_subtests(settings, entry, &subtests, results->tests);
>> >> >> > =20
>> >> >> > --=20
>> >> >> > 2.43.0
