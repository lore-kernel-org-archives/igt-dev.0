Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC13D2B92F
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 14:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01E310E10B;
	Tue,  5 Nov 2024 14:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDrZdMU8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5208710E10B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730816048; x=1762352048;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SDIf9S52LLsJjlQcAvmpHvrDzjqqbezkLMuDjxcHaOU=;
 b=oDrZdMU8T+ROrfLu6pJgdU/WJXK0/r4dtwa/mCV2Y+hDNDLOPfXbmPXw
 qQpMpipB5csol3eqWZZi3TwPgXOpoBDb0rLhcxgk1tm2Ml5bVD92BmtUm
 3pau9Kpzw4RP8TVmAE5PxiK4jQzRuZ+gsg49XrbutL/NM2n7v/p8IO4Mm
 VMoAIaW9KlZZGgHkKkMN90Wm/jLiQllxp6q80IsJg0kO4lGCIhv84qyg4
 BoEm23u0r7Mt4AjVlGY+vHQxgCTCcUk6p7reHAdHwqRTGX3kmtFjUPByg
 J5I4OcTfjauY5Ep9bB/1OVEK2lOpKxIYdkYH6mgEMazMunftt01B30DY3 A==;
X-CSE-ConnectionGUID: C3+SnpN5SD6W7iMGsQSL2g==
X-CSE-MsgGUID: 7PQbw3XtShmTnPxEbpSYtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30788336"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="30788336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 06:14:07 -0800
X-CSE-ConnectionGUID: F1OYhqjBTAmiv7tp9KyvEQ==
X-CSE-MsgGUID: woXuTU2CS2GTcZGnccacsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="84130277"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 06:14:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 06:14:06 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 06:14:06 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 06:14:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4ipU5BOUrlJdMdErVDeoVU6s0PvX/v10qET5vpbAkq3LrMCqB3dPHSeiypHx8ffeu4ySpD0lo/ycMgb0P0ihY7789yukrPst9WNyk4T/pQ8TLJHgOEFGSSdMR0dGyEN6IYCAIzxH1JyS/asArX1UgdDM+7Vb775aiE3IgwozHGxJG/mgP47hdK3NEnaC183u7kYvVG0vQbWHJmSnuM5Su+20qwbp2F8WQg6jtu6zdj6iZO0xOV+OFtv8e6sSQQMQDhR655v+YakxSbePQIHXrcWliqLuI5qgIfPsrEIKHb+TsQkY6XmvYKVLE4C0hSNkfYr9GjjOu2CP2S5rmTvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPPy15C4iMrzg5fwk1kFUkKrj5rKUyyH/0vBBds6YxI=;
 b=iDrGATCfJTsoh5p16KDywLrp4QRQ8CQMi9Hic/6FuYo0dmBAakN6mfxfzMffOsOHJZi0BiOf/EqWj7A6b9rWl7Kji0kIPdwfA1N2MCNu9bGGdtRNWSILD4LcaUGTWIb/K9jsoYSpuD+vtnqDAZfWhO83qozc4FS4mdVolUd9sUBNKQk+wRRoEMbjvdzBZ0gYE0XzqLXeFtU3BjtUwYMPAv45iMXKt8vNowZD54x+zetnVESrV98Jrm91l3OQRgBEDrYZZYBfFLVOUNGSFiRFHLSNPQUOEjobggltLrQuZew9l/bGnHNX4JonYq8eQoZnXTaMyrpsRVx5SwVt7hgMDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 14:14:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 14:14:00 +0000
