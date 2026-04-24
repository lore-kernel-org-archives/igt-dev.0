Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F681FED3F1
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C4210F650;
	Fri, 24 Apr 2026 17:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ivmffyPo";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010053.outbound.protection.outlook.com
 [40.93.198.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39B610F650
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 17:18:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUAll4yHWsAaO69FtFkCS8JImvnF09Y7puhnTz/Sk6KiaRdcbebKW8GD8KB9BZdTi4OrovrvwzpwKKAj5uxOQ/AKbDRs0wtJLbzRnJDVlDVcrNwT5hOxG5qBy5gZAUroioWxfC3TPHeH/li54vjZKorJ8HlSU3TBkBpA7uLVGQvkO5feDT6qE7MyxLo67N5vpUlN5OuR9UOC5pEka/xgg/t3Ajrz7ZLllKnqUljEGLn6rd7z5vu6zCj1o25W9u5um2O3Bn4ZgTj/499MoUI043IVntPZP3/LYu/S/s7XGIS9UGBUw9tmvbLDOrMLM7ERDy1ErmqRuehPG3mbbQf8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ60tA5P7AYNK68eaXc74dF0Xpab2EpJyYcpzR20ZwY=;
 b=nyWYi2bLuiqw/atSZ+cCZElItsBSZOWwYBXXAiBpAq6sEd9eUqr7xcFQTv+BDjIU/XqqJo0VJ21gzCgC40KrFd3zI/eoteCegLUHmVMqCBMuB4+CGkVh7hexajUgs756pFm5AYrpwYjVqNs5VXkjaH7RXaSayKe5fT3bAl0LleR57o7qwjrx90bT9EotKooGRzwFtXiBe24CzLO823+mxPIQkq8nfXClGYCSW2CFxBPIFxl+SFd9pBnCM0jzQhc2PUuNieU/7jKJXwbhvddbNOlOuxy9I7UUQc52b9EWTmqmcLOtem7EpHNLTiQJAen5DSol5XwGfMnVPRfUDKihNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ60tA5P7AYNK68eaXc74dF0Xpab2EpJyYcpzR20ZwY=;
 b=ivmffyPorwKHydqmwGjnBsN9iR+F+PwO1Nu4doJpeGd3KNZCLlzYsSqmG3OiZxRfUF0UfLIbIqWX2TU+uhwNHG1k3q/4r5/qxfNT3D2Hhfo1wrvNAMcb3ROb3wlZj5NZxGnALDVzkjs5G+bQxyqYNnGQZf7C8evoCyxdUglvbjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by SA5PPF37951B1C9.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Fri, 24 Apr
 2026 17:18:20 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26%5]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 17:18:20 +0000
Content-Type: multipart/alternative;
 boundary="------------xGafFIv40Y3KQfbugIVRBTOs"
Message-ID: <a7596ecc-d186-4623-acd7-50cf1573acea@amd.com>
Date: Fri, 24 Apr 2026 13:18:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib: Add generic platform filtering framework with
 AMD backend
To: vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 "Petri Latvala <adrinael@adrinael.net> Arkadiusz Hiler" <arek@hiler.eu>,
 "Ashutosh Dixit <ashutosh.dixit@intel.com> Karthik B S"
 <karthik.b.s@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 "Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> Bhanuprakash Modem"
 <bhanuprakash.modem@gmail.com>
