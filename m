Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5586C47DB3
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 17:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16CF10E872;
	Thu, 18 Jan 2024 17:22:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64F810E88B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705598546; x=1737134546;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JJmis+R+yEvgtsk9dNveKUF0eCii9oqkmXeaoJatjpo=;
 b=HJcYYBkwnhnuAHGdbl5N0dxjj9DA8g2XlHDwO2lCzAkJCCG6zafISf6+
 2jFhaGexWVDOHYzG/wCzlFP7R6T5t4ixBsW3/+pOJ5nlvXfI2nFEDAZe/
 yhHOjSUsUqz5MUc0H4x1PX8m2xbaPkfVK5nWL+01YIs9/HyT7Ztal5OnA
 N3JxGzP0eTbTInBmXXVA+fmzPPy7VeweFvUeUiq1Ke8eLbB/BpwP5Qs1t
 jztczAZ8L0skARRUr5m6qq1o+C67x7mC2xSsFPRNmZneSv25s2KHh8v/p
 2v9Wlrx1n5R1le1gmZ32eh3WGOHmjs/DoxOgFCVORkD3eyun/SOJXAWaT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7891299"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7891299"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 09:22:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="928169377"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="928169377"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 09:22:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 09:22:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 09:22:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 09:22:24 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 09:22:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEROIlsqLMIlqziRlSfIJJtMmxgdcmhevzpklzNzsjYCFCz7VHBDiemkUomhM6pogo9zRiUvgDLO49Bgq2WuEVGa4a93qj0V+PCtvc5OJK4O4ML9oTyU9dqKaiLMRJdv8NxYj57VxEkYcx5Wpf7zKq30I3xu7HZsyKQiCZRGQrV7ZetMmAx4EKVYN0EQ9VXAhcANyrEI2mcizKLbM40sp7WFwRvU5+QbfkEo6yJvKVP/L4Dgmn8Ap8sgjYXjt43NJ/MrWSPc39QMzldbvlQzkunAqmeeTZqK5aS7j0UVyP7M8ZPCIrPnznGo91bmTA/LW5iI/8XPboxNjDKW0i7fHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHiHkcWfwTq5biRNj4SRFg0Zr8gYt6e7ieSVIy4e6Lo=;
 b=VzQlsItg0oz8hY/S2RzqggufanfaVE/4L/aSv2l7JizfwHJUs+DS25msBWHjJeESGzyd2K0ZszpBzXpVM7nrEEddOgaj5XietCIJ10qeZoS39PZoRgmk3VsuoFE83fWRInX0ihbV6u8cGKPy7sbOkv1y/yrFIB2aEkx6XjjZOk26rtfDnzq2V+fh57TNK7se+OT5RNvGqdwL+vQl2QA4Rxl3KB1IHkkMs4hyn9xDMvq/l9nyrxBZ4UTylrhVeFNiLWheLbheleq6wXFIrlS6M5tqN6Cmmpj2V6pXQf3UU1+vLRGTcq4zgHxzGGNTpSNt5hAXvptblLCODdbe1vT3LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB6146.namprd11.prod.outlook.com (2603:10b6:208:3ee::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 17:22:21 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 17:22:21 +0000
Message-ID: <27f5edf9-c19d-49fc-8b58-50e97d019559@intel.com>
Date: Thu, 18 Jan 2024 22:52:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_gt_freq: Skip GuC PC tests if
 SLPC not enabled
Content-Language: en-US
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20240118145636.1775115-1-badal.nilawar@intel.com>
 <20240118145636.1775115-3-badal.nilawar@intel.com>
 <CY5PR11MB6211CBD9D475EE9E5A0911C395712@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB6211CBD9D475EE9E5A0911C395712@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::33) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e1c055-d916-4fcc-0e2b-08dc184a079d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zwFx3DKBhzXr8tcnx3/ZI36ZGZaehQY3LuNwZtEMrLnffRef8KemwPA0+3ROdI2ethuSZgS9k+rag8c+so7+pCRevftcD4C4vx05BUZm0wzWISAPCZss/IkfsFnXGP1c+J/Rp4OSaI27t+MycYN+i5KuTgIHYS2oeRPfZmC0xSf69ssyUFRHWg6xkeYzN0v8TtXPT3aHR4gKZHPhnU3B2G781yY9iPZ4DWw2bdL59S1xXCNzXQ9e+HXRIwAb/iQ1dr2VnlvRVektOKrsI2EqwLiAG3oqJtEudWzQ1s8LQ3N+0Il1muKW3QwmN0hmi2Pu1C9ZC2ZBndsnG4wSUQ1HIDw3RMB4IRTw/TOaChZ/O5UVdTgx13ePz5Gw4F2RHLrQdypcOJaWgniibofQRZeIoZXgjKAwTNPLufcQ3l/AZY63jOZ2EnxpdM0rWXD9OYq4lt2fJyxoRoFNiG19ojD6V74eu1GeuWu9rWuqQhlCSp5Pii7KNcWjaI8A4sbjubm96v+fLY5OezY1TksUlxV3hI04baNAkE3ay70gAkF+KpTQzDq53TpxSMzfi+PdO5BMyVA5i5oDLfmgBpDTH3/XUaM2RpfqpHn5f8EZSafFGOJQiy4Tn4f9L9RogNRJ7gNPpcFMi5X5wEw3wSQ/t49FkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(31686004)(478600001)(66556008)(6506007)(83380400001)(6512007)(66476007)(316002)(6486002)(66946007)(54906003)(6666004)(2616005)(107886003)(26005)(110136005)(53546011)(4326008)(8936002)(8676002)(5660300002)(2906002)(82960400001)(38100700002)(31696002)(86362001)(36756003)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUFPMWp1Vm5adzlsb3MrakpsdTlPcWZRemxDbGFhd1FvZENLS25Pb0JUVUoy?=
 =?utf-8?B?SDl3NGlaVGhrYmtLSzhlVkhSZVFBOTd6U2xLSys4SVNORytkUWNKWlNaZ3cz?=
 =?utf-8?B?Q215RkpXb1RTbzRoTFhUKys1dWZCeE5nQ28yUlRsYmNYcWlGRmhiS3FtdW1C?=
 =?utf-8?B?eVNuU2gxT2lzT2hBOGZaREFPaU4zZ0NRU2d6T2VYR3h1cnFCVllDazNwRWc5?=
 =?utf-8?B?aFNOOTJLZ09UT2Y3SldLZWw4Mjhqb1VBdG9qR2NkY3VvM3A2U3BrSFVISVlC?=
 =?utf-8?B?VHZsb0l1UFlkbndoVHVuR0ZPdy9FUm05cHQyQmwvTTZzZW8xV29LajZkTnBI?=
 =?utf-8?B?Z0QvTUErN2JOc21KSTdTTjlJTXM4QmJJdU12aFVYRVZSbFRWd0JKREt6dW5I?=
 =?utf-8?B?OFQwMFVKbkg5YnJhVVBoeFdwWGxadGFXQjU5ZW1QWmlBTEVjRWh5QUR0dkI4?=
 =?utf-8?B?dW94bDRtbFR6OEY3NWRDQkMvdUhabkRsK2ErbVIvMDU5S3VQaEsrMEEwVmZS?=
 =?utf-8?B?dEI5Q2RYK3hoc0FjczB6TStBWjlrSUlPMmdIa2hnbmFoLzNEazBhZ3BBenlN?=
 =?utf-8?B?YnZaak8rYnpMa21od09WbGtDeHFvaXd4OVRGNWR4eElMc1pDSnZNMVNOQ0hu?=
 =?utf-8?B?dXpTSzBEQ1BZaHZXSjFsV3RCRnNZeEJJNElza25kNkJ2dDlDRnkrYm9pbEhN?=
 =?utf-8?B?a1I2R2xxbUc0SjgrSC90U2xlbHJDT1JpYlVnOFdzRGhKcDZFMHgyTitjaUF6?=
 =?utf-8?B?aHN6dUtIY3A0WEtPakdFK3h0T1ErSFp0Yk1KL2VwZVFCckljRkU2M2VZdGtt?=
 =?utf-8?B?TG1VeDN0Ui9yclRqRGxQVmpUNGFQTWpEbCt3cnBaM1drWXdjcDZkNWVxSU1p?=
 =?utf-8?B?cVBoZkRycWcvSG5CR1dreFdVVjExTk9TVDA1WWllTjlhM0dOSWw0bmM1TDNO?=
 =?utf-8?B?R2I2Uit6RURSNEtKdjN0R1E3R1FIOFhGU2R0RnBWamFoOHR5ZFdOazZFSW1F?=
 =?utf-8?B?aE1SRUthVTNYalJaUzh3NkpGSzJ4dFRBam84MjJFMGxTWTIyaks4M3ZhZGE4?=
 =?utf-8?B?bnhlY1p6S1RLU1M1Y255U0hFN241WDMrU09EZExIL2Ftalo4QndidXZRY3hT?=
 =?utf-8?B?YVA5dlkvUzFLSUU2SWxrVXlLVURncmtGZ3d3WVNDemFjNDVjTGxpT2ttS0Nr?=
 =?utf-8?B?TzBzUDkxMERxWndBSUFSZ0pRZTdJalBnSmFxWEVidk1weVFSbXVrM0pSOE5w?=
 =?utf-8?B?UTJId0JJK3poUEJCOE9uNVFJMXh4clRUcVgyd3krQ3hRUUdKbnNrRE9teUVx?=
 =?utf-8?B?U0VkcnVGSjYzTURWOUJJUXMzZW1mWm8yYVJmMjhDNzMzRWg2ODBMNFE0RkhX?=
 =?utf-8?B?c3poZjVucWkwWlFrM245VlRHVk1HNThDeEM0VVM5bTQ4QWZvR1ZoN0E5NmdT?=
 =?utf-8?B?cjkrYktVNFdaUVo1NjBlVjYrSDJFSmdXWHU4aUkrSlZReGtuR2tGRUFBbWEv?=
 =?utf-8?B?NjVxNHI0MUF1bmFnYVhPYjJPY2FGbFNROTNtbEJLRTdGR2dJWUsvZUR5SGN1?=
 =?utf-8?B?WHF1WXFKY1ZzeWtPQXl3R3Y2d2VxWWU0UTBPV0lNVDhJMmtLcWszeUp1Z2xS?=
 =?utf-8?B?aWI1WThScWQrWlcxekdWU0E0ZDBuS0JpM0djUzVOTnZtbUpQVXVGSFRVNzc0?=
 =?utf-8?B?L01MYTFERmtVWmlKUFptaXRSYnUyaGN3QzdUenBBL05OTmlqN0NNMmhIZzg2?=
 =?utf-8?B?R3ZmQm5IU1RVWHhGTEdCOGhqMHppMXBnK3F0SFZNcmowdEt3UXp4V2tYL1NY?=
 =?utf-8?B?ZEUzb0dodXNuSDlPbjQ1blkvOHZSeG9VeVljN2xHMXBsc2ZCcTJKSFNucUpx?=
 =?utf-8?B?Z3VlbFE5SjJrNm82bkpkU1FnL3RwaklPL2Z1UlhyRWJpaGdXY3FYZDRrUHd0?=
 =?utf-8?B?a2k0ald4RU5xcHNhZ1RYMCtjVzdIMjJ1ZHI0cGNwa3A2cnBqcTloNVU3RDdv?=
 =?utf-8?B?VWd4ejh6QUFjMFJlNThCeXBrOGFQNWtKbmc2MWVMZnhDT0RBVmQyaGZnMURY?=
 =?utf-8?B?aXIvZWZEQk1zRTVjUUNNTEhQbnBiSFU2T1psN3hEcWVaUGpoV21LWlAvRWNk?=
 =?utf-8?B?WEhLLzRpbTVOWFRxclNHcmdvd0dwZUlHc3ZSd2drUTcrL0ovb1JxZCtuVHdq?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e1c055-d916-4fcc-0e2b-08dc184a079d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 17:22:21.7195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bO6Igf0Zq5ZOb9heD3Helljk4Z0S9+XX9NoMuYrcGGIM+oFcw5myIOGnQ3m+OktvhZm9tE1uQxJTDPqaFkwUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6146
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>



