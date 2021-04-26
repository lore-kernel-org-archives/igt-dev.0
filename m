Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C9389DA9
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Apr 2021 09:24:22 +0000 (UTC)
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Date: Mon, 26 Apr 2021 09:24:18 +0000
Message-ID: <a9ce21d414bd40c3bc2bd88124d458d1@intel.com>
References: <20210426081208.12586-1-kunal1.joshi@intel.com>
 <20210426081208.12586-4-kunal1.joshi@intel.com>
 <YIaCxYZl9xAlI9kW@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YIaCxYZl9xAlI9kW@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] Added a subtest where chamelium
 acts as a tiled panel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

>> +#ifdef HAVE_CHAMELIUM
>> +static void test_with_chamelium(data_t *data) {
>> +	int i, count = 0;
>> +	uint8_t htile = 2, vtile = 1;
>> +	struct edid **edid;
>> +
>> +	data->chamelium = chamelium_init(data->drm_fd);
>> +	igt_assert(data->chamelium);

>igt_require here, not igt_assert.
>-
>Petri Latvala

Corrected this, Thanks petri

 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