Date: Tue, 5 Nov 2024 08:13:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 3/3] lib/igt_kmod: Fix leaking subtest name
Message-ID: <2jmg7ixwo6a6hklesi2m6jsbwnbpms5yoczcbuhxm2scsxfoxc@uqoe4m724ndc>
References: <20241105055255.2466236-1-lucas.demarchi@intel.com>
 <20241105055255.2466236-4-lucas.demarchi@intel.com>
 <3382232.KgjxqYA5nG@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3382232.KgjxqYA5nG@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:303:6a::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e1db75-df05-4217-b006-08dcfda41877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E94sao4n1c50ThDjCW222LP2ZwLVxujfJ+SpucNGH/btpBo3vthAwsHKtddD?=
 =?us-ascii?Q?mgaRp3WMxDyanVENj2dSuxNJl87dUdOkikbz1F+zjX26M4zKJeYr6fqNPpjl?=
 =?us-ascii?Q?Cv+e9K/o/6HOQLOXMxpY53FGzDL5bsZC3qqGk5r5MBIHn0PRCcSnloJQc+vq?=
 =?us-ascii?Q?RUhH+vaFOuuOt5ugfkDLqTaADtZQwvJC28EmbK6alqJHeUG1QXOqsK5SIyZi?=
 =?us-ascii?Q?ER+Edlo/ayE0Sfi/jqs8+i3sCEZtNlpVMzabsLHryGU453oU3GrXAghKr1un?=
 =?us-ascii?Q?st58wxaaIbrL2lEnDmxTFA4Im4RsH0tgicWHyib+Y1BTisWftlV01FcaXmuv?=
 =?us-ascii?Q?zp7QtTHNmcvuvQZEd5qnKZh6Mtc1i89Muy7I9XiBSqS31Fav/nxtFk2DjvkE?=
 =?us-ascii?Q?Bk5XTlzVi6HZtonhru+h4O18XC1IQzJ7HxK3lMLCJ3noZPXGPX53fhrG8eQq?=
 =?us-ascii?Q?b3TrYLE87X1OwddqEgEm02GL4R4nolZCOcRk8VBVX4poaNg5LbSybB7wBc9R?=
 =?us-ascii?Q?SPbdkEd6IqohRxLGdNhgNcUmYuhVxsme3fF+sLSOEa6H3Ahwn1OjprSYNuVl?=
 =?us-ascii?Q?oV5M4x2BfjD5JmacmfL4ZYJbPNfFO2PaPe/wQzgqWNoLohp54my1/CTT6wBv?=
 =?us-ascii?Q?gQ0mFHbOeR4988UblnPxECSksnRtp/ayZTQL3c3bNGFRlifzumcGxWMckr0/?=
 =?us-ascii?Q?d6fWGULKKfr0mZAISVa3KyjJT2fNFWkS0zyQV0wTcKmxm2rwVOY2sGKyrPS3?=
 =?us-ascii?Q?8aUd4cB+e6KqZ3WLOfTCQDGa9D66EsoFjGDxXDuiJKCJmWh19eCgHCAtvr1T?=
 =?us-ascii?Q?feFXsfIHJrzZOMz1KDlvfZm+f0OUfPnZ/tCVsGmDYBgHHoHNwyXDONLKu4R8?=
 =?us-ascii?Q?O8YWX2q0ixBhzS1uy6GFfd9cwvELieE67mAmvPeiKFps85PRXkluyUSAQEoQ?=
 =?us-ascii?Q?0UKM3UKGHegSNyMlo+J5zUwTKPQqrplz1ug4G5X+65qXi2IbTviLYDo5zgZy?=
 =?us-ascii?Q?LGpMkiYlG4Iwf7hzErWrsix8+dSZfCzKR8DDyBhHPVIKTTUYxadUJYb5pLvx?=
 =?us-ascii?Q?Swq7QppczwG0GJsvMcky94GlHNXC7HbFP/ifYuGlbzUXlcH9ocwZp0qbaGf+?=
 =?us-ascii?Q?+fZYYdBnXt8qtMdwVoOD495ZxO2uVfaDWHXOz3JTWI6WuRVZ5Qy+B98q7l13?=
 =?us-ascii?Q?6Pvrq9ezKCCmtYPzl+6vK+3/3XADfZdFDgOrUzQv7gT9CDcIIJS9yNCcEqaL?=
 =?us-ascii?Q?jilFFH7tNjD7MOpxcONmEuVMq/CdWcDx07jFruEKYZRDmGW+HNsAscdmuLWZ?=
 =?us-ascii?Q?doNNTYuLib/cKaXNS7dfDcLh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wtDRP5kxjMNV+skYx9HSJHpqiluULzDO4ESKZTqOxTEDdiJrmn7Wx+LHGx2a?=
 =?us-ascii?Q?LM4CEQvPIUWPBCIo9QEK/YHrOivPCbUWG8ayVkh6VptjDzPl9A/A+Oxhb8kd?=
 =?us-ascii?Q?tAaval8V4vfDB8RDN8cD+QmdtCU0UNrMjQEaJq3cGAQjjhQXoNlamy4qm6Cf?=
 =?us-ascii?Q?qoEAMTJNg25GWtq2kFnUa7FZ6aBFFBXo2ckDzkl4BKBluF7luOpG/DXhCreS?=
 =?us-ascii?Q?jnt11hrz+O7yGDtQlhJ4XQRxJWFYDhFUzQd1UW5g4xN0/uOZrB4RaXZl7b01?=
 =?us-ascii?Q?h8bx/TheOmD0zX9J0jQFZxWZo7BMj5zyzbZtssWzvTYm9aCn8P3flyvsiOK6?=
 =?us-ascii?Q?fQOaUYi0J2yxw1Xc71wLUfQgJTlfDGfqVlAhW2ffB0yTPlNNzELKiDbly7az?=
 =?us-ascii?Q?/OEpglSbs7SRqpBSET+/oMmzfsi9Qt4TDeQ7QKlLJLW6E8nbO/heIaoFM5dB?=
 =?us-ascii?Q?pGE9fbOv5vlXxCb59OR5cX7+Z7d+dMTCihzchASE1xXxvl58FXMimskty9qv?=
 =?us-ascii?Q?l/coDf3IbsEFpa+jYL/Y9xL1q5Q3ydabcn4W/0kpWbX8YatIkuwgpAY7mDk1?=
 =?us-ascii?Q?dos1iYyzBlxYPKPq27QgEocaKYf0mftbK+cS4n9UEhoAids1MnBrbuCRJZre?=
 =?us-ascii?Q?3Yc6ESswqGlMAOHQU+8w3XAqEwTMIr+0oPE8WQp9B89IGggp05i9zwHT/D1g?=
 =?us-ascii?Q?fBhcjtuUTCSIK1t3If8a/xMp16AK2UxbNKucu9p+34g45HQ7Lcx+lxqCfqAg?=
 =?us-ascii?Q?JZCdmEWktS0WsHGaX82dUPZPXVflaHEqpcqseFe2lHnDf1xRq9b/46jHv7SX?=
 =?us-ascii?Q?CHkgt+Z/DOytfNCHtpMEKGzMCMuLzlzatWVnMIREZHGJMhchqG/wT+ADSsr5?=
 =?us-ascii?Q?NjIglRRP4qL04z2a/2RZDs0wD/IgKH/upiEiqgIYxIFj2blAI6MQ1C+8RoVh?=
 =?us-ascii?Q?t6mQ7S5QSPo0lj5nE8SdWKxFvVYtSwjDZrUv/u+iuURvs4eSmJU4x2/hMoYm?=
 =?us-ascii?Q?deBPoCFHg3WaszKRyY/hYcEWXQr6vrt2FIYpaSryrntd2UDchIkKITw9Y5F5?=
 =?us-ascii?Q?5LZj9DMRAhm+roHYq/nYOC528YxPPX0G2W81x/BX8YRHP8iKHLqRxDBR/EwA?=
 =?us-ascii?Q?Js/1/8KODcVOvo+GFPEdRA1daVCUqEpH/xVQCb7Knoqp8VklHKR6m8FkoBnV?=
 =?us-ascii?Q?CjnAe3YUhuoP3pHGZR0zIrnzVtBnEIbMpcslWi5Y6ceLzkVYBbAvPPVazInN?=
 =?us-ascii?Q?LGuODZTC5NUqVxulCExRxZtsDsKdxCNDf+AQXC7gEU0FYFhAXDRpokaZc5oT?=
 =?us-ascii?Q?0Ac+JoU+TbJiGXpkFIKd0B7nwZQkVMTGvjjuAi/37IfSTjr1ZwQIODNEYW1K?=
 =?us-ascii?Q?qmB/xaq8Su80ntpkRQo6LTgu+pSWZCficzpIXC/4enxxJHQlpcZP0Wp+XwgQ?=
 =?us-ascii?Q?kzWNa/TPwwv8gHtNLXgAVTwzT9AdXcszDAHKUMWvNn8ZXR1LT1Qy5Xs/bPpZ?=
 =?us-ascii?Q?7mr3/SvDPypLbcQCBdjsJF2oKxVfrrQbOU09WiB5utVT8+DCBxGvkucBmyhg?=
 =?us-ascii?Q?rAkBBXdBoc10yRCI6pkO+ZdIGRGpWIdcGomSoM840dGT/GwHVhKcTTgWroRo?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e1db75-df05-4217-b006-08dcfda41877
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 14:14:00.7958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8uXJSGHLEtosQKLMbTQi3xQDUAekxFUih1D9MOcdqKikwDm5mgekcD8ZleUO1R1Las8KNG6qg0N3nLoPh3qih00cVsV/fEzPNlNkTp9ETSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
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