On 18-01-2024 21:40, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Nilawar, Badal <badal.nilawar@intel.com>
>> Sent: Thursday, January 18, 2024 8:27 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
>> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
>> Subject: [PATCH i-g-t 2/2] tests/intel/xe_gt_freq: Skip GuC PC tests if SLPC not
>> enabled
>>
>> Skip GuC PC tests if SLPC is disabled
>>
>> Fixes: acaaca0bf317 ("tests/xe: Add Xe IGT tests")
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   tests/intel/xe_gt_freq.c | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c index
>> bf63e4298..853720297 100644
>> --- a/tests/intel/xe_gt_freq.c
>> +++ b/tests/intel/xe_gt_freq.c
>> @@ -20,6 +20,7 @@
>>   #include "xe/xe_query.h"
>>   #include "xe/xe_util.h"
>>
>> +#include <fcntl.h>
>>   #include <string.h>
>>   #include <sys/time.h>
>>
>> @@ -319,6 +320,30 @@ static void test_reset(int fd, int gt_id, int cycles)
>>   	}
>>   }
>>
>> +static bool xe_is_slpc_enabled_gt(int drm_fd, int gt) {
>> +	int gt_fd;
>> +	int freq_fd;
>> +
>> +	gt_fd = xe_sysfs_gt_open(drm_fd, gt);
>> +	igt_assert(gt_fd >= 0);
>> +
>> +	/*
>> +	 * When SLPC disabled xe kmd doesn't create sysfs freq entries
>> +	 * so its enough to check one of the entry present of not
>> +	 */
>> +	freq_fd = openat(gt_fd, "freq0/max_freq", O_RDONLY);
> 	This is not scalable  solution for future platform, which are not using slpc. Such platform can still support frequency telemetry.
In that case we should have new sysfs entry to check platform support SLPC.

Thanks,
Badal
> 	Thanks,
> 	Anshuman.
>> +
>> +	close(gt_fd);
>> +
>> +	if (freq_fd < 0)
>> +		return false;
>> +
>> +	close(freq_fd);
>> +
>> +	return true;
>> +}
>> +
>>   igt_main
>>   {
>>   	int fd;
>> @@ -329,6 +354,9 @@ igt_main
>>   	igt_fixture {
>>   		fd = drm_open_driver(DRIVER_XE);
>>
>> +		igt_skip_on_f(!xe_is_slpc_enabled_gt(fd, 0),
>> +			      "GuC PC tests are not supported when SLPC is
>> disabled\n");
>> +
>>   		/* The defaults are the same. Stashing the gt0 is enough */
>>   		stash_min = get_freq(fd, 0, "min");
>>   		stash_max = get_freq(fd, 0, "max");
>> --
>> 2.25.1
> 
