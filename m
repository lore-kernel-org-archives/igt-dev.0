Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FA711B5E5
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 11:09:14 +0000 (UTC)
Message-ID: <30633900-ae9f-8eb0-3d87-668d57ac055d@linux.intel.com>
Date: Thu, 28 Jul 2022 12:09:10 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220726072802.708006-1-petri.latvala@intel.com>
 <917e675f-f6bf-983f-46b5-5713d8d5e175@linux.intel.com>
 <YuJpIM9gb0lgSi+2@platvala-desk.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <YuJpIM9gb0lgSi+2@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests: Avoid the name "all"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 28/07/2022 11:46, Petri Latvala wrote:
> On Tue, Jul 26, 2022 at 10:01:32AM +0100, Tvrtko Ursulin wrote:
>>
>> On 26/07/2022 08:28, Petri Latvala wrote:
>>> If using a subtest or a dynamic subtest name "all", the piglit format
>>> name will contain the string "@all". When filing bugs for test
>>> failures, one needs extra care not to accidentally ping every
>>> developer on gitlab.
>>
>> Three questions:
>>
>> 1)
>> What if someone adds a subtest called all tomorrow or next year?
> 
> You're saying it should be a build-time error? Can be done.

Asking suggestive questions to start with..

>> 2)
>> Are there other keywords with unintended side-effects?
> 
> Usernames and group names. I hope no one makes a subtest "drm"...
> 
>>
>> 3)
>> Is there a component sitting between the IGT output and putting it into
>> GitLab which would be ideally placed to sanitize and do that reliably and
>> with less maintenance effort?
> 
> Not really. In this particular instance the @all mention was in the
> bug title, which is hand crafted with a human-followed naming
> convention.

..because I can think of various (flawed) solutions, but the only 
correct one in my view is to do it at the layer you say does not exist - 
the human layer inputting data to GitLab. Oh well, scratch a future 
proof low-maintenance option in that case.

Regards,

Tvrtko

P.S. However clunky it may be - could add some asserts to library code 
to at least serve as early warning against 'all' and 'drm'? Build or 
runtime is fine, as long as it notifies before the test becomes part of CI.

P.P.S In the bug title really? Markup/mentions are allowed in bug 
titles? That's funny.