On Tue, Nov 05, 2024 at 11:59:44AM +0100, Janusz Krzysztofik wrote:
>Hi Lucas,
>
>On Tuesday, 5 November 2024 06:52:55 CET Lucas De Marchi wrote:
>> Keep it simple, checking by !suite and then assigning subtest
>> accordingly. Since this is done only once, always call strdup()
>> and free().
>
>Yes, apparently I missed that leak.
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_kmod.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index 58edac8fa..fb83f17c0 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -1199,7 +1199,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>  	char debugfs_path[PATH_MAX] = { '\0', };
>>  	struct igt_ktest tst = { .kmsg = -1, };
>>  	struct igt_ktap_results *ktap = NULL;
>> -	const char *subtest = suite;
>> +	char *subtest = NULL;
>>  	DIR *debugfs_dir = NULL;
>>  	IGT_LIST_HEAD(tests);
>>
>> @@ -1208,7 +1208,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>  	 * we take the module name, drop the trailing "_test" or "_kunit"
>>  	 * suffix, if any, and use the result as our IGT subtest name.
>>  	 */
>> -	if (!subtest) {
>> +	if (!suite) {
>>  		subtest = strdup(module_name);
>>  		if (!igt_debug_on(!subtest)) {
>>  			char *suffix = strstr(subtest, "_test");
>> @@ -1216,6 +1216,8 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>  			if (suffix)
>>  				*suffix = '\0';
>>  		}
>> +	} else {
>> +		subtest = strdup(suite);
>
>NIT: For me it would be still more readable if we reverted the condition and
>reordered the bodies of this conditional construct.

agreed

>
>Anyway,
>
>Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

thanks
Lucas De Marchi

>
>Thanks,
>Janusz
>
>>  	}
>>
>>  	/* We need the base KUnit module loaded if not built-in */
>> @@ -1262,6 +1264,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>  		igt_ktest_end(&tst);
>>  	}
>>
>> +	free(subtest);
>>  	igt_ktest_fini(&tst);
>>  }
>>
>>
>
>
>
>
