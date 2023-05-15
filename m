Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Mon, 15 May 2023 14:36:28 +0100
Message-Id: <20230515133630.2163170-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] gputop/intel_gpu_top: Move name to be
 the last field
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Rob,

I thought maybe when you add memory stats the same field order like top(1)
would feel more natural? That is client name comes last and is left justified.
All other stats then come in the middle, between PID and NAME.

DRM minor 0
    PID     render         copy         video     video-enhance  NAME
   2704 |▌           ||            ||            ||            | kwin_x11
   2734 |▏           ||            ||            ||            | plasmashell
   3932 |            ||            ||            ||            | krunner
   4414 |            ||            ||            ||            | xdg-desktop-por
1999477 |            ||            ||            ||            | firefox
2162094 |            ||            ||            ||            | thunderbir

intel-gpu-top: Intel Alderlake_s (Gen12) @ /dev/dri/card0 -   15/  15 MHz
    99% RC6;  0.01/ 5.46 W;       34 irqs/s

         ENGINES     BUSY                                        MI_SEMA MI_WAIT
       Render/3D    1.31% |▌                                   |      0%      0%
         Blitter    0.00% |                                    |      0%      0%
           Video    0.00% |                                    |      0%      0%
    VideoEnhance    0.00% |                                    |      0%      0%

    PID   Render/3D      Blitter        Video      VideoEnhance  NAME
   2734 |▏           ||            ||            ||            | plasmashell
   2704 |▏           ||            ||            ||            | kwin_x11
   1837 |▏           ||            ||            ||            | Xorg
3429732 |            ||            ||            ||            | kwrite
2162094 |            ||            ||            ||            | thunderbird

Cc: Rob Clark <robdclark@chromium.org>

Tvrtko Ursulin (2):
  gputop: Move client name last
  intel_gpu_top: Move client name last

 tools/gputop.c        | 19 +++++++++----------
 tools/intel_gpu_top.c | 19 +++++++++----------
 2 files changed, 18 insertions(+), 20 deletions(-)

-- 
2.37.2
