Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C6710E0BF
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 08:26:14 +0000 (UTC)
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Sep 2022 08:26:09 +0000
Message-ID: <MWHPR11MB1423D9B8D9A19B365157F69CDA559@MWHPR11MB1423.namprd11.prod.outlook.com>
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
 <20220926185321.2897136-3-kunal1.joshi@intel.com>
 <DM4PR11MB6312372FA487D843C9D6705A90559@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312372FA487D843C9D6705A90559@DM4PR11MB6312.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v1 2/5] tests/i915/kms_pipe_b_c_ivb.c:
 test cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

>> +	/*
>> +	 * Reset basic pipes, connectors and planes on
>> +	  * @display back to default values.
>> +	 */
>> +	igt_display_reset(&data->display);
>>
>> Can we call this inside fixture ?=20
>>
>> Thanks
>> Jeevan B=20

Hello Jeevan,

Idea was to reset the state before starting the test
Since this reset is inside the subtest igt_fixture isn't required.

Thanks and Regards
Kunal Joshi
