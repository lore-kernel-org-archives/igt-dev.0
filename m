Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 1 Jun 2021 16:41:28 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YLY5CH3OxmkI1/Qw@platvala-desk.ger.corp.intel.com>
References: <1622547939-8157-1-git-send-email-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622547939-8157-1-git-send-email-vidya.srinivas@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] [RFC] tests/kms_plane_alpha_blend: Fix
 coverage-vs-premult-vs-constant tests
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
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 01, 2021 at 05:15:39PM +0530, Vidya Srinivas wrote:
> tests/kms_plane_alpha_blend: Fix coverage-vs-premult-vs-constant tests
>
> Few Gen11 systems show CRC mismatch. Make coverage-vs-premult-vs-constant
> code similar to constant_alpha_min or basic_alpha
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>


Please make the first line of the commit message a statement that
tells what change you're making, and in the full text block state why
that's done. "Fix a-b-c tests" is useless later when browsing oneliner
git logs. It doesn't even tell which problem is fixed.

Meaning, something like:


==
tests/kms_plane_alpha_blend: Don't set primary fb color in coverage-vs-premult-vs-constant

Similar change has already been done in tests xxx and yyy.
This fixes CRC mismatches seen with some Gen11 systems.

Signed-off-by etc
==


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
