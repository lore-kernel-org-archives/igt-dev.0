Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45826E07D
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Sep 2021 14:05:56 +0000 (UTC)
References: <20210927160700.1570885-1-aurabindo.pillai@amd.com>
 <CAJUqKUpwJfdU+=jO5=atomxwu4d-KXRSN0gEppQhWdK9CqtNaQ@mail.gmail.com>
 <DM4PR12MB5295DB9A15801BDE6F78D3AB8BA79@DM4PR12MB5295.namprd12.prod.outlook.com>
 <CAJUqKUoXc4g8QCKUBJAi5opMD31KW7ei2o2mA9ozHF0UV9qSFg@mail.gmail.com>
 <DM4PR12MB529578D5A447184B322867638BA79@DM4PR12MB5295.namprd12.prod.outlook.com>
 <YVLdSqQs7ok5+PIX@platvala-desk.ger.corp.intel.com>
 <0e047200-f40a-daa8-80d8-4745da3b9430@amd.com>
 <YVMeQSv4SOgPhN6f@platvala-desk.ger.corp.intel.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
Message-ID: <0aadb8c4-1329-4241-a65a-1348c7b5b692@amd.com>
Date: Tue, 28 Sep 2021 10:05:49 -0400
In-Reply-To: <YVMeQSv4SOgPhN6f@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest bo-too-big
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: Mark Yacoub <markyacoub@chromium.org>, Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Mark Yacoub <markyacoub@google.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 9/28/21 9:53 AM, Petri Latvala wrote:
> On Tue, Sep 28, 2021 at 09:35:10AM -0400, Aurabindo Pillai wrote:
>> On 9/28/21 5:15 AM, Petri Latvala wrote:
>>> On Mon, Sep 27, 2021 at 07:10:45PM +0000, Pillai, Aurabindo wrote:
>>>> Skipping using the continue statement has the side effect of this
>>>> subtest being absent from the list of subtests, when running the
>>>> test executable with paramter --list-subtest. Is that okay ?
>>> It's not okay btw. When you're not in an igt_fixture or an
>>> igt_subtest, you cannot use anything that touches the hardware or the
>>> running system in any way.
>>>
>>>
>> In that case, please discard v2. Is this version good enough ?
>>
>
> No objections with v1.
> Acked-by: Petri Latvala <petri.latvala@intel.com>


Thank you.
