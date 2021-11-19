Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 19 Nov 2021 13:55:00 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YZeQlGUMhb0RLiU1@platvala-desk.ger.corp.intel.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116003042.439107-1-robdclark@gmail.com>
Subject: Re: [igt-dev] [PATCH igt v3 0/4] msm: Add tests for gpu fault
 handling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 04:30:38PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The first patch adds a easy way to write debugfs files (needed to
> disable hw fault detection, so we can test the sw timeout fallback).
> The second adds some helpers for cmdstream building.  And the third
> adds the new tests.
> 
> v2: Fix headerdoc comments in first patch
> v3: Add helper to detect debugfs files and updated last patch
>     to skip the one sub-test that depends on new debugfs when
>     running on older kernels
> 
> Rob Clark (4):
>   lib/igt_debugfs: Add helper for writing debugfs files
>   lib/igt_debugfs: Add helper for detecting debugfs files
>   msm: Add helper for cmdstream building and submission
>   msm: Add recovery tests

For patches 3+4, in case you're waiting for this:
Acked-by: Petri Latvala <petri.latvala@intel.com>

For the record, msm-specific test case changes don't need to wait for
review (see single contributor exception in CONTRIBUTING.md).


-- 
Petri Latvala
