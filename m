Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B8810E0DE
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 14:45:01 +0000 (UTC)
Message-ID: <b3ab6ce7-779f-e5b8-f8f1-edbd4ecdfab9@intel.com>
Date: Fri, 20 Jan 2023 20:14:56 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
References: <20230119092530.3780-1-swati2.sharma@intel.com>
 <167412090917.24699.17286406614555406519@emeril.freedesktop.org>
 <Y8qizioRTTLtHPwU@platvala-desk.ger.corp.intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <Y8qizioRTTLtHPwU@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/i915/kms=5Fdsc=3A_Reorg_=28rev2=29?=
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



On 20-Jan-23 7:48 PM, Petri Latvala wrote:
> On Thu, Jan 19, 2023 at 09:35:09AM +0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: tests/i915/kms_dsc: Reorg (rev2)
>> URL   : https://patchwork.freedesktop.org/series/113045/
>> State : warning
>>
>> == Summary ==
>>
>> Pipeline status: FAILED.
>>
>> see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/787716 for the overview.
>>
>> build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35013257):
>>    /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
>>      uint32_t lessees[0];
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
>>      uint32_t count;
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
>>      uint32_t objects[0];
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’; did you mean ‘intptr_t’?
>>     extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
>>                                           ^~~~~~~~
>>                                           intptr_t
>>    ninja: build stopped: subcommand failed.
>>    section_end:1674120610:step_script
>>    section_start:1674120610:cleanup_file_variables
>>    Cleaning up project directory and file based variables
>>    section_end:1674120611:cleanup_file_variables
>>    ERROR: Job failed: exit code 1
>>    
>>
>> build:tests-debian-meson-arm64 has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35013260):
>>    /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
>>      uint32_t lessees[0];
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
>>      uint32_t count;
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
>>      uint32_t objects[0];
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’; did you mean ‘intptr_t’?
>>     extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
>>                                           ^~~~~~~~
>>                                           intptr_t
>>    ninja: build stopped: subcommand failed.
>>    section_end:1674120611:step_script
>>    section_start:1674120611:cleanup_file_variables
>>    Cleaning up project directory and file based variables
>>    section_end:1674120612:cleanup_file_variables
>>    ERROR: Job failed: exit code 1
>>    
>>
>> build:tests-debian-meson-armhf has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35013259):
>>    /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
>>      uint32_t lessees[0];
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
>>      uint32_t count;
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
>>      uint32_t objects[0];
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’; did you mean ‘intptr_t’?
>>     extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
>>                                           ^~~~~~~~
>>                                           intptr_t
>>    ninja: build stopped: subcommand failed.
>>    section_end:1674120610:step_script
>>    section_start:1674120610:cleanup_file_variables
>>    Cleaning up project directory and file based variables
>>    section_end:1674120611:cleanup_file_variables
>>    ERROR: Job failed: exit code 1
>>    
>>
>> build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35013261):
>>    /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
>>      uint32_t lessees[0];
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
>>      uint32_t count;
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
>>      uint32_t objects[0];
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’; did you mean ‘intptr_t’?
>>     extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
>>                                           ^~~~~~~~
>>                                           intptr_t
>>    ninja: build stopped: subcommand failed.
>>    section_end:1674120608:step_script
>>    section_start:1674120608:cleanup_file_variables
>>    Cleaning up project directory and file based variables
>>    section_end:1674120609:cleanup_file_variables
>>    ERROR: Job failed: exit code 1
>>    
>>
>> build:tests-debian-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35013258):
>>    /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
>>      uint32_t lessees[0];
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
>>      uint32_t count;
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
>>      uint32_t objects[0];
>>      ^~~~~~~~
>>    /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’; did you mean ‘intptr_t’?
>>     extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
>>                                           ^~~~~~~~
>>                                           intptr_t
>>    ninja: build stopped: subcommand failed.
>>    section_end:1674120605:step_script
>>    section_start:1674120605:cleanup_file_variables
>>    Cleaning up project directory and file based variables
>>    section_end:1674120606:cleanup_file_variables
>>    ERROR: Job failed: exit code 1
>>    
>>
>> build:tests-fedora has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35013252):
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
>>      533 |  uint32_t lessees[0];
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
>>      539 |  uint32_t count;
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
>>      540 |  uint32_t objects[0];
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
>>      545 | extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
>>          |                                       ^~~~~~~~
>>    ninja: build stopped: subcommand failed.
>>    section_end:1674120609:step_script
>>    section_start:1674120609:cleanup_file_variables
>>    Cleaning up project directory and file based variables
>>    section_end:1674120610:cleanup_file_variables
>>    ERROR: Job failed: exit code 1
>>    
>>
>> build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35013256):
>>            uint32_t bpp;
>>            ^
>>    /usr/include/xf86drmMode.h:221:2: error: unknown type name 'uint32_t'
>>            uint32_t depth;
>>            ^
>>    /usr/include/xf86drmMode.h:223:2: error: unknown type name 'uint32_t'
>>            uint32_t handle;
>>            ^
>>    /usr/include/xf86drmMode.h:229:2: error: unknown type name 'uint32_t'
>>            uint32_t id;
>>            ^
>>    fatal error: too many errors emitted, stopping now [-ferror-limit=]
>>    20 errors generated.
>>    ninja: build stopped: subcommand failed.
>>    section_end:1674120615:step_script
>>    section_start:1674120615:cleanup_file_variables
>>    Cleaning up project directory and file based variables
>>    section_end:1674120615:cleanup_file_variables
>>    ERROR: Job failed: exit code 1
>>    
>>
>> build:tests-fedora-no-libdrm-nouveau has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35013255):
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
>>      533 |  uint32_t lessees[0];
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
>>      539 |  uint32_t count;
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
>>      540 |  uint32_t objects[0];
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
>>      545 | extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
>>          |                                       ^~~~~~~~
>>    ninja: build stopped: subcommand failed.
>>    section_end:1674120606:step_script
>>    section_start:1674120606:cleanup_file_variables
>>    Cleaning up project directory and file based variables
>>    section_end:1674120606:cleanup_file_variables
>>    ERROR: Job failed: exit code 1
>>    
>>
>> build:tests-fedora-no-libunwind has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35013253):
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
>>      533 |  uint32_t lessees[0];
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
>>      539 |  uint32_t count;
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
>>      540 |  uint32_t objects[0];
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
>>      545 | extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
>>          |                                       ^~~~~~~~
>>    ninja: build stopped: subcommand failed.
>>    section_end:1674120608:step_script
>>    section_start:1674120608:cleanup_file_variables
>>    Cleaning up project directory and file based variables
>>    section_end:1674120608:cleanup_file_variables
>>    ERROR: Job failed: exit code 1
>>    
>>
>> build:tests-fedora-oldest-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/35013254):
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
>>      533 |  uint32_t lessees[0];
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
>>      539 |  uint32_t count;
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:540:2: error: unknown type name ‘uint32_t’
>>      540 |  uint32_t objects[0];
>>          |  ^~~~~~~~
>>    /usr/include/xf86drmMode.h:545:39: error: unknown type name ‘uint32_t’
>>      545 | extern int drmModeRevokeLease(int fd, uint32_t lessee_id);
>>          |                                       ^~~~~~~~
>>    ninja: build stopped: subcommand failed.
>>    section_end:1674120610:step_script
>>    section_start:1674120610:cleanup_file_variables
>>    Cleaning up project directory and file based variables
>>    section_end:1674120611:cleanup_file_variables
>>    ERROR: Job failed: exit code 1
>>
>> == Logs ==
>>
>> For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/787716
> 
> Why was this series merged with these errors?
> 
Sorry, gitlab pipeline was ignored during merge. Revert sent 
https://patchwork.freedesktop.org/series/113154/
> 

-- 
~Swati Sharma