References: <20260423031204.5033-1-vitaly.prosyak@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260423031204.5033-1-vitaly.prosyak@amd.com>
X-ClientProxiedBy: YT4PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::10) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|SA5PPF37951B1C9:EE_
X-MS-Office365-Filtering-Correlation-Id: 683a84bd-2453-451c-4628-08dea2257ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|18002099003|22082099003|56012099003|18096099003;
X-Microsoft-Antispam-Message-Info: 9xr0+FZnYAzRgDriFUvA23QN7JVJOZDr2rQsQjRfU1QoWFjCbpEum50SSIJ/c50R8lf5GP/a2mmoFOOSKa6RYswjP+XqS25fluKC+3E7i1HBpqY8QfFbmKowrr2zpDoGEZPNSVv4GW6nzaZVn60d5nN22TwK6cRVSC8XV2jyPepnudRYFSSWgArCsZpr4XD4cp9KljTQofDBuN/TR4PCZ9WeR14AZRBr4wLu2L60sU0pSkaUcK5XZnlA+8luiYaAVIvFJ1XoGm3fDOsf+aL96QYss9yFElBzCx5sF/2Wv/vzgKPnPIGs90lNIH7NvvjA/B3L1xJQngy/MdB6Y8LgPwHMRY9l5bKIIcYIxUXAPCRvrrO47aYDV3E3GDQmlOpNbBoxIXEHyS6OBpWPCqknR2GZJDU1tHy+PB0d3NAtM71uuaF4XJdyd3dJfJ/0FJ/dpOIEBJ+jLld5LasE8ArBhK0Y0td4wkTPaKq0a/i6266yYCGai5rQvIQO9chwh444VBwGP55oGtOYb1QR0wHLtDoCfzW16BtU/IylAiQTEZmZ81q+dCbkkAZPyNxr4JAL/Sox64L6YmiMeJQYol0E98lI/+La5UXRgkuqQIlrSvQ8hK6VMxbhoOUKpzqqFMdv1S4mEkdJP2oUPKzqJp6OQ+lSuP4Xj5QFJhenGn0HuqGBHajiVfYWHaY72DwpdY53oH053KBBXp69SUSl+ZADh23OFJkTs+BCblc3It0zYWM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(18002099003)(22082099003)(56012099003)(18096099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1hBbVhYM0k5UVdEdjU5M09Ebi8zWlF2TTgrWVNTcUpDTXFvNGJmVmxtQWFB?=
 =?utf-8?B?d05wSXdjSWxtbGVyK0VMVFNaSCt5bDJJSDVxUFAydlpZSm5JaGhwSUF1VUhk?=
 =?utf-8?B?c2RTZTg2aDM5cXozZWJmMS9mRXBBa1hFdmdPVGZqYzJqNkNndjlDQkhwRTc5?=
 =?utf-8?B?UVd0czNUUXZUMmRZeGI4dW5neXozaFd5Mm9pOWNyRFQ0Y2lYWlZzU1RJTnli?=
 =?utf-8?B?ankzL0NvQmQ0ZWVUckNBYy8vRitQUEVIbVF4WmhtaW0yNGNteHo0VzVRU2NL?=
 =?utf-8?B?NDd3M2FXVE8vdHNmYmJSNVJ2ZFFtcUFxa2dLZ29ueFU5OUU1SVYzQUtFMmZa?=
 =?utf-8?B?UVZ0V1R2OVhhWWJxUUs0VEZPYWJSTWxaOXc2UWxmTFM1TXJ6NGlmYXo4YkFr?=
 =?utf-8?B?RjJVNDJEWDlhVkR6VW1LU3hjSXYzRzlQbW9OMWdqSVo4cldVam9Sd1E0MGVQ?=
 =?utf-8?B?UXVlNzNRbWNobThISytWa1Y0eGZValY1NmFkNExob1U4MlZiOU9LS1I3QmVR?=
 =?utf-8?B?NndLOTl6NWhxYXZVQ2UxOG5aMEZOcVFXM01xSzVmaXJXOGFldERLZFVvR0tz?=
 =?utf-8?B?SytiK1hoc0IvcW5hTlhxb0ZEME9IN1dTaXA0dzRqUGM2cytyMW1CblYzNWp2?=
 =?utf-8?B?dCtaS2JCZzM3RzZFSkhRZis0Ull0NSt4WE9aYlhueE5ncEpMMk9UWjE1ak5U?=
 =?utf-8?B?eVNNOHFadzh3aFNVSDZkRzdUcVU3NjIyWjRuWDMwb0J0TXFjMEc5eTA4K01O?=
 =?utf-8?B?T2dmL2FYeHRwWXpLdlFSTks1Smg5OVFXRkkzYUhCZ0UvSmpReWJCaEF5SHR3?=
 =?utf-8?B?RHNXRzEyOS90djMvRzYvTzFJZkI2cS8xcUZZUG1pdzZ5NkF6d0hVQzd5UWt0?=
 =?utf-8?B?cFdtQmJpbzl1bkhDNnJlRVFNRGlPMGJ6VnVRbVBsMXZsVVpmUVVvOUZ5bk40?=
 =?utf-8?B?c2lHb0ZxS3ZhSU5SbzRGN0YrUERFUkVEaUJXY041cGxFelI1bVQ4OUhTckc1?=
 =?utf-8?B?QUVLWFZKbTEzS1NhOEliZml6bW1iK0N6bnZnWm82NU5VeDRySXZZbTR0TFdl?=
 =?utf-8?B?MjhYeThjcmFhQ2pOaXpCalpFeEltS3ROQThTaWJRWEZEWVpxQy9OOHpHQ1Jy?=
 =?utf-8?B?WGUwWHczZmtRZC9uR0VIUndLa0h3VUQxemRiUXArdUMwM0YrY0lOWktpdEZq?=
 =?utf-8?B?bzJXNzh1cUszT1dGKzlKQUFLT21udUtkVTMvNzZNYWJsd0JWZHpxL3Frczha?=
 =?utf-8?B?OGU0OWZKTjlQY0VVVlYvMzVaYXROM3RnL0JpR3puelNXdXRDOW1pSHp0bUFt?=
 =?utf-8?B?VVJkalRZVUZZMVlXZlhmeTZNbDVsU09KR29lVGR1SVY4dTJlZGVXTGxxU2FU?=
 =?utf-8?B?bmJQdXNZdWczUmd4MWhjYWNwWWpGeTVpaDBCeG5VdGRlcnU1OW82RnJMeDds?=
 =?utf-8?B?Y05xMkJlM2ZvSnpVemFXcXdhTGRzUkdCd0tHYjgzeWUxOExCRWVkc3hlSnQv?=
 =?utf-8?B?eTh0cGhmR3cySHZRVkxZVjlLU2d3bFFGT1VmTWFTMGwrZUlocGNNMUVrdWpK?=
 =?utf-8?B?WGJDSDNOTm14TU10eVZTb29DUDhlekVpaUROeVVhckFQS2FmM1RTNldlNFhk?=
 =?utf-8?B?Y3doUVBveTBKaW5vWDBMYkI2YVorOXh3THo4aGVvaGdDdDdXZGFOZzJjbEcr?=
 =?utf-8?B?UnkyMFA3QjYwenR6b3MxVEZPaitDVUV3WStpd2tJbEczTUFsZnByd0t5RTlK?=
 =?utf-8?B?a2t0bEJDakpiWkVPUnVBS0dQbndnazRTN0wxUWZzazhxZFZrS2U2c0NKT1RL?=
 =?utf-8?B?eTFnOTZsSFhDTlBtb3pmTUxQZ1EySFBDNVZIeXR4THROQ0FaV1Q3SXBSKzJl?=
 =?utf-8?B?anZLSEtwa20vdHVkZWw0OFRkTW12R1BlTDZtU1U1cVMrcWRkWkJzdWg0WTYx?=
 =?utf-8?B?YWkwN1ZOU0dzMW4yWmQ1TW9SR1B6dzEwQTR4UEQ3TmpqNXl0c1o3NHdETS9C?=
 =?utf-8?B?QmtWYk42d28yc3gzK0IrVXZEV0pTdXBQS0ZXZElRWU1XczF1T1BjeTRycnMr?=
 =?utf-8?B?RVEzS2Jhenc4cXpzRVoyZlpVWklrbUpYRk0rWWVGZnZoU2hKaDlidWMwR1FW?=
 =?utf-8?B?RUJuc1RzR1FnZWY3UGdYbU5NcXRxRkkyQ25NZG4vNWE2MU9xeEF2bXdnTW9x?=
 =?utf-8?B?ZWxrZ0VOMm9OZFFKZlowSGVyc1Y1dDcwcWZOeC8xanZQbWZhejN4bVI0YnZV?=
 =?utf-8?B?aGsrRk9rTDRvUFZXMG4yQkJ1VnRYR21XVVJ3bCtyUkNYVWhIalg4YXlyVmNB?=
 =?utf-8?B?Q1NZQXM1cmdFYnBudkxhWkREWUpzeG5JcEF4VlRqTmN0QkZWMXZpUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683a84bd-2453-451c-4628-08dea2257ac0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 17:18:20.1534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jef3nIaCvvaz5Pr6c2ZGhgM+coanV26RkjhFdMNwS5rNi7enIQp0MuBL/ghNKCtJsRFj/Q03a5lN85M40M+ItQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF37951B1C9
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

--------------xGafFIv40Y3KQfbugIVRBTOs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

Following up on the platform filtering work and based on the feedback from and earlier discussion with Jani, I’ve reworked the approach to start from a generic IGT framework, with AMD as the first backend implementation.

The current version separates the core filtering logic from vendor-specific parts via a pluggable backend interface, so the same infrastructure can be reused by other vendors (Intel, etc.) while keeping their platform data isolated.

These patches also allow us to immediately exercise and validate the feature on the AMD backend, which helps test the framework in a real CI environment while the design is still evolving.

I would really appreciate a review of this direction, specifically:

  * Does the generic framework + per-vendor backend split make sense for IGT?
  * Is the proposed API (platform_filter_ops, config handling, etc.) aligned with IGT expectations?
  * Any suggestions before expanding this further or adding additional backends?

The goal at this stage is not to finalize everything, but to establish a reasonable generic foundation and validate the design direction early.

Thanks a lot for your time — any feedback is very welcome.

BR,
Vitaly


On 2026-04-22 23:10, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Add vendor-agnostic platform filtering system to IGT, with AMD as the
> first backend implementation. This addresses the need for platform-based
> test skipping while keeping the framework generic and extensible.
>
> Design Philosophy:
>
> This implementation follows a "generic first" approach. The core filtering
> infrastructure is completely vendor-neutral, with vendor-specific logic
> isolated in pluggable backends via callback operations.
>
> Per feedback from Jani Nikula: "I would have expected an attempt to make
> an IGT shared filtering system generic enough to plug into any vendor's
> platforms." This design directly addresses that by:
>
> 1. Separating generic infrastructure from vendor-specific implementation
> 2. Making vendor backends pluggable via platform_filter_ops callbacks
> 3. Providing a clear path for Intel, NVIDIA, and other vendors
> 4. Reusing common logic (config parsing, env var, priority system)
>
> Architecture:
>
> Generic Framework (lib/igt_platform_filter.c/h):
> - Vendor-agnostic filtering infrastructure
> - Three-tier priority system (built-in, config file, env variable)
> - Config file parsing (/etc/igt/platform_skip.conf)
> - Environment variable parsing (IGT_PLATFORM_SKIP_CONFIG)
> - Generic skip entry structures
> - Dump functionality
>
> AMD Backend (lib/amdgpu/amd_platform.c/h):
> - AMD-specific ASIC identification (family/chip ranges)
> - Integration with amdgpu_asic_addr.h definitions
> - AMD built-in skip rules
> - ASIC table mapping (navi48, navi10, etc.)
>
> Three-Tier Priority System:
>
> 1. Built-in array (highest priority, vendor-specific, requires rebuild)
>    Retrieved via vendor ops->get_builtin_rules()
>
> 2. Config file /etc/igt/platform_skip.conf (development, no rebuild)
>    Format: platform:test:subtest:reason
>    Works for all vendors
>
> 3. Environment variable IGT_PLATFORM_SKIP_CONFIG (runtime, no rebuild)
>    Same format, semicolon-separated entries
>
> Vendor Backend Interface:
>
> struct platform_filter_ops {
>     const char *name;
>     const char *(*get_platform_name)(const void *platform_info);
>     bool (*match_platform)(const void *info, const void *data);
>     bool (*parse_platform_config)(const char *str, void **data_out);
>     const struct platform_skip_entry *(*get_builtin_rules)(int *count);
>     void (*dump_platform_data)(const void *data);
> };
>
> Why AMD-Specific Parts Remain:
>
> - ASIC family/chip ranges (amdgpu_asic_addr.h definitions)
> - GPU identification logic (family_id, chip_rev matching)
> - AMD-specific built-in skip rules
> - ASIC name table (navi48, arcturus, etc.)
>
> All AMD-specific code is isolated in lib/amdgpu/amd_platform.c and
> accessed through generic callbacks. The core framework has zero
> AMD-specific knowledge.
>
> Path to Genericization for Other Vendors:
>
> To add Intel support:
> 1. Create lib/i915/intel_platform.c/h
> 2. Implement platform_filter_ops callbacks
> 3. Define Intel platform data (e.g., platform_id, stepping ranges)
> 4. Use in Intel tests via intel_platform_filter_init()
>
> Same pattern applies for NVIDIA, Qualcomm, or any future vendor.
>
> Usage in Tests:
>
> AMD tests:
>     amd_platform_filter_init(&gpu_info);
>     igt_platform_require(igt_test_name(), "my-test");
>
> Future Intel tests:
>     intel_platform_filter_init(&dev_info);
>     igt_platform_require(igt_test_name(), "my-test");
>
> Implementation Details:
>
> - No global variables
> - All state in struct platform_filter_context
> - Context accessed via get_filter_context()
> - Vendor backend data stored as void* (vendor interprets)
>
> Benefits:
>
> - Generic infrastructure reused across all vendors
> - Consistent user experience (same config format, env var for all)
> - Clear separation between generic and vendor-specific code
> - Easy to add new vendor backends
> - AMD serves as reference implementation
>
> Files Added:
> - lib/igt_platform_filter.h - Generic framework API
> - lib/igt_platform_filter.c - Generic implementation
> - lib/amdgpu/amd_platform.h - AMD backend API
> - lib/amdgpu/amd_platform.c - AMD backend implementation
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_platform.c | 318 ++++++++++++++++++++++++
>  lib/amdgpu/amd_platform.h |  53 ++++
>  lib/igt_platform_filter.c | 498 ++++++++++++++++++++++++++++++++++++++
>  lib/igt_platform_filter.h | 196 +++++++++++++++
>  lib/meson.build           |   2 +
>  5 files changed, 1067 insertions(+)
>  create mode 100644 lib/amdgpu/amd_platform.c
>  create mode 100644 lib/amdgpu/amd_platform.h
>  create mode 100644 lib/igt_platform_filter.c
>  create mode 100644 lib/igt_platform_filter.h
>
> diff --git a/lib/amdgpu/amd_platform.c b/lib/amdgpu/amd_platform.c
> new file mode 100644
> index 000000000..73314a1f6
> --- /dev/null
> +++ b/lib/amdgpu/amd_platform.c
> @@ -0,0 +1,318 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + *
> + * AMD-specific platform filtering backend
> + *
> + * This file implements AMD-specific platform filtering logic that plugs
> + * into the generic IGT platform filter framework. It handles ASIC
> + * identification, family/chip ranges, and AMD built-in skip rules.
> + */
> +
> +#include <stdlib.h>
> +#include <string.h>
> +#include <strings.h>
> +
> +#include "igt.h"
> +#include "igt_platform_filter.h"
> +#include "amd_platform.h"
> +#include "amdgpu_asic_addr.h"
> +
> +/**
> + * AMD platform data structures
> + *
> + * These structures define how AMD ASICs are matched for filtering.
> + * They use family/chip ranges similar to amd_queue_reset.c
> + */
> +
> +/* Maximum ASIC family ranges per skip entry */
> +#define MAX_ASIC_RANGES 4
> +
> +/**
> + * struct amd_asic_range - ASIC family range for matching
> + *
> + * Similar to struct used in amd_queue_reset.c for defining ASIC ranges.
> + * Uses definitions from amdgpu_asic_addr.h
> + */
> +struct amd_asic_range {
> +	int family_id;      /* FAMILY_NV, FAMILY_GFX1200, etc. */
> +	int chip_id_min;    /* Min chip revision */
> +	int chip_id_max;    /* Max chip revision */
> +};
> +
> +/**
> + * struct amd_platform_data - AMD platform matching data
> + *
> + * This is stored in platform_skip_entry->platform_data field.
> + * Contains array of ASIC ranges to match against.
> + */
> +struct amd_platform_data {
> +	struct amd_asic_range ranges[MAX_ASIC_RANGES];
> +	int num_ranges;
> +};
> +
> +/* ASIC name to family/chip mapping table */
> +struct asic_info {
> +	const char *name;
> +	int family_id;
> +	int chip_id_min;
> +	int chip_id_max;
> +};
> +
> +static const struct asic_info asic_table[] = {
> +	/* GFX12 - using ranges from amdgpu_asic_addr.h */
> +	{ "navi48", FAMILY_GFX1200, AMDGPU_GFX1200_RANGE },
> +	{ "navi44", FAMILY_GFX1200, AMDGPU_GFX1200_RANGE },
> +
> +	/* GFX11.5 */
> +	{ "gfx1150", FAMILY_GFX1150, AMDGPU_GFX1150_RANGE },
> +	{ "gfx1151", FAMILY_GFX1150, AMDGPU_GFX1151_RANGE },
> +	{ "gfx1152", FAMILY_GFX1150, AMDGPU_GFX1152_RANGE },
> +	{ "gfx1153", FAMILY_GFX1150, AMDGPU_GFX1153_RANGE },
> +
> +	/* GFX11 */
> +	{ "gfx1100", FAMILY_GFX1100, AMDGPU_GFX1100_RANGE },
> +	{ "gfx1101", FAMILY_GFX1100, AMDGPU_GFX1101_RANGE },
> +	{ "gfx1102", FAMILY_GFX1100, AMDGPU_GFX1102_RANGE },
> +	{ "gfx1103_r1", FAMILY_GFX1103, AMDGPU_GFX1103_R1_RANGE },
> +	{ "gfx1103_r2", FAMILY_GFX1103, AMDGPU_GFX1103_R2_RANGE },
> +	{ "navi31", FAMILY_GFX1100, AMDGPU_GFX1100_RANGE },
> +	{ "navi32", FAMILY_GFX1100, AMDGPU_GFX1101_RANGE },
> +	{ "navi33", FAMILY_GFX1100, AMDGPU_GFX1102_RANGE },
> +
> +	/* GFX10.3 */
> +	{ "sienna_cichlid", FAMILY_NV, AMDGPU_SIENNA_CICHLID_RANGE },
> +	{ "navy_flounder", FAMILY_NV, AMDGPU_NAVY_FLOUNDER_RANGE },
> +	{ "dimgrey_cavefish", FAMILY_NV, AMDGPU_DIMGREY_CAVEFISH_RANGE },
> +	{ "beige_goby", FAMILY_NV, AMDGPU_BEIGE_GOBY_RANGE },
> +	{ "yellow_carp", FAMILY_YC, AMDGPU_YELLOW_CARP_RANGE },
> +	{ "vangogh", FAMILY_VGH, AMDGPU_VANGOGH_RANGE },
> +
> +	/* GFX10 */
> +	{ "navi10", FAMILY_NV, AMDGPU_NAVI10_RANGE },
> +	{ "navi12", FAMILY_NV, AMDGPU_NAVI12_RANGE },
> +	{ "navi14", FAMILY_NV, AMDGPU_NAVI14_RANGE },
> +	{ "navi21", FAMILY_NV, AMDGPU_SIENNA_CICHLID_RANGE },
> +	{ "navi22", FAMILY_NV, AMDGPU_NAVY_FLOUNDER_RANGE },
> +	{ "navi23", FAMILY_NV, AMDGPU_DIMGREY_CAVEFISH_RANGE },
> +	{ "navi24", FAMILY_NV, AMDGPU_BEIGE_GOBY_RANGE },
> +
> +	/* CDNA */
> +	{ "arcturus", FAMILY_AI, AMDGPU_ARCTURUS_RANGE },
> +	{ "aldebaran", FAMILY_AI, AMDGPU_ALDEBARAN_RANGE },
> +
> +	/* GFX9 */
> +	{ "vega10", FAMILY_AI, AMDGPU_VEGA10_RANGE },
> +	{ "vega12", FAMILY_AI, AMDGPU_VEGA12_RANGE },
> +	{ "vega20", FAMILY_AI, AMDGPU_VEGA20_RANGE },
> +	{ "raven", FAMILY_RV, AMDGPU_RAVEN_RANGE },
> +	{ "raven2", FAMILY_RV, AMDGPU_RAVEN2_RANGE },
> +	{ "renoir", FAMILY_RV, AMDGPU_RENOIR_RANGE },
> +
> +	/* GFX8 (VI/Polaris) */
> +	{ "polaris10", FAMILY_VI, AMDGPU_POLARIS10_RANGE },
> +	{ "polaris11", FAMILY_VI, AMDGPU_POLARIS11_RANGE },
> +	{ "polaris12", FAMILY_VI, AMDGPU_POLARIS12_RANGE },
> +	{ "fiji", FAMILY_VI, AMDGPU_FIJI_RANGE },
> +	{ "tonga", FAMILY_VI, AMDGPU_TONGA_RANGE },
> +	{ "iceland", FAMILY_VI, AMDGPU_ICELAND_RANGE },
> +	{ "carrizo", FAMILY_CZ, AMDGPU_CARRIZO_RANGE },
> +	{ "stoney", FAMILY_CZ, AMDGPU_STONEY_RANGE },
> +
> +	{ NULL, 0, 0, 0 }
> +};
> +
> +/* Helper: Get ASIC info by name (case-insensitive) */
> +static const struct asic_info *get_asic_info(const char *name)
> +{
> +	const struct asic_info *info;
> +
> +	if (!name)
> +		return NULL;
> +
> +	for (info = asic_table; info->name; info++) {
> +		if (strcasecmp(info->name, name) == 0)
> +			return info;
> +	}
> +	return NULL;
> +}
> +
> +/* Helper: Get ASIC name by family/chip */
> +static const char *get_asic_name(int family_id, int chip_rev)
> +{
> +	const struct asic_info *info;
> +
> +	for (info = asic_table; info->name; info++) {
> +		if (info->family_id == family_id &&
> +		    chip_rev >= info->chip_id_min &&
> +		    chip_rev < info->chip_id_max)
> +			return info->name;
> +	}
> +	return "unknown";
> +}
> +
> +/* ================================================================
> + * AMD PLATFORM FILTER OPS IMPLEMENTATION
> + * ================================================================ */
> +
> +static const char *amd_get_platform_name(const void *platform_info)
> +{
> +	const struct amdgpu_gpu_info *gpu_info = platform_info;
> +
> +	if (!gpu_info)
> +		return "unknown";
> +
> +	return get_asic_name(gpu_info->family_id, gpu_info->chip_rev);
> +}
> +
> +static bool amd_match_platform(const void *platform_info, const void *platform_data)
> +{
> +	const struct amdgpu_gpu_info *gpu_info = platform_info;
> +	const struct amd_platform_data *amd_data = platform_data;
> +	int i;
> +
> +	if (!gpu_info || !amd_data)
> +		return false;
> +
> +	/* If no ranges specified, match all platforms */
> +	if (amd_data->num_ranges == 0)
> +		return true;
> +
> +	/* Check if GPU matches any of the ASIC ranges */
> +	for (i = 0; i < amd_data->num_ranges && i < MAX_ASIC_RANGES; i++) {
> +		if (amd_data->ranges[i].family_id == gpu_info->family_id) {
> +			int chip_rev = gpu_info->chip_rev;
> +			if (chip_rev >= amd_data->ranges[i].chip_id_min &&
> +			    chip_rev < amd_data->ranges[i].chip_id_max) {
> +				return true;
> +			}
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static bool amd_parse_platform_config(const char *platform_str, void **platform_data_out)
> +{
> +	const struct asic_info *info;
> +	struct amd_platform_data *amd_data;
> +
> +	info = get_asic_info(platform_str);
> +	if (!info) {
> +		igt_warn("Unknown AMD ASIC name: %s\n", platform_str);
> +		return false;
> +	}
> +
> +	amd_data = malloc(sizeof(*amd_data));
> +	if (!amd_data)
> +		return false;
> +
> +	memset(amd_data, 0, sizeof(*amd_data));
> +	amd_data->ranges[0].family_id = info->family_id;
> +	amd_data->ranges[0].chip_id_min = info->chip_id_min;
> +	amd_data->ranges[0].chip_id_max = info->chip_id_max;
> +	amd_data->num_ranges = 1;
> +
> +	*platform_data_out = amd_data;
> +	return true;
> +}
> +
> +static void amd_dump_platform_data(const void *platform_data)
> +{
> +	const struct amd_platform_data *amd_data = platform_data;
> +	int i;
> +
> +	if (!amd_data) {
> +		printf("(all platforms)");
> +		return;
> +	}
> +
> +	for (i = 0; i < amd_data->num_ranges && i < MAX_ASIC_RANGES; i++) {
> +		if (i > 0)
> +			printf(", ");
> +		printf("{0x%02X, 0x%02X-0x%02X}",
> +		       amd_data->ranges[i].family_id,
> +		       amd_data->ranges[i].chip_id_min,
> +		       amd_data->ranges[i].chip_id_max);
> +	}
> +}
> +
> +/* ================================================================
> + * AMD BUILT-IN SKIP RULES
> + * ================================================================
> + *
> + * These are production skip rules. They are checked FIRST before
> + * config file or environment variable.
> + *
> + * To add a skip rule:
> + * 1. Define platform data with ASIC ranges
> + * 2. Add entry to builtin_skip_table[]
> + * 3. Rebuild IGT
> + *
> + * Example formats (uncomment to use):
> + *
> + * Single ASIC:
> + *   static struct amd_platform_data navi44_data = {
> + *       .ranges = { {FAMILY_GFX1200, AMDGPU_GFX1200_RANGE} },
> + *       .num_ranges = 1
> + *   };
> + *   { "amd_basic", "*-UMQ", "UMQ not supported on Navi44", &navi44_data },
> + *
> + * Multiple ASICs:
> + *   static struct amd_platform_data navi10_12_14_data = {
> + *       .ranges = {
> + *           {FAMILY_NV, AMDGPU_NAVI10_RANGE},
> + *           {FAMILY_NV, AMDGPU_NAVI12_RANGE},
> + *           {FAMILY_NV, AMDGPU_NAVI14_RANGE}
> + *       },
> + *       .num_ranges = 3
> + *   };
> + *   { "amd_userq_abort", "*", "Queue reset unstable", &navi10_12_14_data },
> + *
> + * All platforms (no platform restriction):
> + *   { "test_name", "subtest", "reason", NULL },
> + */
> +
> +static const struct platform_skip_entry builtin_skip_table[] = {
> +	/* Add production skip rules here */
> +
> +	/* Sentinel */
> +	{}
> +};
> +
> +static const struct platform_skip_entry *amd_get_builtin_rules(int *count_out)
> +{
> +	int count = 0;
> +
> +	/* Count entries (stop at sentinel) */
> +	while (builtin_skip_table[count].test_name ||
> +	       builtin_skip_table[count].subtest_glob ||
> +	       builtin_skip_table[count].reason)
> +		count++;
> +
> +	*count_out = count;
> +	return builtin_skip_table;
> +}
> +
> +/* AMD platform filter operations */
> +static const struct platform_filter_ops amd_platform_ops = {
> +	.name = "amd",
> +	.get_platform_name = amd_get_platform_name,
> +	.match_platform = amd_match_platform,
> +	.parse_platform_config = amd_parse_platform_config,
> +	.get_builtin_rules = amd_get_builtin_rules,
> +	.dump_platform_data = amd_dump_platform_data,
> +};
> +
> +/* ================================================================
> + * PUBLIC API
> + * ================================================================ */
> +
> +const struct platform_filter_ops *amd_platform_get_ops(void)
> +{
> +	return &amd_platform_ops;
> +}
> +
> +void amd_platform_filter_init(const struct amdgpu_gpu_info *gpu_info)
> +{
> +	igt_platform_filter_init(&amd_platform_ops, gpu_info);
> +}
> diff --git a/lib/amdgpu/amd_platform.h b/lib/amdgpu/amd_platform.h
> new file mode 100644
> index 000000000..570ea7d75
> --- /dev/null
> +++ b/lib/amdgpu/amd_platform.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef AMD_PLATFORM_H
> +#define AMD_PLATFORM_H
> +
> +#include "igt_platform_filter.h"
> +#include "amd_ip_blocks.h"
> +
> +/**
> + * SECTION: amd_platform
> + * @short_description: AMD-specific platform filtering backend
> + * @title: AMD Platform
> + * @include: amd_platform.h
> + *
> + * AMD implementation of platform filtering that plugs into the generic
> + * IGT platform filter framework.
> + *
> + * This backend provides:
> + * - ASIC identification and matching based on family/chip ranges
> + * - Built-in skip rules for AMD GPUs
> + * - Integration with amdgpu_asic_addr.h definitions
> + *
> + * Usage in AMD tests:
> + *   igt_fixture() {
> + *       setup_amdgpu_ip_blocks(...);
> + *       amd_platform_filter_init(&gpu_info);
> + *   }
> + *
> + *   igt_subtest("my-test") {
> + *       igt_platform_require(igt_test_name(), "my-test");
> + *       // test code
> + *   }
> + */
> +
> +/**
> + * amd_platform_filter_init - Initialize AMD platform filtering
> + * @gpu_info: AMDGPU GPU information structure
> + *
> + * Convenience wrapper that initializes the generic platform filter
> + * with AMD-specific operations and GPU info.
> + */
> +void amd_platform_filter_init(const struct amdgpu_gpu_info *gpu_info);
> +
> +/**
> + * amd_platform_get_ops - Get AMD platform filter operations
> + *
> + * Returns: AMD platform_filter_ops structure
> + */
> +const struct platform_filter_ops *amd_platform_get_ops(void);
> +
> +#endif /* AMD_PLATFORM_H */
> diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
> new file mode 100644
> index 000000000..78744f3ef
> --- /dev/null
> +++ b/lib/igt_platform_filter.c
> @@ -0,0 +1,498 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + *
> + * Generic platform-based test filtering framework
> + *
> + * This is a vendor-agnostic filtering system. Vendor-specific logic
> + * is implemented via platform_filter_ops callbacks.
> + */
> +
> +#include <fnmatch.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <ctype.h>
> +
> +#include "igt.h"
> +#include "igt_platform_filter.h"
> +
> +/* Maximum entries from config file and env variable */
> +#define MAX_CONFIG_ENTRIES 256
> +#define MAX_ENV_ENTRIES 128
> +#define MAX_LINE_LENGTH 512
> +
> +/* Filter context - holds all runtime state (no globals) */
> +struct platform_filter_context {
> +	const struct platform_filter_ops *ops;
> +	const void *platform_info;
> +
> +	struct platform_skip_entry config_entries[MAX_CONFIG_ENTRIES];
> +	int config_entry_count;
> +
> +	struct platform_skip_entry env_entries[MAX_ENV_ENTRIES];
> +	int env_entry_count;
> +
> +	bool initialized;
> +	char current_platform_name[64];
> +};
> +
> +/* Single static instance - initialized on first use */
> +static struct platform_filter_context *get_filter_context(void)
> +{
> +	static struct platform_filter_context ctx = {0};
> +	return &ctx;
> +}
> +
> +/* ================================================================
> + * HELPER FUNCTIONS
> + * ================================================================ */
> +
> +/* Helper: Trim whitespace from string */
> +static char *trim(char *str)
> +{
> +	char *end;
> +
> +	while (isspace(*str))
> +		str++;
> +
> +	if (*str == 0)
> +		return str;
> +
> +	end = str + strlen(str) - 1;
> +	while (end > str && isspace(*end))
> +		end--;
> +
> +	*(end + 1) = 0;
> +	return str;
> +}
> +
> +/* Helper: Match wildcard or exact string */
> +static bool match_string(const char *pattern, const char *str)
> +{
> +	if (!pattern || !str)
> +		return false;
> +
> +	if (strcmp(pattern, "*") == 0)
> +		return true;
> +
> +	return fnmatch(pattern, str, 0) == 0;
> +}
> +
> +/* Helper: Check if entry matches platform/test/subtest */
> +static bool entry_matches(const struct platform_filter_context *ctx,
> +                          const struct platform_skip_entry *entry,
> +                          const char *test_name,
> +                          const char *subtest_name)
> +{
> +	/* Check platform match using vendor callback */
> +	if (entry->platform_data && ctx->ops->match_platform) {
> +		if (!ctx->ops->match_platform(ctx->platform_info, entry->platform_data))
> +			return false;
> +	}
> +
> +	/* Check test name match */
> +	if (entry->test_name && strcmp(entry->test_name, "*") != 0) {
> +		if (!test_name || !match_string(entry->test_name, test_name))
> +			return false;
> +	}
> +
> +	/* Check subtest glob match */
> +	if (entry->subtest_glob && strcmp(entry->subtest_glob, "*") != 0) {
> +		if (!subtest_name || !match_string(entry->subtest_glob, subtest_name))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +/* ================================================================
> + * CONFIG FILE PARSER (/etc/igt/platform_skip.conf)
> + * ================================================================ */
> +
> +/* Parse one line from config file */
> +static bool parse_config_line(struct platform_filter_context *ctx,
> +                               char *line,
> +                               struct platform_skip_entry *entry)
> +{
> +	char *platform, *test, *subtest, *reason;
> +
> +	/* Skip comments and empty lines */
> +	line = trim(line);
> +	if (line[0] == '#' || line[0] == 0)
> +		return false;
> +
> +	/* Format: platform:test:subtest:reason */
> +	platform = strtok(line, ":");
> +	test = strtok(NULL, ":");
> +	subtest = strtok(NULL, ":");
> +	reason = strtok(NULL, "\n");
> +
> +	if (!platform || !test || !subtest) {
> +		igt_warn("Invalid config line format (expected platform:test:subtest:reason)\n");
> +		return false;
> +	}
> +
> +	/* Allocate and copy strings */
> +	entry->test_name = strdup(trim(test));
> +	entry->subtest_glob = strdup(trim(subtest));
> +	entry->reason = reason ? strdup(trim(reason)) : strdup("No reason");
> +
> +	/* Parse platform using vendor callback */
> +	platform = trim(platform);
> +	if (strcmp(platform, "*") == 0) {
> +		/* Wildcard - no platform restriction */
> +		entry->platform_data = NULL;
> +	} else if (ctx->ops->parse_platform_config) {
> +		if (!ctx->ops->parse_platform_config(platform, &entry->platform_data)) {
> +			igt_warn("Failed to parse platform: %s\n", platform);
> +			free((void *)entry->test_name);
> +			free((void *)entry->subtest_glob);
> +			free((void *)entry->reason);
> +			return false;
> +		}
> +	} else {
> +		entry->platform_data = NULL;
> +	}
> +
> +	return true;
> +}
> +
> +/* Load config file */
> +static void load_config_file(struct platform_filter_context *ctx, const char *filename)
> +{
> +	FILE *f;
> +	char line[MAX_LINE_LENGTH];
> +
> +	f = fopen(filename, "r");
> +	if (!f) {
> +		igt_debug("Config file not found: %s\n", filename);
> +		return;
> +	}
> +
> +	igt_info("Loading platform skip config from: %s\n", filename);
> +
> +	while (fgets(line, sizeof(line), f)) {
> +		if (ctx->config_entry_count >= MAX_CONFIG_ENTRIES) {
> +			igt_warn("Config file has too many entries (max %d)\n",
> +			         MAX_CONFIG_ENTRIES);
> +			break;
> +		}
> +
> +		if (parse_config_line(ctx, line, &ctx->config_entries[ctx->config_entry_count])) {
> +			ctx->config_entry_count++;
> +		}
> +	}
> +
> +	fclose(f);
> +	igt_info("Loaded %d skip rules from config file\n", ctx->config_entry_count);
> +}
> +
> +/* ================================================================
> + * ENVIRONMENT VARIABLE PARSER (IGT_PLATFORM_SKIP_CONFIG)
> + * ================================================================ */
> +
> +/* Parse environment variable entries (semicolon-separated) */
> +static void load_env_variable(struct platform_filter_context *ctx)
> +{
> +	char *env, *env_copy, *entry_str, *saveptr;
> +	const char *env_value;
> +
> +	env_value = getenv("IGT_PLATFORM_SKIP_CONFIG");
> +	if (!env_value || env_value[0] == 0) {
> +		igt_debug("IGT_PLATFORM_SKIP_CONFIG not set\n");
> +		return;
> +	}
> +
> +	igt_info("Loading platform skip config from IGT_PLATFORM_SKIP_CONFIG\n");
> +
> +	env_copy = strdup(env_value);
> +	env = env_copy;
> +
> +	/* Parse semicolon-separated entries */
> +	while ((entry_str = strtok_r(env, ";", &saveptr)) != NULL) {
> +		env = NULL; /* For subsequent strtok_r calls */
> +
> +		if (ctx->env_entry_count >= MAX_ENV_ENTRIES) {
> +			igt_warn("Too many env variable entries (max %d)\n",
> +			         MAX_ENV_ENTRIES);
> +			break;
> +		}
> +
> +		if (parse_config_line(ctx, entry_str, &ctx->env_entries[ctx->env_entry_count])) {
> +			ctx->env_entry_count++;
> +		}
> +	}
> +
> +	free(env_copy);
> +	igt_info("Loaded %d skip rules from environment variable\n", ctx->env_entry_count);
> +}
> +
> +/* ================================================================
> + * PUBLIC API IMPLEMENTATION
> + * ================================================================ */
> +
> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +                               const void *platform_info)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +
> +	if (ctx->initialized)
> +		return;
> +
> +	if (!ops) {
> +		igt_warn("Platform filter ops is NULL, filtering disabled\n");
> +		return;
> +	}
> +
> +	ctx->ops = ops;
> +	ctx->platform_info = platform_info;
> +
> +	igt_info("Initializing platform filter system (3-tier priority) for vendor: %s\n",
> +	         ops->name ? ops->name : "unknown");
> +
> +	/* Get current platform name */
> +	if (ops->get_platform_name) {
> +		const char *pname = ops->get_platform_name(platform_info);
> +		snprintf(ctx->current_platform_name, sizeof(ctx->current_platform_name),
> +		         "%s", pname ? pname : "unknown");
> +	}
> +
> +	/* Priority 1: Built-in array (vendor-specific) */
> +	igt_debug("  Priority 1: Built-in array (vendor-specific)\n");
> +
> +	/* Priority 2: Config file */
> +	igt_debug("  Priority 2: Config file /etc/igt/platform_skip.conf\n");
> +	load_config_file(ctx, "/etc/igt/platform_skip.conf");
> +
> +	/* Priority 3: Environment variable */
> +	igt_debug("  Priority 3: Environment variable IGT_PLATFORM_SKIP_CONFIG\n");
> +	load_env_variable(ctx);
> +
> +	ctx->initialized = true;
> +	igt_info("Platform filter initialization complete\n");
> +}
> +
> +bool igt_platform_should_skip(const char *test_name,
> +                               const char *subtest_name,
> +                               enum skip_source *source,
> +                               const char **reason)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +	const struct platform_skip_entry *entry;
> +	int i, count;
> +
> +	if (!ctx->initialized) {
> +		igt_warn("Platform filter not initialized\n");
> +		if (source)
> +			*source = SKIP_SOURCE_NONE;
> +		if (reason)
> +			*reason = NULL;
> +		return false;
> +	}
> +
> +	/* Priority 1: Check built-in array FIRST */
> +	if (ctx->ops->get_builtin_rules) {
> +		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
> +		for (i = 0; i < count; i++) {
> +			entry = &builtin[i];
> +			if (entry_matches(ctx, entry, test_name, subtest_name)) {
> +				if (source)
> +					*source = SKIP_SOURCE_BUILTIN;
> +				if (reason)
> +					*reason = entry->reason;
> +				igt_debug("Skip (built-in): %s:%s - %s\n",
> +				          entry->test_name ? entry->test_name : "*",
> +				          entry->subtest_glob ? entry->subtest_glob : "*",
> +				          entry->reason ? entry->reason : "no reason");
> +				return true;
> +			}
> +		}
> +	}
> +
> +	/* Priority 2: Check config file */
> +	for (i = 0; i < ctx->config_entry_count; i++) {
> +		entry = &ctx->config_entries[i];
> +		if (entry_matches(ctx, entry, test_name, subtest_name)) {
> +			if (source)
> +				*source = SKIP_SOURCE_CONFIG;
> +			if (reason)
> +				*reason = entry->reason;
> +			igt_debug("Skip (config): %s:%s - %s\n",
> +			          entry->test_name, entry->subtest_glob, entry->reason);
> +			return true;
> +		}
> +	}
> +
> +	/* Priority 3: Check environment variable */
> +	for (i = 0; i < ctx->env_entry_count; i++) {
> +		entry = &ctx->env_entries[i];
> +		if (entry_matches(ctx, entry, test_name, subtest_name)) {
> +			if (source)
> +				*source = SKIP_SOURCE_ENV;
> +			if (reason)
> +				*reason = entry->reason;
> +			igt_debug("Skip (env): %s:%s - %s\n",
> +			          entry->test_name, entry->subtest_glob, entry->reason);
> +			return true;
> +		}
> +	}
> +
> +	if (source)
> +		*source = SKIP_SOURCE_NONE;
> +	if (reason)
> +		*reason = NULL;
> +	return false;
> +}
> +
> +void igt_platform_require(const char *test_name, const char *subtest_name)
> +{
> +	enum skip_source source;
> +	const char *reason;
> +
> +	if (igt_platform_should_skip(test_name, subtest_name, &source, &reason)) {
> +		const char *source_str;
> +
> +		switch (source) {
> +		case SKIP_SOURCE_BUILTIN:
> +			source_str = "built-in array";
> +			break;
> +		case SKIP_SOURCE_CONFIG:
> +			source_str = "config file";
> +			break;
> +		case SKIP_SOURCE_ENV:
> +			source_str = "environment variable";
> +			break;
> +		default:
> +			source_str = "unknown";
> +		}
> +
> +		igt_skip("Skipped on this platform [%s]: %s\n",
> +		         source_str, reason ? reason : "no reason");
> +	}
> +}
> +
> +void igt_platform_filter_dump(void)
> +{
> +	struct platform_filter_context *ctx = get_filter_context();
> +	const struct platform_skip_entry *entry;
> +	int i, total_count, count;
> +
> +	if (!ctx->initialized) {
> +		igt_info("Platform filter not initialized\n");
> +		return;
> +	}
> +
> +	igt_info("\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n");
> +	igt_info(" PLATFORM SKIP FILTER CONFIGURATION - THREE-TIER PRIORITY SYSTEM\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
> +
> +	igt_info("Vendor: %s\n", ctx->ops->name ? ctx->ops->name : "unknown");
> +	if (ctx->current_platform_name[0]) {
> +		igt_info("Current Platform: %s\n\n", ctx->current_platform_name);
> +	}
> +
> +	/* Priority 1: Built-in array */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 1: BUILT-IN PRODUCTION ARRAY (VENDOR-SPECIFIC)\n");
> +	igt_info(" Source: Vendor implementation\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	total_count = 0;
> +	if (ctx->ops->get_builtin_rules) {
> +		const struct platform_skip_entry *builtin = ctx->ops->get_builtin_rules(&count);
> +		for (i = 0; i < count; i++) {
> +			entry = &builtin[i];
> +			total_count++;
> +			igt_info("  %2d. %s : %s\n",
> +			       total_count,
> +			       entry->test_name ? entry->test_name : "*",
> +			       entry->subtest_glob ? entry->subtest_glob : "*");
> +			igt_info("      Reason: %s\n", entry->reason ? entry->reason : "no reason");
> +
> +			/* Print platform data if vendor provides dump callback */
> +			if (entry->platform_data && ctx->ops->dump_platform_data) {
> +				igt_info("      Platform: ");
> +				ctx->ops->dump_platform_data(entry->platform_data);
> +				igt_info("\n");
> +			}
> +			igt_info("\n");
> +		}
> +	}
> +	if (total_count == 0) {
> +		igt_info("  (No built-in rules)\n\n");
> +	}
> +
> +	/* Priority 2: Config file */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 2: DEVELOPMENT CONFIG FILE\n");
> +	igt_info(" Source: /etc/igt/platform_skip.conf\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	if (ctx->config_entry_count > 0) {
> +		for (i = 0; i < ctx->config_entry_count; i++) {
> +			entry = &ctx->config_entries[i];
> +			igt_info("  %2d. %s : %s\n",
> +			       i + 1,
> +			       entry->test_name,
> +			       entry->subtest_glob);
> +			igt_info("      Reason: %s\n\n", entry->reason);
> +		}
> +	} else {
> +		igt_info("  (No config file rules loaded)\n\n");
> +	}
> +
> +	/* Priority 3: Environment variable */
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" PRIORITY 3: RUNTIME ENVIRONMENT VARIABLE\n");
> +	igt_info(" Source: IGT_PLATFORM_SKIP_CONFIG\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +
> +	if (ctx->env_entry_count > 0) {
> +		for (i = 0; i < ctx->env_entry_count; i++) {
> +			entry = &ctx->env_entries[i];
> +			igt_info("  %2d. %s : %s\n",
> +			       i + 1,
> +			       entry->test_name,
> +			       entry->subtest_glob);
> +			igt_info("      Reason: %s\n\n", entry->reason);
> +		}
> +	} else {
> +		igt_info("  (No environment variable rules)\n\n");
> +	}
> +
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info(" SUMMARY\n");
> +	igt_info("───────────────────────────────────────────────────────────────────\n");
> +	igt_info("  Built-in rules:     %d\n", total_count);
> +	igt_info("  Config file rules:  %d\n", ctx->config_entry_count);
> +	igt_info("  Environment rules:  %d\n", ctx->env_entry_count);
> +	igt_info("  Total skip rules:   %d\n", total_count + ctx->config_entry_count + ctx->env_entry_count);
> +	igt_info("\n");
> +	igt_info("═══════════════════════════════════════════════════════════════════\n\n");
> +}
> +
> +int igt_platform_filter_dump_to_file(const char *filename)
> +{
> +	FILE *old_stdout;
> +	FILE *f;
> +
> +	f = fopen(filename, "w");
> +	if (!f) {
> +		igt_warn("Failed to open %s for writing\n", filename);
> +		return -1;
> +	}
> +
> +	/* Redirect stdout to file */
> +	old_stdout = stdout;
> +	stdout = f;
> +
> +	igt_platform_filter_dump();
> +
> +	/* Restore stdout */
> +	stdout = old_stdout;
> +	fclose(f);
> +
> +	igt_info("Platform filter configuration dumped to: %s\n", filename);
> +	return 0;
> +}
> diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
> new file mode 100644
> index 000000000..c05c39b7d
> --- /dev/null
> +++ b/lib/igt_platform_filter.h
> @@ -0,0 +1,196 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef IGT_PLATFORM_FILTER_H
> +#define IGT_PLATFORM_FILTER_H
> +
> +#include <stdbool.h>
> +
> +/**
> + * SECTION: igt_platform_filter
> + * @short_description: Generic platform-based test filtering framework
> + * @title: Platform Filter
> + * @include: igt_platform_filter.h
> + *
> + * Generic test filtering system that allows skipping tests/subtests based
> + * on platform characteristics. Designed to be vendor-agnostic with
> + * vendor-specific backends.
> + *
> + * Three-tier priority system (checked in sequence, first match wins):
> + *   1. PRODUCTION: Built-in compile-time rules (vendor-specific)
> + *   2. DEVELOPMENT: Config file /etc/igt/platform_skip.conf
> + *   3. RUNTIME: Environment variable IGT_PLATFORM_SKIP_CONFIG
> + *
> + * Vendor Implementation:
> + *   Each vendor implements platform_filter_ops callbacks to provide:
> + *   - Platform identification and matching logic
> + *   - Platform-specific data structures
> + *   - Built-in skip rules
> + *
> + * Usage in tests:
> + *   igt_fixture() {
> + *       igt_platform_filter_init(vendor_ops, platform_info);
> + *   }
> + *
> + *   igt_subtest("my-test") {
> + *       igt_platform_require(igt_test_name(), "my-test");
> + *       // test code
> + *   }
> + *
> + * Config file format (/etc/igt/platform_skip.conf):
> + *   # Lines starting with # are comments
> + *   # Format: platform:test:subtest:reason
> + *   # Use * as wildcard
> + *
> + *   navi48:*:*:All tests disabled on Navi48
> + *   alderlake:i915_pm:*:Power management tests broken
> + *
> + * Environment variable format (IGT_PLATFORM_SKIP_CONFIG):
> + *   Same as config file, semicolon-separated entries:
> + *   export IGT_PLATFORM_SKIP_CONFIG="navi48:*:*:Testing;navi10:amd_basic:*:Broken"
> + */
> +
> +/* Maximum platform ranges per skip entry */
> +#define MAX_PLATFORM_RANGES 4
> +
> +/**
> + * enum skip_source - Source of skip rule
> + */
> +enum skip_source {
> +	SKIP_SOURCE_BUILTIN,    /* From vendor built-in array */
> +	SKIP_SOURCE_CONFIG,     /* From /etc/igt/platform_skip.conf */
> +	SKIP_SOURCE_ENV,        /* From IGT_PLATFORM_SKIP_CONFIG */
> +	SKIP_SOURCE_NONE,       /* Not skipped */
> +};
> +
> +/**
> + * struct platform_skip_entry - Generic skip rule entry
> + *
> + * Generic structure for skip rules. Vendor-specific data is stored
> + * in platform_data field and interpreted by vendor callbacks.
> + */
> +struct platform_skip_entry {
> +	const char *test_name;          /* Test binary name or "*" for all */
> +	const char *subtest_glob;       /* Subtest pattern (fnmatch) or "*" */
> +	const char *reason;             /* Human-readable reason (required) */
> +	void *platform_data;            /* Vendor-specific platform matching data */
> +};
> +
> +/**
> + * struct platform_filter_ops - Vendor-specific operations
> + *
> + * Callback structure that vendors implement to provide platform-specific
> + * filtering logic. This allows the core filtering framework to remain
> + * vendor-agnostic.
> + */
> +struct platform_filter_ops {
> +	/**
> +	 * @name: Vendor name (e.g., "amd", "intel", "nvidia")
> +	 */
> +	const char *name;
> +
> +	/**
> +	 * @get_platform_name: Get current platform name
> +	 * @platform_info: Vendor-specific platform information structure
> +	 *
> +	 * Returns: Platform name string (e.g., "navi48", "alderlake")
> +	 */
> +	const char *(*get_platform_name)(const void *platform_info);
> +
> +	/**
> +	 * @match_platform: Check if skip entry matches current platform
> +	 * @platform_info: Vendor-specific platform information
> +	 * @platform_data: Vendor-specific platform matching data from skip entry
> +	 *
> +	 * Returns: true if platform matches, false otherwise
> +	 */
> +	bool (*match_platform)(const void *platform_info, const void *platform_data);
> +
> +	/**
> +	 * @parse_platform_config: Parse platform string from config file
> +	 * @platform_str: Platform string from config (e.g., "navi48", "*)
> +	 * @platform_data_out: Output pointer for parsed platform data
> +	 *
> +	 * Returns: true if parse successful, false otherwise
> +	 */
> +	bool (*parse_platform_config)(const char *platform_str, void **platform_data_out);
> +
> +	/**
> +	 * @get_builtin_rules: Get vendor-specific built-in skip rules
> +	 * @count_out: Output pointer for number of rules
> +	 *
> +	 * Returns: Array of built-in skip entries
> +	 */
> +	const struct platform_skip_entry *(*get_builtin_rules)(int *count_out);
> +
> +	/**
> +	 * @dump_platform_data: Dump platform_data for debugging
> +	 * @platform_data: Vendor-specific platform data
> +	 *
> +	 * Optional callback to print platform_data in vendor-specific format
> +	 */
> +	void (*dump_platform_data)(const void *platform_data);
> +};
> +
> +/**
> + * igt_platform_filter_init - Initialize the filtering system
> + * @ops: Vendor-specific operations callbacks
> + * @platform_info: Vendor-specific platform information structure
> + *
> + * Loads skip rules from:
> + *   1. Vendor built-in array (via ops->get_builtin_rules)
> + *   2. /etc/igt/platform_skip.conf (if exists)
> + *   3. IGT_PLATFORM_SKIP_CONFIG env variable (if set)
> + *
> + * Call once in igt_fixture.
> + */
> +void igt_platform_filter_init(const struct platform_filter_ops *ops,
> +                               const void *platform_info);
> +
> +/**
> + * igt_platform_require - Check if current test should run on this platform
> + * @test_name: Test binary name (use igt_test_name())
> + * @subtest_name: Subtest name
> + *
> + * Checks all three skip sources in priority order.
> + * Calls igt_skip() if test should be skipped.
> + */
> +void igt_platform_require(const char *test_name, const char *subtest_name);
> +
> +/**
> + * igt_platform_should_skip - Query if test should be skipped (without skipping)
> + * @test_name: Test binary name
> + * @subtest_name: Subtest name
> + * @source: Output parameter for skip source (can be NULL)
> + * @reason: Output parameter for skip reason (can be NULL)
> + *
> + * Returns: true if test should be skipped, false otherwise
> + */
> +bool igt_platform_should_skip(const char *test_name,
> +                               const char *subtest_name,
> +                               enum skip_source *source,
> +                               const char **reason);
> +
> +/**
> + * igt_platform_filter_dump - Dump all skip rules from all sources
> + *
> + * Prints formatted output showing:
> + *   - Built-in array rules (vendor-specific)
> + *   - Config file rules
> + *   - Environment variable rules
> + *   - Current platform information
> + *
> + * Useful for debugging and verification.
> + */
> +void igt_platform_filter_dump(void);
> +
> +/**
> + * igt_platform_filter_dump_to_file - Dump skip rules to file
> + * @filename: Output file path
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +int igt_platform_filter_dump_to_file(const char *filename);
> +
> +#endif /* IGT_PLATFORM_FILTER_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 0e7efadf3..a8ef72beb 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -113,6 +113,7 @@ lib_sources = [
>  	'igt_psr.c',
>  	'igt_amd.c',
>  	'igt_edid.c',
> +	'igt_platform_filter.c',
>  	'igt_eld.c',
>  	'igt_infoframe.c',
>  	'igt_color.c',
> @@ -167,6 +168,7 @@ if libdrm_amdgpu.found()
>  	lib_deps += libdrm_amdgpu
>  	lib_sources += [
>  		'amdgpu/amd_memory.c',
> +		'amdgpu/amd_platform.c',
>  		'amdgpu/amd_command_submission.c',
>  		'amdgpu/amd_compute.c',
>  		'amdgpu/amd_cs_radv.c',
--------------xGafFIv40Y3KQfbugIVRBTOs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p data-start="0" data-end="7">Hi all,</p>
    <p data-start="9" data-end="267">Following up on the platform
      filtering work and based on the feedback from and earlier
      discussion with Jani, I’ve reworked the approach to start from a
      generic IGT framework, with AMD as the first backend
      implementation.</p>
    <p data-start="269" data-end="501">The current version separates the
      core filtering logic from vendor-specific parts via a pluggable
      backend interface, so the same infrastructure can be reused by
      other vendors (Intel, etc.) while keeping their platform data
      isolated.</p>
    <p data-start="503" data-end="691">These patches also allow us to
      immediately exercise and validate the feature on the AMD backend,
      which helps test the framework in a real CI environment while the
      design is still evolving.</p>
    <p data-start="693" data-end="760">I would really appreciate a
      review of this direction, specifically:</p>
    <ul data-start="761" data-end="1013">
      <li data-section-id="vubgyo" data-start="761" data-end="836">
        Does the generic framework + per-vendor backend split make sense
        for IGT?
      </li>
      <li data-section-id="36dyaq" data-start="837" data-end="934">
        Is the proposed API (platform_filter_ops, config handling, etc.)
        aligned with IGT expectations?
      </li>
      <li data-section-id="1hyui3j" data-start="935" data-end="1013">
        Any suggestions before expanding this further or adding
        additional backends?
      </li>
    </ul>
    <p data-start="1015" data-end="1158">The goal at this stage is not
      to finalize everything, but to establish a reasonable generic
      foundation and validate the design direction early.</p>
    <p data-start="1160" data-end="1218">Thanks a lot for your time —
      any feedback is very welcome.</p>
    <p data-start="1220" data-end="1232" data-is-last-node="" data-is-only-node="">BR,<br data-start="1223" data-end="1226">
      Vitaly</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-04-22 23:10,
      <a class="moz-txt-link-abbreviated" href="mailto:vitaly.prosyak@amd.com">vitaly.prosyak@amd.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260423031204.5033-1-vitaly.prosyak@amd.com">
      <pre wrap="" class="moz-quote-pre">From: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>

Add vendor-agnostic platform filtering system to IGT, with AMD as the
first backend implementation. This addresses the need for platform-based
test skipping while keeping the framework generic and extensible.

Design Philosophy:

This implementation follows a &quot;generic first&quot; approach. The core filtering
infrastructure is completely vendor-neutral, with vendor-specific logic
isolated in pluggable backends via callback operations.

Per feedback from Jani Nikula: &quot;I would have expected an attempt to make
an IGT shared filtering system generic enough to plug into any vendor's
platforms.&quot; This design directly addresses that by:

1. Separating generic infrastructure from vendor-specific implementation
2. Making vendor backends pluggable via platform_filter_ops callbacks
3. Providing a clear path for Intel, NVIDIA, and other vendors
4. Reusing common logic (config parsing, env var, priority system)

Architecture:

Generic Framework (lib/igt_platform_filter.c/h):
- Vendor-agnostic filtering infrastructure
- Three-tier priority system (built-in, config file, env variable)
- Config file parsing (/etc/igt/platform_skip.conf)
- Environment variable parsing (IGT_PLATFORM_SKIP_CONFIG)
- Generic skip entry structures
- Dump functionality

AMD Backend (lib/amdgpu/amd_platform.c/h):
- AMD-specific ASIC identification (family/chip ranges)
- Integration with amdgpu_asic_addr.h definitions
- AMD built-in skip rules
- ASIC table mapping (navi48, navi10, etc.)

Three-Tier Priority System:

1. Built-in array (highest priority, vendor-specific, requires rebuild)
   Retrieved via vendor ops-&gt;get_builtin_rules()

2. Config file /etc/igt/platform_skip.conf (development, no rebuild)
   Format: platform:test:subtest:reason
   Works for all vendors

3. Environment variable IGT_PLATFORM_SKIP_CONFIG (runtime, no rebuild)
   Same format, semicolon-separated entries

Vendor Backend Interface:

struct platform_filter_ops {
    const char *name;
    const char *(*get_platform_name)(const void *platform_info);
    bool (*match_platform)(const void *info, const void *data);
    bool (*parse_platform_config)(const char *str, void **data_out);
    const struct platform_skip_entry *(*get_builtin_rules)(int *count);
    void (*dump_platform_data)(const void *data);
};

Why AMD-Specific Parts Remain:

- ASIC family/chip ranges (amdgpu_asic_addr.h definitions)
- GPU identification logic (family_id, chip_rev matching)
- AMD-specific built-in skip rules
- ASIC name table (navi48, arcturus, etc.)

All AMD-specific code is isolated in lib/amdgpu/amd_platform.c and
accessed through generic callbacks. The core framework has zero
AMD-specific knowledge.

Path to Genericization for Other Vendors:

To add Intel support:
1. Create lib/i915/intel_platform.c/h
2. Implement platform_filter_ops callbacks
3. Define Intel platform data (e.g., platform_id, stepping ranges)
4. Use in Intel tests via intel_platform_filter_init()

Same pattern applies for NVIDIA, Qualcomm, or any future vendor.

Usage in Tests:

AMD tests:
    amd_platform_filter_init(&amp;gpu_info);
    igt_platform_require(igt_test_name(), &quot;my-test&quot;);

Future Intel tests:
    intel_platform_filter_init(&amp;dev_info);
    igt_platform_require(igt_test_name(), &quot;my-test&quot;);

Implementation Details:

- No global variables
- All state in struct platform_filter_context
- Context accessed via get_filter_context()
- Vendor backend data stored as void* (vendor interprets)

Benefits:

- Generic infrastructure reused across all vendors
- Consistent user experience (same config format, env var for all)
- Clear separation between generic and vendor-specific code
- Easy to add new vendor backends
- AMD serves as reference implementation

Files Added:
- lib/igt_platform_filter.h - Generic framework API
- lib/igt_platform_filter.c - Generic implementation
- lib/amdgpu/amd_platform.h - AMD backend API
- lib/amdgpu/amd_platform.c - AMD backend implementation

Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
Cc: Jani Nikula <a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@linux.intel.com">&lt;jani.nikula@linux.intel.com&gt;</a>
Cc: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:jesse.zhang@amd.com">&lt;jesse.zhang@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Signed-off-by: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Reviewed-by: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:jesse.zhang@amd.com">&lt;jesse.zhang@amd.com&gt;</a>
---
 lib/amdgpu/amd_platform.c | 318 ++++++++++++++++++++++++
 lib/amdgpu/amd_platform.h |  53 ++++
 lib/igt_platform_filter.c | 498 ++++++++++++++++++++++++++++++++++++++
 lib/igt_platform_filter.h | 196 +++++++++++++++
 lib/meson.build           |   2 +
 5 files changed, 1067 insertions(+)
 create mode 100644 lib/amdgpu/amd_platform.c
 create mode 100644 lib/amdgpu/amd_platform.h
 create mode 100644 lib/igt_platform_filter.c
 create mode 100644 lib/igt_platform_filter.h

diff --git a/lib/amdgpu/amd_platform.c b/lib/amdgpu/amd_platform.c
new file mode 100644
index 000000000..73314a1f6
--- /dev/null
+++ b/lib/amdgpu/amd_platform.c
@@ -0,0 +1,318 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ *
+ * AMD-specific platform filtering backend
+ *
+ * This file implements AMD-specific platform filtering logic that plugs
+ * into the generic IGT platform filter framework. It handles ASIC
+ * identification, family/chip ranges, and AMD built-in skip rules.
+ */
+
+#include &lt;stdlib.h&gt;
+#include &lt;string.h&gt;
+#include &lt;strings.h&gt;
+
+#include &quot;igt.h&quot;
+#include &quot;igt_platform_filter.h&quot;
+#include &quot;amd_platform.h&quot;
+#include &quot;amdgpu_asic_addr.h&quot;
+
+/**
+ * AMD platform data structures
+ *
+ * These structures define how AMD ASICs are matched for filtering.
+ * They use family/chip ranges similar to amd_queue_reset.c
+ */
+
+/* Maximum ASIC family ranges per skip entry */
+#define MAX_ASIC_RANGES 4
+
+/**
+ * struct amd_asic_range - ASIC family range for matching
+ *
+ * Similar to struct used in amd_queue_reset.c for defining ASIC ranges.
+ * Uses definitions from amdgpu_asic_addr.h
+ */
+struct amd_asic_range {
+	int family_id;      /* FAMILY_NV, FAMILY_GFX1200, etc. */
+	int chip_id_min;    /* Min chip revision */
+	int chip_id_max;    /* Max chip revision */
+};
+
+/**
+ * struct amd_platform_data - AMD platform matching data
+ *
+ * This is stored in platform_skip_entry-&gt;platform_data field.
+ * Contains array of ASIC ranges to match against.
+ */
+struct amd_platform_data {
+	struct amd_asic_range ranges[MAX_ASIC_RANGES];
+	int num_ranges;
+};
+
+/* ASIC name to family/chip mapping table */
+struct asic_info {
+	const char *name;
+	int family_id;
+	int chip_id_min;
+	int chip_id_max;
+};
+
+static const struct asic_info asic_table[] = {
+	/* GFX12 - using ranges from amdgpu_asic_addr.h */
+	{ &quot;navi48&quot;, FAMILY_GFX1200, AMDGPU_GFX1200_RANGE },
+	{ &quot;navi44&quot;, FAMILY_GFX1200, AMDGPU_GFX1200_RANGE },
+
+	/* GFX11.5 */
+	{ &quot;gfx1150&quot;, FAMILY_GFX1150, AMDGPU_GFX1150_RANGE },
+	{ &quot;gfx1151&quot;, FAMILY_GFX1150, AMDGPU_GFX1151_RANGE },
+	{ &quot;gfx1152&quot;, FAMILY_GFX1150, AMDGPU_GFX1152_RANGE },
+	{ &quot;gfx1153&quot;, FAMILY_GFX1150, AMDGPU_GFX1153_RANGE },
+
+	/* GFX11 */
+	{ &quot;gfx1100&quot;, FAMILY_GFX1100, AMDGPU_GFX1100_RANGE },
+	{ &quot;gfx1101&quot;, FAMILY_GFX1100, AMDGPU_GFX1101_RANGE },
+	{ &quot;gfx1102&quot;, FAMILY_GFX1100, AMDGPU_GFX1102_RANGE },
+	{ &quot;gfx1103_r1&quot;, FAMILY_GFX1103, AMDGPU_GFX1103_R1_RANGE },
+	{ &quot;gfx1103_r2&quot;, FAMILY_GFX1103, AMDGPU_GFX1103_R2_RANGE },
+	{ &quot;navi31&quot;, FAMILY_GFX1100, AMDGPU_GFX1100_RANGE },
+	{ &quot;navi32&quot;, FAMILY_GFX1100, AMDGPU_GFX1101_RANGE },
+	{ &quot;navi33&quot;, FAMILY_GFX1100, AMDGPU_GFX1102_RANGE },
+
+	/* GFX10.3 */
+	{ &quot;sienna_cichlid&quot;, FAMILY_NV, AMDGPU_SIENNA_CICHLID_RANGE },
+	{ &quot;navy_flounder&quot;, FAMILY_NV, AMDGPU_NAVY_FLOUNDER_RANGE },
+	{ &quot;dimgrey_cavefish&quot;, FAMILY_NV, AMDGPU_DIMGREY_CAVEFISH_RANGE },
+	{ &quot;beige_goby&quot;, FAMILY_NV, AMDGPU_BEIGE_GOBY_RANGE },
+	{ &quot;yellow_carp&quot;, FAMILY_YC, AMDGPU_YELLOW_CARP_RANGE },
+	{ &quot;vangogh&quot;, FAMILY_VGH, AMDGPU_VANGOGH_RANGE },
+
+	/* GFX10 */
+	{ &quot;navi10&quot;, FAMILY_NV, AMDGPU_NAVI10_RANGE },
+	{ &quot;navi12&quot;, FAMILY_NV, AMDGPU_NAVI12_RANGE },
+	{ &quot;navi14&quot;, FAMILY_NV, AMDGPU_NAVI14_RANGE },
+	{ &quot;navi21&quot;, FAMILY_NV, AMDGPU_SIENNA_CICHLID_RANGE },
+	{ &quot;navi22&quot;, FAMILY_NV, AMDGPU_NAVY_FLOUNDER_RANGE },
+	{ &quot;navi23&quot;, FAMILY_NV, AMDGPU_DIMGREY_CAVEFISH_RANGE },
+	{ &quot;navi24&quot;, FAMILY_NV, AMDGPU_BEIGE_GOBY_RANGE },
+
+	/* CDNA */
+	{ &quot;arcturus&quot;, FAMILY_AI, AMDGPU_ARCTURUS_RANGE },
+	{ &quot;aldebaran&quot;, FAMILY_AI, AMDGPU_ALDEBARAN_RANGE },
+
+	/* GFX9 */
+	{ &quot;vega10&quot;, FAMILY_AI, AMDGPU_VEGA10_RANGE },
+	{ &quot;vega12&quot;, FAMILY_AI, AMDGPU_VEGA12_RANGE },
+	{ &quot;vega20&quot;, FAMILY_AI, AMDGPU_VEGA20_RANGE },
+	{ &quot;raven&quot;, FAMILY_RV, AMDGPU_RAVEN_RANGE },
+	{ &quot;raven2&quot;, FAMILY_RV, AMDGPU_RAVEN2_RANGE },
+	{ &quot;renoir&quot;, FAMILY_RV, AMDGPU_RENOIR_RANGE },
+
+	/* GFX8 (VI/Polaris) */
+	{ &quot;polaris10&quot;, FAMILY_VI, AMDGPU_POLARIS10_RANGE },
+	{ &quot;polaris11&quot;, FAMILY_VI, AMDGPU_POLARIS11_RANGE },
+	{ &quot;polaris12&quot;, FAMILY_VI, AMDGPU_POLARIS12_RANGE },
+	{ &quot;fiji&quot;, FAMILY_VI, AMDGPU_FIJI_RANGE },
+	{ &quot;tonga&quot;, FAMILY_VI, AMDGPU_TONGA_RANGE },
+	{ &quot;iceland&quot;, FAMILY_VI, AMDGPU_ICELAND_RANGE },
+	{ &quot;carrizo&quot;, FAMILY_CZ, AMDGPU_CARRIZO_RANGE },
+	{ &quot;stoney&quot;, FAMILY_CZ, AMDGPU_STONEY_RANGE },
+
+	{ NULL, 0, 0, 0 }
+};
+
+/* Helper: Get ASIC info by name (case-insensitive) */
+static const struct asic_info *get_asic_info(const char *name)
+{
+	const struct asic_info *info;
+
+	if (!name)
+		return NULL;
+
+	for (info = asic_table; info-&gt;name; info++) {
+		if (strcasecmp(info-&gt;name, name) == 0)
+			return info;
+	}
+	return NULL;
+}
+
+/* Helper: Get ASIC name by family/chip */
+static const char *get_asic_name(int family_id, int chip_rev)
+{
+	const struct asic_info *info;
+
+	for (info = asic_table; info-&gt;name; info++) {
+		if (info-&gt;family_id == family_id &amp;&amp;
+		    chip_rev &gt;= info-&gt;chip_id_min &amp;&amp;
+		    chip_rev &lt; info-&gt;chip_id_max)
+			return info-&gt;name;
+	}
+	return &quot;unknown&quot;;
+}
+
+/* ================================================================
+ * AMD PLATFORM FILTER OPS IMPLEMENTATION
+ * ================================================================ */
+
+static const char *amd_get_platform_name(const void *platform_info)
+{
+	const struct amdgpu_gpu_info *gpu_info = platform_info;
+
+	if (!gpu_info)
+		return &quot;unknown&quot;;
+
+	return get_asic_name(gpu_info-&gt;family_id, gpu_info-&gt;chip_rev);
+}
+
+static bool amd_match_platform(const void *platform_info, const void *platform_data)
+{
+	const struct amdgpu_gpu_info *gpu_info = platform_info;
+	const struct amd_platform_data *amd_data = platform_data;
+	int i;
+
+	if (!gpu_info || !amd_data)
+		return false;
+
+	/* If no ranges specified, match all platforms */
+	if (amd_data-&gt;num_ranges == 0)
+		return true;
+
+	/* Check if GPU matches any of the ASIC ranges */
+	for (i = 0; i &lt; amd_data-&gt;num_ranges &amp;&amp; i &lt; MAX_ASIC_RANGES; i++) {
+		if (amd_data-&gt;ranges[i].family_id == gpu_info-&gt;family_id) {
+			int chip_rev = gpu_info-&gt;chip_rev;
+			if (chip_rev &gt;= amd_data-&gt;ranges[i].chip_id_min &amp;&amp;
+			    chip_rev &lt; amd_data-&gt;ranges[i].chip_id_max) {
+				return true;
+			}
+		}
+	}
+
+	return false;
+}
+
+static bool amd_parse_platform_config(const char *platform_str, void **platform_data_out)
+{
+	const struct asic_info *info;
+	struct amd_platform_data *amd_data;
+
+	info = get_asic_info(platform_str);
+	if (!info) {
+		igt_warn(&quot;Unknown AMD ASIC name: %s\n&quot;, platform_str);
+		return false;
+	}
+
+	amd_data = malloc(sizeof(*amd_data));
+	if (!amd_data)
+		return false;
+
+	memset(amd_data, 0, sizeof(*amd_data));
+	amd_data-&gt;ranges[0].family_id = info-&gt;family_id;
+	amd_data-&gt;ranges[0].chip_id_min = info-&gt;chip_id_min;
+	amd_data-&gt;ranges[0].chip_id_max = info-&gt;chip_id_max;
+	amd_data-&gt;num_ranges = 1;
+
+	*platform_data_out = amd_data;
+	return true;
+}
+
+static void amd_dump_platform_data(const void *platform_data)
+{
+	const struct amd_platform_data *amd_data = platform_data;
+	int i;
+
+	if (!amd_data) {
+		printf(&quot;(all platforms)&quot;);
+		return;
+	}
+
+	for (i = 0; i &lt; amd_data-&gt;num_ranges &amp;&amp; i &lt; MAX_ASIC_RANGES; i++) {
+		if (i &gt; 0)
+			printf(&quot;, &quot;);
+		printf(&quot;{0x%02X, 0x%02X-0x%02X}&quot;,
+		       amd_data-&gt;ranges[i].family_id,
+		       amd_data-&gt;ranges[i].chip_id_min,
+		       amd_data-&gt;ranges[i].chip_id_max);
+	}
+}
+
+/* ================================================================
+ * AMD BUILT-IN SKIP RULES
+ * ================================================================
+ *
+ * These are production skip rules. They are checked FIRST before
+ * config file or environment variable.
+ *
+ * To add a skip rule:
+ * 1. Define platform data with ASIC ranges
+ * 2. Add entry to builtin_skip_table[]
+ * 3. Rebuild IGT
+ *
+ * Example formats (uncomment to use):
+ *
+ * Single ASIC:
+ *   static struct amd_platform_data navi44_data = {
+ *       .ranges = { {FAMILY_GFX1200, AMDGPU_GFX1200_RANGE} },
+ *       .num_ranges = 1
+ *   };
+ *   { &quot;amd_basic&quot;, &quot;*-UMQ&quot;, &quot;UMQ not supported on Navi44&quot;, &amp;navi44_data },
+ *
+ * Multiple ASICs:
+ *   static struct amd_platform_data navi10_12_14_data = {
+ *       .ranges = {
+ *           {FAMILY_NV, AMDGPU_NAVI10_RANGE},
+ *           {FAMILY_NV, AMDGPU_NAVI12_RANGE},
+ *           {FAMILY_NV, AMDGPU_NAVI14_RANGE}
+ *       },
+ *       .num_ranges = 3
+ *   };
+ *   { &quot;amd_userq_abort&quot;, &quot;*&quot;, &quot;Queue reset unstable&quot;, &amp;navi10_12_14_data },
+ *
+ * All platforms (no platform restriction):
+ *   { &quot;test_name&quot;, &quot;subtest&quot;, &quot;reason&quot;, NULL },
+ */
+
+static const struct platform_skip_entry builtin_skip_table[] = {
+	/* Add production skip rules here */
+
+	/* Sentinel */
+	{}
+};
+
+static const struct platform_skip_entry *amd_get_builtin_rules(int *count_out)
+{
+	int count = 0;
+
+	/* Count entries (stop at sentinel) */
+	while (builtin_skip_table[count].test_name ||
+	       builtin_skip_table[count].subtest_glob ||
+	       builtin_skip_table[count].reason)
+		count++;
+
+	*count_out = count;
+	return builtin_skip_table;
+}
+
+/* AMD platform filter operations */
+static const struct platform_filter_ops amd_platform_ops = {
+	.name = &quot;amd&quot;,
+	.get_platform_name = amd_get_platform_name,
+	.match_platform = amd_match_platform,
+	.parse_platform_config = amd_parse_platform_config,
+	.get_builtin_rules = amd_get_builtin_rules,
+	.dump_platform_data = amd_dump_platform_data,
+};
+
+/* ================================================================
+ * PUBLIC API
+ * ================================================================ */
+
+const struct platform_filter_ops *amd_platform_get_ops(void)
+{
+	return &amp;amd_platform_ops;
+}
+
+void amd_platform_filter_init(const struct amdgpu_gpu_info *gpu_info)
+{
+	igt_platform_filter_init(&amp;amd_platform_ops, gpu_info);
+}
diff --git a/lib/amdgpu/amd_platform.h b/lib/amdgpu/amd_platform.h
new file mode 100644
index 000000000..570ea7d75
--- /dev/null
+++ b/lib/amdgpu/amd_platform.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef AMD_PLATFORM_H
+#define AMD_PLATFORM_H
+
+#include &quot;igt_platform_filter.h&quot;
+#include &quot;amd_ip_blocks.h&quot;
+
+/**
+ * SECTION: amd_platform
+ * @short_description: AMD-specific platform filtering backend
+ * @title: AMD Platform
+ * @include: amd_platform.h
+ *
+ * AMD implementation of platform filtering that plugs into the generic
+ * IGT platform filter framework.
+ *
+ * This backend provides:
+ * - ASIC identification and matching based on family/chip ranges
+ * - Built-in skip rules for AMD GPUs
+ * - Integration with amdgpu_asic_addr.h definitions
+ *
+ * Usage in AMD tests:
+ *   igt_fixture() {
+ *       setup_amdgpu_ip_blocks(...);
+ *       amd_platform_filter_init(&amp;gpu_info);
+ *   }
+ *
+ *   igt_subtest(&quot;my-test&quot;) {
+ *       igt_platform_require(igt_test_name(), &quot;my-test&quot;);
+ *       // test code
+ *   }
+ */
+
+/**
+ * amd_platform_filter_init - Initialize AMD platform filtering
+ * @gpu_info: AMDGPU GPU information structure
+ *
+ * Convenience wrapper that initializes the generic platform filter
+ * with AMD-specific operations and GPU info.
+ */
+void amd_platform_filter_init(const struct amdgpu_gpu_info *gpu_info);
+
+/**
+ * amd_platform_get_ops - Get AMD platform filter operations
+ *
+ * Returns: AMD platform_filter_ops structure
+ */
+const struct platform_filter_ops *amd_platform_get_ops(void);
+
+#endif /* AMD_PLATFORM_H */
diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
new file mode 100644
index 000000000..78744f3ef
--- /dev/null
+++ b/lib/igt_platform_filter.c
@@ -0,0 +1,498 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ *
+ * Generic platform-based test filtering framework
+ *
+ * This is a vendor-agnostic filtering system. Vendor-specific logic
+ * is implemented via platform_filter_ops callbacks.
+ */
+
+#include &lt;fnmatch.h&gt;
+#include &lt;stdio.h&gt;
+#include &lt;stdlib.h&gt;
+#include &lt;string.h&gt;
+#include &lt;ctype.h&gt;
+
+#include &quot;igt.h&quot;
+#include &quot;igt_platform_filter.h&quot;
+
+/* Maximum entries from config file and env variable */
+#define MAX_CONFIG_ENTRIES 256
+#define MAX_ENV_ENTRIES 128
+#define MAX_LINE_LENGTH 512
+
+/* Filter context - holds all runtime state (no globals) */
+struct platform_filter_context {
+	const struct platform_filter_ops *ops;
+	const void *platform_info;
+
+	struct platform_skip_entry config_entries[MAX_CONFIG_ENTRIES];
+	int config_entry_count;
+
+	struct platform_skip_entry env_entries[MAX_ENV_ENTRIES];
+	int env_entry_count;
+
+	bool initialized;
+	char current_platform_name[64];
+};
+
+/* Single static instance - initialized on first use */
+static struct platform_filter_context *get_filter_context(void)
+{
+	static struct platform_filter_context ctx = {0};
+	return &amp;ctx;
+}
+
+/* ================================================================
+ * HELPER FUNCTIONS
+ * ================================================================ */
+
+/* Helper: Trim whitespace from string */
+static char *trim(char *str)
+{
+	char *end;
+
+	while (isspace(*str))
+		str++;
+
+	if (*str == 0)
+		return str;
+
+	end = str + strlen(str) - 1;
+	while (end &gt; str &amp;&amp; isspace(*end))
+		end--;
+
+	*(end + 1) = 0;
+	return str;
+}
+
+/* Helper: Match wildcard or exact string */
+static bool match_string(const char *pattern, const char *str)
+{
+	if (!pattern || !str)
+		return false;
+
+	if (strcmp(pattern, &quot;*&quot;) == 0)
+		return true;
+
+	return fnmatch(pattern, str, 0) == 0;
+}
+
+/* Helper: Check if entry matches platform/test/subtest */
+static bool entry_matches(const struct platform_filter_context *ctx,
+                          const struct platform_skip_entry *entry,
+                          const char *test_name,
+                          const char *subtest_name)
+{
+	/* Check platform match using vendor callback */
+	if (entry-&gt;platform_data &amp;&amp; ctx-&gt;ops-&gt;match_platform) {
+		if (!ctx-&gt;ops-&gt;match_platform(ctx-&gt;platform_info, entry-&gt;platform_data))
+			return false;
+	}
+
+	/* Check test name match */
+	if (entry-&gt;test_name &amp;&amp; strcmp(entry-&gt;test_name, &quot;*&quot;) != 0) {
+		if (!test_name || !match_string(entry-&gt;test_name, test_name))
+			return false;
+	}
+
+	/* Check subtest glob match */
+	if (entry-&gt;subtest_glob &amp;&amp; strcmp(entry-&gt;subtest_glob, &quot;*&quot;) != 0) {
+		if (!subtest_name || !match_string(entry-&gt;subtest_glob, subtest_name))
+			return false;
+	}
+
+	return true;
+}
+
+/* ================================================================
+ * CONFIG FILE PARSER (/etc/igt/platform_skip.conf)
+ * ================================================================ */
+
+/* Parse one line from config file */
+static bool parse_config_line(struct platform_filter_context *ctx,
+                               char *line,
+                               struct platform_skip_entry *entry)
+{
+	char *platform, *test, *subtest, *reason;
+
+	/* Skip comments and empty lines */
+	line = trim(line);
+	if (line[0] == '#' || line[0] == 0)
+		return false;
+
+	/* Format: platform:test:subtest:reason */
+	platform = strtok(line, &quot;:&quot;);
+	test = strtok(NULL, &quot;:&quot;);
+	subtest = strtok(NULL, &quot;:&quot;);
+	reason = strtok(NULL, &quot;\n&quot;);
+
+	if (!platform || !test || !subtest) {
+		igt_warn(&quot;Invalid config line format (expected platform:test:subtest:reason)\n&quot;);
+		return false;
+	}
+
+	/* Allocate and copy strings */
+	entry-&gt;test_name = strdup(trim(test));
+	entry-&gt;subtest_glob = strdup(trim(subtest));
+	entry-&gt;reason = reason ? strdup(trim(reason)) : strdup(&quot;No reason&quot;);
+
+	/* Parse platform using vendor callback */
+	platform = trim(platform);
+	if (strcmp(platform, &quot;*&quot;) == 0) {
+		/* Wildcard - no platform restriction */
+		entry-&gt;platform_data = NULL;
+	} else if (ctx-&gt;ops-&gt;parse_platform_config) {
+		if (!ctx-&gt;ops-&gt;parse_platform_config(platform, &amp;entry-&gt;platform_data)) {
+			igt_warn(&quot;Failed to parse platform: %s\n&quot;, platform);
+			free((void *)entry-&gt;test_name);
+			free((void *)entry-&gt;subtest_glob);
+			free((void *)entry-&gt;reason);
+			return false;
+		}
+	} else {
+		entry-&gt;platform_data = NULL;
+	}
+
+	return true;
+}
+
+/* Load config file */
+static void load_config_file(struct platform_filter_context *ctx, const char *filename)
+{
+	FILE *f;
+	char line[MAX_LINE_LENGTH];
+
+	f = fopen(filename, &quot;r&quot;);
+	if (!f) {
+		igt_debug(&quot;Config file not found: %s\n&quot;, filename);
+		return;
+	}
+
+	igt_info(&quot;Loading platform skip config from: %s\n&quot;, filename);
+
+	while (fgets(line, sizeof(line), f)) {
+		if (ctx-&gt;config_entry_count &gt;= MAX_CONFIG_ENTRIES) {
+			igt_warn(&quot;Config file has too many entries (max %d)\n&quot;,
+			         MAX_CONFIG_ENTRIES);
+			break;
+		}
+
+		if (parse_config_line(ctx, line, &amp;ctx-&gt;config_entries[ctx-&gt;config_entry_count])) {
+			ctx-&gt;config_entry_count++;
+		}
+	}
+
+	fclose(f);
+	igt_info(&quot;Loaded %d skip rules from config file\n&quot;, ctx-&gt;config_entry_count);
+}
+
+/* ================================================================
+ * ENVIRONMENT VARIABLE PARSER (IGT_PLATFORM_SKIP_CONFIG)
+ * ================================================================ */
+
+/* Parse environment variable entries (semicolon-separated) */
+static void load_env_variable(struct platform_filter_context *ctx)
+{
+	char *env, *env_copy, *entry_str, *saveptr;
+	const char *env_value;
+
+	env_value = getenv(&quot;IGT_PLATFORM_SKIP_CONFIG&quot;);
+	if (!env_value || env_value[0] == 0) {
+		igt_debug(&quot;IGT_PLATFORM_SKIP_CONFIG not set\n&quot;);
+		return;
+	}
+
+	igt_info(&quot;Loading platform skip config from IGT_PLATFORM_SKIP_CONFIG\n&quot;);
+
+	env_copy = strdup(env_value);
+	env = env_copy;
+
+	/* Parse semicolon-separated entries */
+	while ((entry_str = strtok_r(env, &quot;;&quot;, &amp;saveptr)) != NULL) {
+		env = NULL; /* For subsequent strtok_r calls */
+
+		if (ctx-&gt;env_entry_count &gt;= MAX_ENV_ENTRIES) {
+			igt_warn(&quot;Too many env variable entries (max %d)\n&quot;,
+			         MAX_ENV_ENTRIES);
+			break;
+		}
+
+		if (parse_config_line(ctx, entry_str, &amp;ctx-&gt;env_entries[ctx-&gt;env_entry_count])) {
+			ctx-&gt;env_entry_count++;
+		}
+	}
+
+	free(env_copy);
+	igt_info(&quot;Loaded %d skip rules from environment variable\n&quot;, ctx-&gt;env_entry_count);
+}
+
+/* ================================================================
+ * PUBLIC API IMPLEMENTATION
+ * ================================================================ */
+
+void igt_platform_filter_init(const struct platform_filter_ops *ops,
+                               const void *platform_info)
+{
+	struct platform_filter_context *ctx = get_filter_context();
+
+	if (ctx-&gt;initialized)
+		return;
+
+	if (!ops) {
+		igt_warn(&quot;Platform filter ops is NULL, filtering disabled\n&quot;);
+		return;
+	}
+
+	ctx-&gt;ops = ops;
+	ctx-&gt;platform_info = platform_info;
+
+	igt_info(&quot;Initializing platform filter system (3-tier priority) for vendor: %s\n&quot;,
+	         ops-&gt;name ? ops-&gt;name : &quot;unknown&quot;);
+
+	/* Get current platform name */
+	if (ops-&gt;get_platform_name) {
+		const char *pname = ops-&gt;get_platform_name(platform_info);
+		snprintf(ctx-&gt;current_platform_name, sizeof(ctx-&gt;current_platform_name),
+		         &quot;%s&quot;, pname ? pname : &quot;unknown&quot;);
+	}
+
+	/* Priority 1: Built-in array (vendor-specific) */
+	igt_debug(&quot;  Priority 1: Built-in array (vendor-specific)\n&quot;);
+
+	/* Priority 2: Config file */
+	igt_debug(&quot;  Priority 2: Config file /etc/igt/platform_skip.conf\n&quot;);
+	load_config_file(ctx, &quot;/etc/igt/platform_skip.conf&quot;);
+
+	/* Priority 3: Environment variable */
+	igt_debug(&quot;  Priority 3: Environment variable IGT_PLATFORM_SKIP_CONFIG\n&quot;);
+	load_env_variable(ctx);
+
+	ctx-&gt;initialized = true;
+	igt_info(&quot;Platform filter initialization complete\n&quot;);
+}
+
+bool igt_platform_should_skip(const char *test_name,
+                               const char *subtest_name,
+                               enum skip_source *source,
+                               const char **reason)
+{
+	struct platform_filter_context *ctx = get_filter_context();
+	const struct platform_skip_entry *entry;
+	int i, count;
+
+	if (!ctx-&gt;initialized) {
+		igt_warn(&quot;Platform filter not initialized\n&quot;);
+		if (source)
+			*source = SKIP_SOURCE_NONE;
+		if (reason)
+			*reason = NULL;
+		return false;
+	}
+
+	/* Priority 1: Check built-in array FIRST */
+	if (ctx-&gt;ops-&gt;get_builtin_rules) {
+		const struct platform_skip_entry *builtin = ctx-&gt;ops-&gt;get_builtin_rules(&amp;count);
+		for (i = 0; i &lt; count; i++) {
+			entry = &amp;builtin[i];
+			if (entry_matches(ctx, entry, test_name, subtest_name)) {
+				if (source)
+					*source = SKIP_SOURCE_BUILTIN;
+				if (reason)
+					*reason = entry-&gt;reason;
+				igt_debug(&quot;Skip (built-in): %s:%s - %s\n&quot;,
+				          entry-&gt;test_name ? entry-&gt;test_name : &quot;*&quot;,
+				          entry-&gt;subtest_glob ? entry-&gt;subtest_glob : &quot;*&quot;,
+				          entry-&gt;reason ? entry-&gt;reason : &quot;no reason&quot;);
+				return true;
+			}
+		}
+	}
+
+	/* Priority 2: Check config file */
+	for (i = 0; i &lt; ctx-&gt;config_entry_count; i++) {
+		entry = &amp;ctx-&gt;config_entries[i];
+		if (entry_matches(ctx, entry, test_name, subtest_name)) {
+			if (source)
+				*source = SKIP_SOURCE_CONFIG;
+			if (reason)
+				*reason = entry-&gt;reason;
+			igt_debug(&quot;Skip (config): %s:%s - %s\n&quot;,
+			          entry-&gt;test_name, entry-&gt;subtest_glob, entry-&gt;reason);
+			return true;
+		}
+	}
+
+	/* Priority 3: Check environment variable */
+	for (i = 0; i &lt; ctx-&gt;env_entry_count; i++) {
+		entry = &amp;ctx-&gt;env_entries[i];
+		if (entry_matches(ctx, entry, test_name, subtest_name)) {
+			if (source)
+				*source = SKIP_SOURCE_ENV;
+			if (reason)
+				*reason = entry-&gt;reason;
+			igt_debug(&quot;Skip (env): %s:%s - %s\n&quot;,
+			          entry-&gt;test_name, entry-&gt;subtest_glob, entry-&gt;reason);
+			return true;
+		}
+	}
+
+	if (source)
+		*source = SKIP_SOURCE_NONE;
+	if (reason)
+		*reason = NULL;
+	return false;
+}
+
+void igt_platform_require(const char *test_name, const char *subtest_name)
+{
+	enum skip_source source;
+	const char *reason;
+
+	if (igt_platform_should_skip(test_name, subtest_name, &amp;source, &amp;reason)) {
+		const char *source_str;
+
+		switch (source) {
+		case SKIP_SOURCE_BUILTIN:
+			source_str = &quot;built-in array&quot;;
+			break;
+		case SKIP_SOURCE_CONFIG:
+			source_str = &quot;config file&quot;;
+			break;
+		case SKIP_SOURCE_ENV:
+			source_str = &quot;environment variable&quot;;
+			break;
+		default:
+			source_str = &quot;unknown&quot;;
+		}
+
+		igt_skip(&quot;Skipped on this platform [%s]: %s\n&quot;,
+		         source_str, reason ? reason : &quot;no reason&quot;);
+	}
+}
+
+void igt_platform_filter_dump(void)
+{
+	struct platform_filter_context *ctx = get_filter_context();
+	const struct platform_skip_entry *entry;
+	int i, total_count, count;
+
+	if (!ctx-&gt;initialized) {
+		igt_info(&quot;Platform filter not initialized\n&quot;);
+		return;
+	}
+
+	igt_info(&quot;\n&quot;);
+	igt_info(&quot;═══════════════════════════════════════════════════════════════════\n&quot;);
+	igt_info(&quot; PLATFORM SKIP FILTER CONFIGURATION - THREE-TIER PRIORITY SYSTEM\n&quot;);
+	igt_info(&quot;═══════════════════════════════════════════════════════════════════\n\n&quot;);
+
+	igt_info(&quot;Vendor: %s\n&quot;, ctx-&gt;ops-&gt;name ? ctx-&gt;ops-&gt;name : &quot;unknown&quot;);
+	if (ctx-&gt;current_platform_name[0]) {
+		igt_info(&quot;Current Platform: %s\n\n&quot;, ctx-&gt;current_platform_name);
+	}
+
+	/* Priority 1: Built-in array */
+	igt_info(&quot;───────────────────────────────────────────────────────────────────\n&quot;);
+	igt_info(&quot; PRIORITY 1: BUILT-IN PRODUCTION ARRAY (VENDOR-SPECIFIC)\n&quot;);
+	igt_info(&quot; Source: Vendor implementation\n&quot;);
+	igt_info(&quot;───────────────────────────────────────────────────────────────────\n&quot;);
+
+	total_count = 0;
+	if (ctx-&gt;ops-&gt;get_builtin_rules) {
+		const struct platform_skip_entry *builtin = ctx-&gt;ops-&gt;get_builtin_rules(&amp;count);
+		for (i = 0; i &lt; count; i++) {
+			entry = &amp;builtin[i];
+			total_count++;
+			igt_info(&quot;  %2d. %s : %s\n&quot;,
+			       total_count,
+			       entry-&gt;test_name ? entry-&gt;test_name : &quot;*&quot;,
+			       entry-&gt;subtest_glob ? entry-&gt;subtest_glob : &quot;*&quot;);
+			igt_info(&quot;      Reason: %s\n&quot;, entry-&gt;reason ? entry-&gt;reason : &quot;no reason&quot;);
+
+			/* Print platform data if vendor provides dump callback */
+			if (entry-&gt;platform_data &amp;&amp; ctx-&gt;ops-&gt;dump_platform_data) {
+				igt_info(&quot;      Platform: &quot;);
+				ctx-&gt;ops-&gt;dump_platform_data(entry-&gt;platform_data);
+				igt_info(&quot;\n&quot;);
+			}
+			igt_info(&quot;\n&quot;);
+		}
+	}
+	if (total_count == 0) {
+		igt_info(&quot;  (No built-in rules)\n\n&quot;);
+	}
+
+	/* Priority 2: Config file */
+	igt_info(&quot;───────────────────────────────────────────────────────────────────\n&quot;);
+	igt_info(&quot; PRIORITY 2: DEVELOPMENT CONFIG FILE\n&quot;);
+	igt_info(&quot; Source: /etc/igt/platform_skip.conf\n&quot;);
+	igt_info(&quot;───────────────────────────────────────────────────────────────────\n&quot;);
+
+	if (ctx-&gt;config_entry_count &gt; 0) {
+		for (i = 0; i &lt; ctx-&gt;config_entry_count; i++) {
+			entry = &amp;ctx-&gt;config_entries[i];
+			igt_info(&quot;  %2d. %s : %s\n&quot;,
+			       i + 1,
+			       entry-&gt;test_name,
+			       entry-&gt;subtest_glob);
+			igt_info(&quot;      Reason: %s\n\n&quot;, entry-&gt;reason);
+		}
+	} else {
+		igt_info(&quot;  (No config file rules loaded)\n\n&quot;);
+	}
+
+	/* Priority 3: Environment variable */
+	igt_info(&quot;───────────────────────────────────────────────────────────────────\n&quot;);
+	igt_info(&quot; PRIORITY 3: RUNTIME ENVIRONMENT VARIABLE\n&quot;);
+	igt_info(&quot; Source: IGT_PLATFORM_SKIP_CONFIG\n&quot;);
+	igt_info(&quot;───────────────────────────────────────────────────────────────────\n&quot;);
+
+	if (ctx-&gt;env_entry_count &gt; 0) {
+		for (i = 0; i &lt; ctx-&gt;env_entry_count; i++) {
+			entry = &amp;ctx-&gt;env_entries[i];
+			igt_info(&quot;  %2d. %s : %s\n&quot;,
+			       i + 1,
+			       entry-&gt;test_name,
+			       entry-&gt;subtest_glob);
+			igt_info(&quot;      Reason: %s\n\n&quot;, entry-&gt;reason);
+		}
+	} else {
+		igt_info(&quot;  (No environment variable rules)\n\n&quot;);
+	}
+
+	igt_info(&quot;───────────────────────────────────────────────────────────────────\n&quot;);
+	igt_info(&quot; SUMMARY\n&quot;);
+	igt_info(&quot;───────────────────────────────────────────────────────────────────\n&quot;);
+	igt_info(&quot;  Built-in rules:     %d\n&quot;, total_count);
+	igt_info(&quot;  Config file rules:  %d\n&quot;, ctx-&gt;config_entry_count);
+	igt_info(&quot;  Environment rules:  %d\n&quot;, ctx-&gt;env_entry_count);
+	igt_info(&quot;  Total skip rules:   %d\n&quot;, total_count + ctx-&gt;config_entry_count + ctx-&gt;env_entry_count);
+	igt_info(&quot;\n&quot;);
+	igt_info(&quot;═══════════════════════════════════════════════════════════════════\n\n&quot;);
+}
+
+int igt_platform_filter_dump_to_file(const char *filename)
+{
+	FILE *old_stdout;
+	FILE *f;
+
+	f = fopen(filename, &quot;w&quot;);
+	if (!f) {
+		igt_warn(&quot;Failed to open %s for writing\n&quot;, filename);
+		return -1;
+	}
+
+	/* Redirect stdout to file */
+	old_stdout = stdout;
+	stdout = f;
+
+	igt_platform_filter_dump();
+
+	/* Restore stdout */
+	stdout = old_stdout;
+	fclose(f);
+
+	igt_info(&quot;Platform filter configuration dumped to: %s\n&quot;, filename);
+	return 0;
+}
diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
new file mode 100644
index 000000000..c05c39b7d
--- /dev/null
+++ b/lib/igt_platform_filter.h
@@ -0,0 +1,196 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef IGT_PLATFORM_FILTER_H
+#define IGT_PLATFORM_FILTER_H
+
+#include &lt;stdbool.h&gt;
+
+/**
+ * SECTION: igt_platform_filter
+ * @short_description: Generic platform-based test filtering framework
+ * @title: Platform Filter
+ * @include: igt_platform_filter.h
+ *
+ * Generic test filtering system that allows skipping tests/subtests based
+ * on platform characteristics. Designed to be vendor-agnostic with
+ * vendor-specific backends.
+ *
+ * Three-tier priority system (checked in sequence, first match wins):
+ *   1. PRODUCTION: Built-in compile-time rules (vendor-specific)
+ *   2. DEVELOPMENT: Config file /etc/igt/platform_skip.conf
+ *   3. RUNTIME: Environment variable IGT_PLATFORM_SKIP_CONFIG
+ *
+ * Vendor Implementation:
+ *   Each vendor implements platform_filter_ops callbacks to provide:
+ *   - Platform identification and matching logic
+ *   - Platform-specific data structures
+ *   - Built-in skip rules
+ *
+ * Usage in tests:
+ *   igt_fixture() {
+ *       igt_platform_filter_init(vendor_ops, platform_info);
+ *   }
+ *
+ *   igt_subtest(&quot;my-test&quot;) {
+ *       igt_platform_require(igt_test_name(), &quot;my-test&quot;);
+ *       // test code
+ *   }
+ *
+ * Config file format (/etc/igt/platform_skip.conf):
+ *   # Lines starting with # are comments
+ *   # Format: platform:test:subtest:reason
+ *   # Use * as wildcard
+ *
+ *   navi48:*:*:All tests disabled on Navi48
+ *   alderlake:i915_pm:*:Power management tests broken
+ *
+ * Environment variable format (IGT_PLATFORM_SKIP_CONFIG):
+ *   Same as config file, semicolon-separated entries:
+ *   export IGT_PLATFORM_SKIP_CONFIG=&quot;navi48:*:*:Testing;navi10:amd_basic:*:Broken&quot;
+ */
+
+/* Maximum platform ranges per skip entry */
+#define MAX_PLATFORM_RANGES 4
+
+/**
+ * enum skip_source - Source of skip rule
+ */
+enum skip_source {
+	SKIP_SOURCE_BUILTIN,    /* From vendor built-in array */
+	SKIP_SOURCE_CONFIG,     /* From /etc/igt/platform_skip.conf */
+	SKIP_SOURCE_ENV,        /* From IGT_PLATFORM_SKIP_CONFIG */
+	SKIP_SOURCE_NONE,       /* Not skipped */
+};
+
+/**
+ * struct platform_skip_entry - Generic skip rule entry
+ *
+ * Generic structure for skip rules. Vendor-specific data is stored
+ * in platform_data field and interpreted by vendor callbacks.
+ */
+struct platform_skip_entry {
+	const char *test_name;          /* Test binary name or &quot;*&quot; for all */
+	const char *subtest_glob;       /* Subtest pattern (fnmatch) or &quot;*&quot; */
+	const char *reason;             /* Human-readable reason (required) */
+	void *platform_data;            /* Vendor-specific platform matching data */
+};
+
+/**
+ * struct platform_filter_ops - Vendor-specific operations
+ *
+ * Callback structure that vendors implement to provide platform-specific
+ * filtering logic. This allows the core filtering framework to remain
+ * vendor-agnostic.
+ */
+struct platform_filter_ops {
+	/**
+	 * @name: Vendor name (e.g., &quot;amd&quot;, &quot;intel&quot;, &quot;nvidia&quot;)
+	 */
+	const char *name;
+
+	/**
+	 * @get_platform_name: Get current platform name
+	 * @platform_info: Vendor-specific platform information structure
+	 *
+	 * Returns: Platform name string (e.g., &quot;navi48&quot;, &quot;alderlake&quot;)
+	 */
+	const char *(*get_platform_name)(const void *platform_info);
+
+	/**
+	 * @match_platform: Check if skip entry matches current platform
+	 * @platform_info: Vendor-specific platform information
+	 * @platform_data: Vendor-specific platform matching data from skip entry
+	 *
+	 * Returns: true if platform matches, false otherwise
+	 */
+	bool (*match_platform)(const void *platform_info, const void *platform_data);
+
+	/**
+	 * @parse_platform_config: Parse platform string from config file
+	 * @platform_str: Platform string from config (e.g., &quot;navi48&quot;, &quot;*)
+	 * @platform_data_out: Output pointer for parsed platform data
+	 *
+	 * Returns: true if parse successful, false otherwise
+	 */
+	bool (*parse_platform_config)(const char *platform_str, void **platform_data_out);
+
+	/**
+	 * @get_builtin_rules: Get vendor-specific built-in skip rules
+	 * @count_out: Output pointer for number of rules
+	 *
+	 * Returns: Array of built-in skip entries
+	 */
+	const struct platform_skip_entry *(*get_builtin_rules)(int *count_out);
+
+	/**
+	 * @dump_platform_data: Dump platform_data for debugging
+	 * @platform_data: Vendor-specific platform data
+	 *
+	 * Optional callback to print platform_data in vendor-specific format
+	 */
+	void (*dump_platform_data)(const void *platform_data);
+};
+
+/**
+ * igt_platform_filter_init - Initialize the filtering system
+ * @ops: Vendor-specific operations callbacks
+ * @platform_info: Vendor-specific platform information structure
+ *
+ * Loads skip rules from:
+ *   1. Vendor built-in array (via ops-&gt;get_builtin_rules)
+ *   2. /etc/igt/platform_skip.conf (if exists)
+ *   3. IGT_PLATFORM_SKIP_CONFIG env variable (if set)
+ *
+ * Call once in igt_fixture.
+ */
+void igt_platform_filter_init(const struct platform_filter_ops *ops,
+                               const void *platform_info);
+
+/**
+ * igt_platform_require - Check if current test should run on this platform
+ * @test_name: Test binary name (use igt_test_name())
+ * @subtest_name: Subtest name
+ *
+ * Checks all three skip sources in priority order.
+ * Calls igt_skip() if test should be skipped.
+ */
+void igt_platform_require(const char *test_name, const char *subtest_name);
+
+/**
+ * igt_platform_should_skip - Query if test should be skipped (without skipping)
+ * @test_name: Test binary name
+ * @subtest_name: Subtest name
+ * @source: Output parameter for skip source (can be NULL)
+ * @reason: Output parameter for skip reason (can be NULL)
+ *
+ * Returns: true if test should be skipped, false otherwise
+ */
+bool igt_platform_should_skip(const char *test_name,
+                               const char *subtest_name,
+                               enum skip_source *source,
+                               const char **reason);
+
+/**
+ * igt_platform_filter_dump - Dump all skip rules from all sources
+ *
+ * Prints formatted output showing:
+ *   - Built-in array rules (vendor-specific)
+ *   - Config file rules
+ *   - Environment variable rules
+ *   - Current platform information
+ *
+ * Useful for debugging and verification.
+ */
+void igt_platform_filter_dump(void);
+
+/**
+ * igt_platform_filter_dump_to_file - Dump skip rules to file
+ * @filename: Output file path
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int igt_platform_filter_dump_to_file(const char *filename);
+
+#endif /* IGT_PLATFORM_FILTER_H */
diff --git a/lib/meson.build b/lib/meson.build
index 0e7efadf3..a8ef72beb 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -113,6 +113,7 @@ lib_sources = [
 	'igt_psr.c',
 	'igt_amd.c',
 	'igt_edid.c',
+	'igt_platform_filter.c',
 	'igt_eld.c',
 	'igt_infoframe.c',
 	'igt_color.c',
@@ -167,6 +168,7 @@ if libdrm_amdgpu.found()
 	lib_deps += libdrm_amdgpu
 	lib_sources += [
 		'amdgpu/amd_memory.c',
+		'amdgpu/amd_platform.c',
 		'amdgpu/amd_command_submission.c',
 		'amdgpu/amd_compute.c',
 		'amdgpu/amd_cs_radv.c',
</pre>
    </blockquote>
  </body>
</html>

--------------xGafFIv40Y3KQfbugIVRBTOs--
