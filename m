Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <10880dfa-f53b-0224-c339-fd3d9c867ecd@linux.intel.com>
Date: Fri, 27 Jan 2023 13:41:20 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Petri Latvala <petri.latvala@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20221111155844.3290531-1-tvrtko.ursulin@linux.intel.com>
 <20230126170209.5a5dqpqktal6jrjc@kamilkon-desk1>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230126170209.5a5dqpqktal6jrjc@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 0/8] Vendor agnostic gputop
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


On 26/01/2023 17:02, Kamil Konieczny wrote:
> Hi,
> 
> please rebase and resend, also please change commit subject to start
> with lib: or lib/[name of lib changed]: rest od commit description

Series should still apply as is so I don't think there is need to 
re-send. It will only conflict if I get to merge the "Assorted 
intel_gpu_top improvements" series first, in which case I can resend.

> For example, in 3/8 instead of
> libdrmclients: Record client drm minor
> write:
> lib/igt_drm_clients: Record client drm minor
> 
> If there are more lib changes, use "lib: " alone, for example
> in your 2/8 patch,
> libdrmfdinfo: Allow specifying custom engine map
> write:
> lib: Allow specifying custom engine map

Again, if you agree there is no need to spam the list with a re-send 
yet, review can continue against this version, and I will note to change 
the above patch prefixes while doing the other changes the review is 
bound to trigger.

Regards,

Tvrtko

> 
> +Cc Petri and Zbyszek
> 
> Regards,
> Kamil
> 
> On 2022-11-11 at 15:58:36 +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> This is a pile of patches which implements a rudimentary vendor agnostic gputop
>> tool based of the new DRM spec as documented in
>> Documentation/gpu/drm-usage-stats.rst.
>>
>> First part of the series is code refactoring which should be reasonably stable.
>> I've tested it all while working on it both against intel_gpu_top and gputop.
>>
>> Last patch is the actual tool itself. It works but it is rather rudimentary
>> which is hopefully good enough for a start.
>>
>> Fundamental difference between intel_gpu_top and gputop is that the former is
>> centered around a single card and only shows processes belonging to it. Gputop
>> on the other hand has an idea to show all processes with DRM file descriptors
>> open and sort them into groups per card. It also makes no effort to provide
>> sorting modes, well any interactivity, or any pretty names for GPUs or engines.
>>
>> It looks like this:
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> DRM minor 0
>>      PID               NAME    render       copy       video
>>      3816          kwin_x11 |███▎      ||          ||          ||          |
>>      3523              Xorg |▊         ||          ||          ||          |
>>   1120449               mpv |          ||          ||▋         ||          |
>>   1120529          glxgears |▋         ||          ||          ||          |
>>   1120449               mpv |▍         ||          ||          ||          |
>>      3860       plasmashell |▏         ||          ||          ||          |
>>      4764           krunner |          ||          ||          ||          |
>>    575206            chrome |          ||          ||          ||          |
>>    833481           firefox |          ||          ||          ||          |
>>    892924       thunderbird |          ||          ||          ||          |
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> I did test it as well with two cards and confirmed that too works.
>>
>> Rob Clark also tested it with a patch which exports the respective data from the
>> msm driver and confirmed it works fine. Christian König tested it with in
>> progress patches for amdgpu and that worked as well.
>>
>> v2:
>>   * Fixed SPDX headers and added a bunch of code comments/docs throughout.
>>
>> Tvrtko Ursulin (8):
>>    lib: Extract igt_drm_clients from intel_gpu_top
>>    libdrmfdinfo: Allow specifying custom engine map
>>    libdrmclients: Record client drm minor
>>    libdrmclient: Support multiple DRM cards
>>    libdrmfdinfo: Track largest engine index
>>    libdrmclient/intel_gpu_top: Decouple hardcoded engine assumptions
>>    libdrmclient: Enforce client status sort order in the library
>>    gputop: Basic vendor agnostic GPU top tool
>>
>>   lib/igt_drm_clients.c   | 503 +++++++++++++++++++++++++++++
>>   lib/igt_drm_clients.h   |  87 ++++++
>>   lib/igt_drm_fdinfo.c    |  50 ++-
>>   lib/igt_drm_fdinfo.h    |  16 +-
>>   lib/meson.build         |   8 +
>>   tests/i915/drm_fdinfo.c |  19 +-
>>   tools/gputop.c          | 260 +++++++++++++++
>>   tools/intel_gpu_top.c   | 677 +++++++++++-----------------------------
>>   tools/meson.build       |   7 +-
>>   9 files changed, 1113 insertions(+), 514 deletions(-)
>>   create mode 100644 lib/igt_drm_clients.c
>>   create mode 100644 lib/igt_drm_clients.h
>>   create mode 100644 tools/gputop.c
>>
>> -- 
>> 2.34.1
>>
